using AutoMapper;
using SwiftShop_Core.Models;
using SwiftShop_Core.Repositories;
using SwiftShop_Services.Dtos.Common;
using SwiftShop_Services.Dtos.ProductDto;
using SwiftShop_Services.Exceptions;
using SwiftShop_Services.Helpers;
using SwiftShop_Services.Interfaces;

namespace SwiftShop_Services.Implementations
{
    public class ProductService : IProductService
    {
        private readonly IProductRepository _repository;
        private readonly IMapper _mapper;
        private readonly IBrandRepository _brandRepo;
        private readonly ICategoryRepository _categorieRepo;

        public ProductService(IProductRepository repository, IMapper mapper, IBrandRepository brandRepo, ICategoryRepository categorieRepo)
        {
            _repository = repository;
            _mapper = mapper;
            _brandRepo = brandRepo;
            _categorieRepo = categorieRepo;
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

            ProductImage poster = new ProductImage
            {
                ImageName = FileManager.Save(dto.PosterImageFile, rootPath, "uploads/products"),
                PosterStatus = true
            };

            entity.ProductImages.Add(poster);

            foreach (var img in dto.ImageFiles)
            {
                ProductImage image = new ProductImage
                {
                    ImageName = FileManager.Save(img, rootPath, "uploads/products"),
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
            var entity = _repository.Get(x => x.Id == id, "ProductImages");

            List<RestExceptionError> errors = new List<RestExceptionError>();

            if (!_repository.IsExist(x => x.Id == dto.CategoryId))
                errors.Add(new RestExceptionError("CategoryId", "CategoryId is not correct"));

            if (!_repository.IsExist(x => x.Id == dto.BrandId))
                errors.Add(new RestExceptionError("BrandId", "BrandId is not correct"));


            if (_repository.IsExist(x => x.Name == dto.Name))
                errors.Add(new RestExceptionError("Name", "Name is already exists"));

            if (errors.Count > 0) throw new RestException(System.Net.HttpStatusCode.BadRequest, errors);

            _repository.Add(_mapper.Map<Product>(dto));


            string removableFileName = null;
            string rootPath = Directory.GetCurrentDirectory() + "/wwwroot";

            if (dto.PosterImageFile != null)
            {
                removableFileName = entity.ProductImages.FirstOrDefault(x => x.PosterStatus == true).ImageName;
                entity.ProductImages.FirstOrDefault(x => x.PosterStatus == true).ImageName = FileManager.Save(dto.PosterImageFile, rootPath, "uploads/flowers");
            }
            if (removableFileName != null) FileManager.Delete(rootPath, "uploads/products", removableFileName);

            if (dto.ImageFiles != null)
            {
                removableFileName = entity.ProductImages.Where(x => x.PosterStatus == false).ToList().ToString();
                foreach (var img in dto.ImageFiles)
                {
                    entity.ProductImages.FirstOrDefault(x => x.PosterStatus == false).ImageName = FileManager.Save(img, rootPath, "uploads/flowers");
                    if (removableFileName != null) FileManager.Delete(rootPath, "uploads/products", removableFileName);
                }
            }
            _repository.Commit();
        }

        public List<ProductGetDto> GetAll()
        {
            var entities = _repository.GetAll(x => true, "FlowerImages");


            var dtos = _mapper.Map<List<ProductGetDto>>(entities);

            foreach (var dto in dtos)
            {
                var flowerImages = entities.FirstOrDefault(e => e.Id == dto.Id)?.ProductImages;
                dto.ImageName = flowerImages?.FirstOrDefault()?.ImageName;
            }


            return dtos;
        }

        public ProductGetByIdDto GetById(int id)
        {
            var entity = _repository.Get(x => x.Id == id, "FlowerImages", "Categorie");

            if (entity == null) throw new RestException(System.Net.HttpStatusCode.NotFound, "Flower not found");

            var dto = _mapper.Map<ProductGetByIdDto>(entity);
            dto.ImageNames = entity.ProductImages?.Select(image => image.ImageName).ToList();

            return dto;
        }
    }
}
