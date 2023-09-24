using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SwiftShop_API.Services;
using SwiftShop_Core.Enums;
using SwiftShop_Core.Models;
using SwiftShop_Core.Repositories;
using SwiftShop_Services.Dtos.CategoryDto;
using SwiftShop_Services.Dtos.OrderDto;
using SwiftShop_Services.Interfaces;

namespace SwiftShop_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrdersController : ControllerBase
    {
        private readonly IEmailSender _emailSender;
        private readonly UserManager<AppUser> _userManager;
        private readonly IOrderService _service;
        private readonly IOrderRepository _repository;

        public OrdersController(IEmailSender emailSender, UserManager<AppUser> userManager, IOrderService service, IOrderRepository repository)
        {
            _emailSender = emailSender;
            _userManager = userManager;
            _service = service;
            _repository = repository;
        }

        [HttpPost("CreateOrder")]
        public async Task<IActionResult> Create(OrderPostDto dto)
        {
            if (User.Identity.IsAuthenticated)
            {
                AppUser user = await _userManager.FindByNameAsync(User.Identity.Name);

                if (user != null)
                    dto.UserId = user.Id;
            }

            var result = _service.Create(dto);

            if (result!=null)
                _emailSender.Send(dto.Email, "Order Is Pending...", $"Dear {dto.FullName}  Your order is pending, you will be notified after it is confirmed by the admins. Thank you for choosing us!");


            return StatusCode(201, result);
        }


        [HttpGet("All")]
        [Authorize(Roles ="Admin")]
        public IActionResult GetAll()
        {
            return Ok(_service.GetAll());
        }

        [HttpGet("{id}")]
        [Authorize(Roles = "Admin")]
        public ActionResult<CategoryGetByIdDto> Get(int id)
        {
            return Ok(_service.GetById(id));
        }



        [HttpPut("{id}")]
        [Authorize(Roles = "Admin")]
        public IActionResult Edit(int id, OrderPutDto putDto)
        {

            _service.Edit(id, putDto);

            Order order = _repository.Get(x => x.Id == id);

            if (putDto.Status==OrderStatus.Accepted)
            {
                _emailSender.Send(order.Email, "Order Is Accepted!", $"Dear {order.FullName}  Your order has been confirmed. Our staff will contact you. Thank you for choosing us!");
            }

            if (putDto.Status == OrderStatus.Rejected)
            {
                _emailSender.Send(order.Email, "Order Is Rejected!", $"Dear {order.FullName}  Your order has been rejected. Thank you for choosing us!");
            }
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
