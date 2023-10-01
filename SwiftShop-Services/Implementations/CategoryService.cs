using AutoMapper;
using SwiftShop_Services.Dtos.CategoryDto;
using SwiftShop_Core.Repositories;
using SwiftShop_Core.Models;
using SwiftShop_Services.Dtos.Common;
using SwiftShop_Services.Exceptions;
using SwiftShop_Services.Interfaces;

namespace SwiftShop_Services.Implementations
{
    public class CategoryService : ICategoryService
    {
        private readonly ICategoryRepository _repository;
        private readonly IMapper _mapper;

        public CategoryService(ICategoryRepository repository, IMapper mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }

        public CreateEntityDto Create(CategoryPostDto dto)
        {
            if (_repository.IsExist(x => x.Name == dto.Name))
                throw new RestException(System.Net.HttpStatusCode.BadRequest, "Name", "Name is already exist");

            var entity = _mapper.Map<Category>(dto);

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

        public void Edit(CategoryPutDto dto)
        {
            var entity = _repository.Get(x => x.Id == dto.Id);

            if (entity == null) throw new RestException(System.Net.HttpStatusCode.NotFound, "Entity not found");

            if (_repository.IsExist(x => x.Name == dto.Name))
                throw new RestException(System.Net.HttpStatusCode.OK, "Name", "Name is already exist");

            entity.Name = dto.Name;
            _repository.Commit();
        }

        public List<CategoryGetDto> GetAll()
        {
            var entities = _repository.GetAll(x => true);

            return _mapper.Map<List<CategoryGetDto>>(entities);
        }

        public CategoryGetByIdDto GetById(int id)
        {
            var entity = _repository.Get(x => x.Id == id);

            if (entity == null) throw new RestException(System.Net.HttpStatusCode.NotFound, "Entity not found");

            return _mapper.Map<CategoryGetByIdDto>(entity);
        }

    }
}
