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

        [HttpPost("")]
        public IActionResult Create([FromForm] SliderPostDto postDto)
        {
            return StatusCode(201, _service.Create(postDto));
        }

        [HttpGet("all")]
        public ActionResult<SliderGetDto> GetAll()
        {
            return Ok(_service.GetAll());
        }

        [HttpPut("{id}")]
        public ActionResult Update(int id, [FromForm] SliderPutDto dto)
        {
            _service.Edit(id, dto);

            return NoContent();
        }

        [HttpGet("{id}")]
        public ActionResult<SliderGetByIdDto> Get(int id)
        {

            return Ok(_service.GetById(id));
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            _service.Delete(id);
            return NoContent();
        }
    }
}
