using AutoMapper;
using Microsoft.AspNetCore.Http;
using SwiftShop_Core.Models;
using SwiftShop_Core.Repositories;
using SwiftShop_Services.Dtos.Common;
using SwiftShop_Services.Dtos.SliderDto;
using SwiftShop_Services.Exceptions;
using SwiftShop_Services.Helpers;
using SwiftShop_Services.Interfaces;


namespace SwiftShop_Services.Implementations
{
    public class SliderService:ISliderService
    {
        private readonly ISliderRepository _repository;
        private readonly IMapper _mapper;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public SliderService(ISliderRepository repository, IMapper mapper, IHttpContextAccessor httpContextAccessor)
        {
            _repository = repository;
            _mapper = mapper;
            _httpContextAccessor = httpContextAccessor;
        }

        public CreateEntityDto Create(SliderPostDto dto)
        {
            List<RestExceptionError> errors = new List<RestExceptionError>();


            if (_repository.IsExist(x => x.Title == dto.Title))
                errors.Add(new RestExceptionError("Title", "Title is already exists"));

            if (errors.Count > 0) throw new RestException(System.Net.HttpStatusCode.Conflict, errors);

            var entity = _mapper.Map<Slider>(dto);

            string rootPath = Directory.GetCurrentDirectory() + "/wwwroot";
            entity.ImageName = FileManager.Save(dto.ImageFile, rootPath, "uploads/sliders");
            entity.ImageUrl = "/uploads/sliders/" + entity.ImageName;


            _repository.Add(entity);
            _repository.Commit();

            return new CreateEntityDto { Id = entity.Id };
        }


        public void Delete(int id)
        {
            var entity = _repository.Get(x => x.Id == id);

            if (entity == null) throw new RestException(System.Net.HttpStatusCode.NotFound, "Slider not found");

            _repository.Remove(entity);
            _repository.Commit();

            string rootPath = Directory.GetCurrentDirectory() + "/wwwroot";
            FileManager.Delete(rootPath, "uploads/sliders", entity.ImageName);
        }

        public void Edit(SliderPutDto dto)
        {
            var entity = _repository.Get(x => x.Id == dto.Id);

            if (entity == null) throw new RestException(System.Net.HttpStatusCode.NotFound, "Slider not found");

            entity.Desc = dto.Desc;
            entity.Title = dto.Title;

            string? removableFileName = null;
            string rootPath = Directory.GetCurrentDirectory() + "/wwwroot";

            if (dto.ImageFile != null)
            {
                removableFileName = entity.ImageName;
                entity.ImageName = FileManager.Save(dto.ImageFile, rootPath, "uploads/sliders");
                entity.ImageUrl = "/uploads/sliders/" + entity.ImageName;
            }

            _repository.Commit();

            if (removableFileName != null) FileManager.Delete(rootPath, "uploads/sliders", removableFileName);
        }

        public List<SliderGetDto> GetAll()
        {
            var entities = _repository.GetAll(x => true);

           
            string baseUrl = $"{_httpContextAccessor.HttpContext.Request.Scheme}://{_httpContextAccessor.HttpContext.Request.Host}";
            foreach (var entity in entities)
            {
                entity.ImageUrl = baseUrl + entity.ImageUrl;
            }

            return _mapper.Map<List<SliderGetDto>>(entities);
        }

        public SliderGetByIdDto GetById(int id)
        {
            var entity = _repository.Get(x => x.Id == id);

            if (entity == null) throw new RestException(System.Net.HttpStatusCode.NotFound, "Slider", "Slider not found");

            string baseUrl = $"{_httpContextAccessor.HttpContext.Request.Scheme}://{_httpContextAccessor.HttpContext.Request.Host}";

            entity.ImageUrl = baseUrl + entity.ImageUrl;

            return _mapper.Map<SliderGetByIdDto>(entity);
        }

    }
}
