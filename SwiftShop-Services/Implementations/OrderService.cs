﻿using AutoMapper;
using Microsoft.AspNetCore.Identity;
using SwiftShop_Core.Enums;
using SwiftShop_Core.Models;
using SwiftShop_Core.Repositories;
using SwiftShop_Services.Dtos.CategoryDto;
using SwiftShop_Services.Dtos.Common;
using SwiftShop_Services.Dtos.OrderDto;
using SwiftShop_Services.Dtos.ProductDto;
using SwiftShop_Services.Exceptions;
using SwiftShop_Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SwiftShop_Services.Implementations
{
    public class OrderService : IOrderService
    {
        private readonly IOrderRepository _repository;
        private readonly IMapper _mapper;
        private readonly IProductRepository _productRepo;

        public OrderService( IOrderRepository repository, IMapper mapper, IProductRepository productRepo)
        {
            _repository = repository;
            _mapper = mapper;
            _productRepo = productRepo;
        }
        public CreateEntityDto Create(OrderPostDto dto)
        {
            var entity = new Order
            {
                UserId=dto.UserId,
                FullName = dto.FullName,
                Phone = dto.Phone,
                Address = dto.Address,
                Email = dto.Email,
                Note = dto.Note,
                Status = OrderStatus.Pending,
                CreatedAt = DateTime.Now
            };

            foreach (var orderItemDto in dto.OrderItems)
            {
                var orderItem = new OrderItem
                {
                    OrderId = entity.Id,
                    ProductId = orderItemDto.ProductId,
                    ProductName = orderItemDto.ProductName,
                    Count = orderItemDto.Count,
                };

                entity.OrderItems.Add(orderItem);
            }

            _repository.Add(entity);
            _repository.Commit();

            return new CreateEntityDto { Id = entity.Id };
        }

        public void Delete(int id)
        {
            var entity = _repository.Get(x => x.Id == id);

            if (entity == null) throw new RestException(System.Net.HttpStatusCode.NotFound, "Entity not found");

            _repository.Remove(entity);
            _repository.Commit();
        }

        public void Edit(OrderPutDto dto)
        {
            var entity = _repository.Get(x => x.Id == dto.Id,"OrderItems");

            if (entity == null) throw new RestException(System.Net.HttpStatusCode.NotFound, "Entity not found");
           
            entity.Status = dto.Status;
            
            if (dto.Status == OrderStatus.Accepted)
            {
                foreach (var orderItem in entity.OrderItems)
                {
                    var product = _productRepo.Get(x => x.Id == orderItem.ProductId);

                    if (product.Stock >= orderItem.Count)
                    {
                        product.Stock -= orderItem.Count;
                    }

                    _productRepo.Commit();
                }
            }

         
            _repository.Commit();
        }

        public List<OrderGetDto> GetAll()
        {
            var entities = _repository.GetAll(x => true,"OrderItems");

            var dtos = _mapper.Map<List<OrderGetDto>>(entities);

           return dtos;
        }

        public OrderGetByIdDto GetById(int id)
        {
            var entity = _repository.Get(x => x.Id == id);

            if (entity == null) throw new RestException(System.Net.HttpStatusCode.NotFound, "Entity not found");

            return _mapper.Map<OrderGetByIdDto>(entity);
        }
    }
}
