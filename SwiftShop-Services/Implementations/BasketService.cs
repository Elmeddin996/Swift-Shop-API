using AutoMapper;
using SwiftShop_Core.Repositories;
using SwiftShop_Services.Dtos.BasketItemDto;
using SwiftShop_Core.Models;
using SwiftShop_Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SwiftShop_Services.Dtos.BrandDto;
using Microsoft.AspNetCore.Identity;
using System.Security.Claims;
using SwiftShop_Services.Exceptions;
using Microsoft.AspNetCore.Http;

namespace SwiftShop_Services.Implementations
{
    public class BasketService : IBasketService
    {
        private readonly IBasketRepository _repository;
        private readonly IMapper _mapper;
       
        public BasketService(IBasketRepository repository,IMapper mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }


        public async void  AddToBasket(BasketItemPostDto dto)
        {
          
            var entity = _repository.Get(x=>x.ProductId==dto.ProductId&&x.UserId==dto.UserId,"Product");

            if (entity != null)
            {
                entity.Count++;
            }
            else
            {
                entity = _mapper.Map<BasketItem>(dto);
                entity.Count = 1;
                entity.UserId = dto.UserId;
                _repository.Add(entity);
            }
            _repository.Commit();
        }


        public void ReduceBasketItem(BasketItemPostDto dto)
        {
            List<RestExceptionError> errors = new List<RestExceptionError>();

            var entity = _repository.Get(x => x.ProductId == dto.ProductId && x.UserId == dto.UserId);

            if (entity == null)
                errors.Add(new RestExceptionError("ProductId", "ProductId is not correct"));

            if (errors.Count > 0) throw new RestException(System.Net.HttpStatusCode.BadRequest, errors);

            if (entity.Count>1)
            {
                entity.Count--;
            }
            else
            {
                _repository.Remove(entity);
            }
            _repository.Commit();
        }

        public void Delete(int id)
        {
            var entity = _repository.Get(x => x.Id == id);

            if (entity == null) throw new RestException(System.Net.HttpStatusCode.NotFound, "Item not found");

            _repository.Remove(entity);
            _repository.Commit();
        }

        public List<BasketItemGetDto> GetAll(string userId)
        {
            var entities = _repository.GetAll(x =>x.UserId==userId, "Product");
            return _mapper.Map<List<BasketItemGetDto>>(entities);
        }

    }
}