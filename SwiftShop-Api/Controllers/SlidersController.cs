using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SwiftShop_Services.Dtos.SliderDto;
using SwiftShop_Services.Interfaces;

namespace SwiftShop_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SlidersController : ControllerBase
    {
        private readonly ISliderService _service;

        public SlidersController(ISliderService service)
        {
            _service = service;
        }

        [HttpGet("all")]
        public ActionResult<SliderGetDto> GetAll()
        {
            return Ok(_service.GetAll());
        }

        [HttpGet("{id}")]
        public ActionResult<SliderGetByIdDto> Get(int id)
        {

            return Ok(_service.GetById(id));
        }


        [HttpPost("")]
        [Authorize(Roles ="Admin")]
        public IActionResult Create([FromForm] SliderPostDto postDto)
        {
            return StatusCode(201, _service.Create(postDto));
        }

      

        [HttpPut("Edit")]
        [Authorize(Roles = "Admin")]
        public ActionResult Update([FromForm] SliderPutDto dto)
        {
            _service.Edit(dto);

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
