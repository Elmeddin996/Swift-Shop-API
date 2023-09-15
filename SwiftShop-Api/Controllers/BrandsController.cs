using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SwiftShop_Services.Dtos.BrandDto;
using SwiftShop_Services.Interfaces;

namespace SwiftShop_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BrandsController : ControllerBase
    {
        private readonly IBrandService _service;

        public BrandsController(IBrandService service)
        {
            _service = service;
        }

        [HttpPost("")]
        public IActionResult Create(BrandPostDto postDto)
        {
            var result = _service.Create(postDto);
            return StatusCode(201, result);
        }


        [HttpPut("{id}")]
        public IActionResult Edit(int id, BrandPutDto putDto)
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
        public ActionResult<List<BrandGetDto>> GetAll()
        {
            return Ok(_service.GetAll());
        }


        [HttpGet("{id}")]
        public ActionResult<BrandGetByIdDto> Get(int id)
        {
            return Ok(_service.GetById(id));
        }

    }
}
