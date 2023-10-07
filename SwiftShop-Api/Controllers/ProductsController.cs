using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SwiftShop_Services.Dtos.ProductDto;
using SwiftShop_Services.Interfaces;
using System.Data;

namespace SwiftShop_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {

        private readonly IProductService _service;

        public ProductsController(IProductService service)
        {
            _service = service;
        }

        [HttpGet("all")]
        public ActionResult<ProductGetDto> GetAll()
        {
            return Ok(_service.GetAll());
        }

        [HttpGet("{id}")]
        public ActionResult Get(int id)
        {
            return Ok(_service.GetById(id));
        }

        [HttpGet("GetAdmin/{id}")]
        [Authorize(Roles = "Admin")]
        public ActionResult GetAdmin(int id)
        {
            return Ok(_service.GetByIdAdmin(id));
        }



        [HttpPost("")]
        [Authorize(Roles = "Admin")]
        public IActionResult Create([FromForm] ProductPostDto dto)
        {
            return StatusCode(201, _service.Create(dto));
        }

        [HttpPut("Edit")]
        [Authorize(Roles = "Admin")]
        public ActionResult Update([FromForm] ProductPutDto dto)
        {
            _service.Edit(dto);

            return NoContent();
        }

       
        [HttpDelete("{id}")]
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int id)
        {
            _service.Delete(id);
            return NoContent();
        }
    }
}
