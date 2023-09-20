using AutoMapper;
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

        public StoreDataService(IStoreDataRepository repository, IMapper mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }
        public CreateEntityDto Create(StoreDataPostDto dto)
        {
            var entity = _mapper.Map<StoreData>(dto);

            string rootPath = Directory.GetCurrentDirectory() + "/wwwroot";
            entity.LogoImageName = FileManager.Save(dto.LogoImageFile, rootPath, "uploads/store-datas");
            entity.LogoImageLink = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "store-datas", entity.LogoImageName);
            entity.EmptyBasketImageName = FileManager.Save(dto.EmptyBasketImageFile, rootPath, "uploads/store-datas");
            entity.EmptyBasketImageLink = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "store-datas", entity.EmptyBasketImageName);


            _repository.Add(entity);
            _repository.Commit();

            return new CreateEntityDto { Id = entity.Id };
        }

        public void Edit(StoreDataPutDto dto)
        {
            var entity = _repository.Get(x => true);

            if (entity == null) throw new RestException(System.Net.HttpStatusCode.NotFound, "Store Data not found");

            //entity.Phone = dto.Phone;
            //entity.Address = dto.Address;
            //entity.CompanyName = dto.CompanyName;
            //entity.LogoText = dto.LogoText;
            //entity.WhatsappLink = dto.WhatsappLink;
            //entity.FacebookLink = dto.FacebookLink;
            //entity.InstagramLink = dto.InstagramLink;
            //entity.LinkedinLink = dto.LinkedinLink;

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
              entity.LogoImageLink = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "store-datas", entity.LogoImageName);
            }

            if(dto.EmptyBasketImageFile!=null)
            {
              oldEmptyBasketImgName = entity.EmptyBasketImageName;
              entity.EmptyBasketImageName = FileManager.Save(dto.EmptyBasketImageFile, rootPath, "uploads/store-datas");
              entity.EmptyBasketImageLink = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "store-datas", entity.EmptyBasketImageName);
            }
            _repository.Commit();

            if (oldLogoImgName != null) FileManager.Delete(rootPath, "uploads/store-datas", oldLogoImgName);
            if (oldEmptyBasketImgName != null) FileManager.Delete(rootPath, "uploads/store-datas", oldEmptyBasketImgName);
        }

        public StoreDataGetDto Get()
        {
            var entity = _repository.Get(x => true);
            return _mapper.Map<StoreDataGetDto>(entity);

        }
    }
}
