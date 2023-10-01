using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SwiftShop_Services.Dtos.CategoryDto;
using SwiftShop_Services.Interfaces;
using System.Data;

namespace SwiftShop_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoriesController : ControllerBase
    {
        private readonly ICategoryService _service;

        public CategoriesController(ICategoryService service)
        {
            _service = service;
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


        [HttpPost("")]
        [Authorize(Roles = "Admin")]
        public IActionResult Create(CategoryPostDto postDto)
        {
            var result = _service.Create(postDto);
            return StatusCode(201, result);
        }


        [HttpPut("Edit")]
        [Authorize(Roles = "Admin")]
        public IActionResult Edit(CategoryPutDto putDto)
        {
            _service.Edit(putDto);
            return NoContent();
        }

        [HttpDelete("{id}")]
        [Authorize(Roles = "Admin")]
        public IActionResult Delete(int id)
        {
            _service.Delete(id);
            return NoContent();
        }

       
    }
}
