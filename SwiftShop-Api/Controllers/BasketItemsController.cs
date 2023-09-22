using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SwiftShop_Core.Models;
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
        private readonly UserManager<AppUser> _userManager;

        public BasketItemsController(IBasketService service, UserManager<AppUser> userManager)
        {
            _service = service;
            _userManager = userManager;
        }

        [HttpGet("all")]
        public async Task<IActionResult> GetAll()
        {
            AppUser user = await _userManager.FindByNameAsync(User.Identity.Name);

            return Ok(_service.GetAll(user.Id));
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
