using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SwiftShop_Services.Dtos.BasketItemDto;
using SwiftShop_Services.Interfaces;

namespace SwiftShop_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class BasketItemsController : ControllerBase
    {
        private readonly IBasketService _service;

        public BasketItemsController(IBasketService service)
        {
            _service = service;
        }

        [HttpGet("all")]
        public ActionResult<List<BasketItemGetDto>> GetAll(string userId)
        {
            return Ok(_service.GetAll(userId));
        }

        [HttpPost("add")]
        public IActionResult AddToBasket(BasketItemPostDto postDto)
        {
             _service.AddToBasket(postDto);
            return StatusCode(201);
        }

        [HttpPost("reduce")]
        public IActionResult ReduceBasket(BasketItemPostDto postDto)
        {
            _service.ReduceBasketItem(postDto);
            return StatusCode(201);
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            _service.Delete(id);
            return NoContent();
        }
    }
}
