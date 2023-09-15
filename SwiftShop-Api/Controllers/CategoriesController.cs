using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SwiftShop_Services.Dtos.CategoryDto;
using SwiftShop_Services.Interfaces;
using System.Data;

namespace SwiftShop_API.Controllers
{
    [Authorize(Roles = "Admin")]
    [Route("api/[controller]")]
    [ApiController]
    public class CategoriesController : ControllerBase
    {
        private readonly ICategoryService _service;

        public CategoriesController(ICategoryService service)
        {
            _service = service;
        }

        [HttpPost("")]
        public IActionResult Create(CategoryPostDto postDto)
        {
            var result = _service.Create(postDto);
            return StatusCode(201, result);
        }


        [HttpPut("{id}")]
        public IActionResult Edit(int id, CategoryPutDto putDto)
        {
            _service.Edit(id, putDto);
            return NoContent();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            _service.Delete(id);
            return NoContent();
        }

        [HttpGet("all")]
        public ActionResult<List<CategoryGetDto>> GetAll()
        {
            return Ok(_service.GetAll());
        }


        [HttpGet("{id}")]
        public ActionResult<CategoryGetByIdDto> Get(int id)
        {
            return Ok(_service.GetById(id));
        }

    }
}
