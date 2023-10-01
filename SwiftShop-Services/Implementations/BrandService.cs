using AutoMapper;
using SwiftShop_Core.Models;
using SwiftShop_Core.Repositories;
using SwiftShop_Services.Dtos.Common;
using SwiftShop_Services.Dtos.BrandDto;
using SwiftShop_Services.Exceptions;
using SwiftShop_Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SwiftShop_Services.Implementations
{
    public class BrandService : IBrandService
    {
        private readonly IBrandRepository _repository;
        private readonly IMapper _mapper;

        public BrandService(IBrandRepository repository, IMapper mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }

        public CreateEntityDto Create(BrandPostDto dto)
        {
            if (_repository.IsExist(x => x.Name == dto.Name))
                throw new RestException(System.Net.HttpStatusCode.BadRequest, "Name", "Name is already exist");

            var entity = _mapper.Map<Brand>(dto);

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

        public void Edit(BrandPutDto dto)
        {
            var entity = _repository.Get(x => x.Id == dto.Id);

            if (entity == null) throw new RestException(System.Net.HttpStatusCode.NotFound, "Entity not found");

            if (_repository.IsExist(x => x.Name == dto.Name))
                throw new RestException(System.Net.HttpStatusCode.OK, "Name", "Name is already exist");

            entity.Name = dto.Name;
            _repository.Commit();
        }

        public List<BrandGetDto> GetAll()
        {
            var entities = _repository.GetAll(x => true);

            return _mapper.Map<List<BrandGetDto>>(entities);
        }

        public BrandGetByIdDto GetById(int id)
        {
            var entity = _repository.Get(x => x.Id == id);

            if (entity == null) throw new RestException(System.Net.HttpStatusCode.NotFound, "Entity not found");

            return _mapper.Map<BrandGetByIdDto>(entity);
        }

    }
}
