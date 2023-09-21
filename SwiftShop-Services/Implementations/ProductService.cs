using AutoMapper;
using Microsoft.AspNetCore.Http;
using SwiftShop_Core.Models;
using SwiftShop_Core.Repositories;
using SwiftShop_Services.Dtos.Common;
using SwiftShop_Services.Dtos.ProductDto;
using SwiftShop_Services.Exceptions;
using SwiftShop_Services.Helpers;
using SwiftShop_Services.Interfaces;
using static System.Net.Mime.MediaTypeNames;

namespace SwiftShop_Services.Implementations
{
    public class ProductService : IProductService
    {
        private readonly IProductRepository _repository;
        private readonly IMapper _mapper;
        private readonly IBrandRepository _brandRepo;
        private readonly ICategoryRepository _categorieRepo;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public ProductService(IProductRepository repository, IMapper mapper, IBrandRepository brandRepo, ICategoryRepository categorieRepo, IHttpContextAccessor httpContextAccessor)
        {
            _repository = repository;
            _mapper = mapper;
            _brandRepo = brandRepo;
            _categorieRepo = categorieRepo;
            _httpContextAccessor = httpContextAccessor;
        }

        public CreateEntityDto Create(ProductPostDto dto)
        {
            List<RestExceptionError> errors = new List<RestExceptionError>();

            if (!_categorieRepo.IsExist(x => x.Id == dto.CategoryId))
                errors.Add(new RestExceptionError("CategorieId", "CategorieId is not correct"));

            if (!_brandRepo.IsExist(x => x.Id == dto.BrandId))
                errors.Add(new RestExceptionError("BrandId", "BrandId is not correct"));

            if (_repository.IsExist(x => x.Name == dto.Name))
                errors.Add(new RestExceptionError("Name", "Name is already exists"));

            if (errors.Count > 0) throw new RestException(System.Net.HttpStatusCode.BadRequest, errors);

            var entity = _mapper.Map<Product>(dto);

            string rootPath = Directory.GetCurrentDirectory() + "/wwwroot";
            string PostImgName = FileManager.Save(dto.PosterImageFile, rootPath, "uploads/products");
            ProductImage poster = new ProductImage
            {
                ImageName = PostImgName,
                ImageUrl = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "products", PostImgName),
                PosterStatus = true
            };

            entity.ProductImages.Add(poster);

            foreach (var img in dto.ImageFiles)
            {
                string imgName = FileManager.Save(img, rootPath, "uploads/products");

                ProductImage image = new ProductImage
                {
                    ImageName = imgName,
                    ImageUrl = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "products", imgName),
                    PosterStatus = false
                };
                entity.ProductImages.Add(image);
            }

            _repository.Add(entity);
            _repository.Commit();

            return new CreateEntityDto { Id = entity.Id };
        }


        public void Delete(int id)
        {
            var entity = _repository.Get(x => x.Id == id, "ProductImages");

            if (entity == null) throw new RestException(System.Net.HttpStatusCode.NotFound, "Product not found");

            _repository.Remove(entity);
            _repository.Commit();

            string rootPath = Directory.GetCurrentDirectory() + "/wwwroot";

            foreach (var img in entity.ProductImages)
            {
                FileManager.Delete(rootPath, "uploads/products", img.ImageName);
            }
        }

        public void Edit(int id, ProductPutDto dto)
        {
            var entity = _repository.Get(x => x.Id == id, "ProductImages","Brand","Category");

            List<RestExceptionError> errors = new List<RestExceptionError>();

            if (!_categorieRepo.IsExist(x => x.Id == dto.CategoryId))
                errors.Add(new RestExceptionError("CategoryId", "CategoryId is not correct"));

            if (!_brandRepo.IsExist(x => x.Id == dto.BrandId))
                errors.Add(new RestExceptionError("BrandId", "BrandId is not correct"));

            if (errors.Count > 0) throw new RestException(System.Net.HttpStatusCode.BadRequest, errors);


            string oldPoster = null;
            string rootPath = Directory.GetCurrentDirectory() + "/wwwroot";

            if (dto.PosterImageFile != null)
            {
                var postImg = entity.ProductImages.FirstOrDefault(x => x.PosterStatus == true);
                oldPoster = postImg.ImageName;
                postImg.ImageName = FileManager.Save(dto.PosterImageFile, rootPath, "uploads/products");
                postImg.ImageUrl= Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "products", postImg.ImageName);
            }


            var removedImages = entity.ProductImages.FindAll(x => x.PosterStatus == false);
            entity.ProductImages.RemoveAll(x => x.PosterStatus == false);

            if (dto.ImageFiles != null)
            {
                foreach (var img in dto.ImageFiles)
                {
                    var imageName = FileManager.Save(img, rootPath, "uploads/products");
                    ProductImage productImage = new ProductImage()
                    {
                        ImageName =imageName, 
                        ImageUrl = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "products", imageName)
                    };
                    entity.ProductImages.Add(productImage);
                }

            }

            entity.CostPrice = dto.CostPrice;
            entity.SalePrice =dto.SalePrice;
            entity.DiscountPercent = dto.DiscountPercent;
            entity.BrandId = dto.BrandId;
            entity.CategoryId = dto.CategoryId;
            entity.Name = dto.Name;
            entity.Description = dto.Description;

            _repository.Commit();


            if (oldPoster != null) FileManager.Delete(rootPath, "uploads/products", oldPoster);

             foreach (var img in removedImages)
             {
                    FileManager.Delete(rootPath, "uploads/products", img.ImageName);
             }
            
        }

        public List<ProductGetDto> GetAll()
        {
            var entities = _repository.GetAll(x => true, "ProductImages");


            var dtos = _mapper.Map<List<ProductGetDto>>(entities);

            foreach (var dto in dtos)
            {
                var productImages = entities.FirstOrDefault(e => e.Id == dto.Id)?.ProductImages;
                dto.ImageName = productImages?.FirstOrDefault()?.ImageName;
                dto.ImageUrl = productImages?.FirstOrDefault()?.ImageUrl;
            }


            return dtos;
        }

        public ProductGetByIdDto GetById(int id)
        {
            var entity = _repository.Get(x => x.Id == id, "ProductImages", "Category","Brand");

            if (entity == null) throw new RestException(System.Net.HttpStatusCode.NotFound, "Product not found");

            var dto = _mapper.Map<ProductGetByIdDto>(entity);
            dto.ImageNames = entity.ProductImages?.Select(image => image.ImageName).ToList();
            dto.ImageUrls = entity.ProductImages?.Select(image => image.ImageUrl).ToList();

            return dto;
        }
    }
}
