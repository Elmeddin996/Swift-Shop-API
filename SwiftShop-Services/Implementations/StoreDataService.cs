using AutoMapper;
using Microsoft.AspNetCore.Http;
using SwiftShop_Core.Models;
using SwiftShop_Core.Repositories;
using SwiftShop_Services.Dtos.Common;
using SwiftShop_Services.Dtos.StoreDataDto;
using SwiftShop_Services.Exceptions;
using SwiftShop_Services.Helpers;
using SwiftShop_Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SwiftShop_Services.Implementations
{
    public class StoreDataService : IStoreDataService
    {
        private readonly IStoreDataRepository _repository;
        private readonly IMapper _mapper;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public StoreDataService(IStoreDataRepository repository, IMapper mapper, IHttpContextAccessor httpContextAccessor)
        {
            _repository = repository;
            _mapper = mapper;
            _httpContextAccessor = httpContextAccessor;
        }
        public CreateEntityDto Create(StoreDataPostDto dto)
        {
            var entity = _mapper.Map<StoreData>(dto);

            string rootPath = Directory.GetCurrentDirectory() + "/wwwroot";
            entity.LogoImageName = FileManager.Save(dto.LogoImageFile, rootPath, "uploads/store-datas");
            entity.LogoImageLink = "uploads/store-datas/" + entity.LogoImageName;
            entity.EmptyBasketImageName = FileManager.Save(dto.EmptyBasketImageFile, rootPath, "uploads/store-datas");
            entity.EmptyBasketImageLink = "/uploads/store-datas/"+ entity.EmptyBasketImageName;


            _repository.Add(entity);
            _repository.Commit();

            return new CreateEntityDto { Id = entity.Id };
        }

        public void Edit(StoreDataPutDto dto)
        {
            var entity = _repository.Get(x => true);

            if (entity == null) throw new RestException(System.Net.HttpStatusCode.NotFound, "Store Data not found");

            var dtoProperties = dto.GetType().GetProperties();
            var entityProperties = entity.GetType().GetProperties();

            foreach (var dtoProperty in dtoProperties)
            {
                var entityProperty = entityProperties.FirstOrDefault(p => p.Name == dtoProperty.Name);

                if (entityProperty != null)
                {
                    var dtoValue = dtoProperty.GetValue(dto);
                    if (dtoValue != null)
                    {
                        entityProperty.SetValue(entity, dtoValue);
                    }
                }
            }

            string? oldLogoImgName = null;
            string? oldEmptyBasketImgName = null;
            string rootPath = Directory.GetCurrentDirectory() + "/wwwroot";

            if(dto.LogoImageFile!=null)
            {
              oldLogoImgName = entity.LogoImageName;
              entity.LogoImageName = FileManager.Save(dto.LogoImageFile, rootPath, "uploads/store-datas");
              entity.LogoImageLink = "/uploads/store-datas/" + entity.LogoImageName;
            }

            if(dto.EmptyBasketImageFile!=null)
            {
              oldEmptyBasketImgName = entity.EmptyBasketImageName;
              entity.EmptyBasketImageName = FileManager.Save(dto.EmptyBasketImageFile, rootPath, "uploads/store-datas");
              entity.EmptyBasketImageLink = "/uploads/store-datas/" + entity.EmptyBasketImageName;
            }
            _repository.Commit();

            if (oldLogoImgName != null) FileManager.Delete(rootPath, "uploads/store-datas", oldLogoImgName);
            if (oldEmptyBasketImgName != null) FileManager.Delete(rootPath, "uploads/store-datas", oldEmptyBasketImgName);
        }

        public StoreDataGetDto Get()
        {
            var entity = _repository.Get(x => true);
            string baseUrl = $"{_httpContextAccessor.HttpContext.Request.Scheme}://{_httpContextAccessor.HttpContext.Request.Host}";

            entity.EmptyBasketImageLink = baseUrl + entity.EmptyBasketImageLink;
            entity.LogoImageLink = baseUrl + entity.LogoImageLink;
            return _mapper.Map<StoreDataGetDto>(entity);

        }
    }
}
