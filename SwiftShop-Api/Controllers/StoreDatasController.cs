using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SwiftShop_Services.Dtos.StoreDataDto;
using SwiftShop_Services.Interfaces;

namespace SwiftShop_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StoreDatasController : ControllerBase
    {
        private readonly IStoreDataService _service;

        public StoreDatasController(IStoreDataService service)
        {
            _service = service;
        }
         
        //[HttpPost("")]
        //[Authorize(Roles = "Admin")]
        //public IActionResult Create([FromForm] StoreDataPostDto postDto)
        //{
        //    return StatusCode(201, _service.Create(postDto));
        //}

        [HttpGet("Get")]
        public IActionResult Get()
        { 
            return StatusCode(201, _service.Get());
        }

        [HttpPut("Edit")]
        [Authorize(Roles = "Admin")]
        public IActionResult Edit([FromForm] StoreDataPutDto dto) 
        {
            _service.Edit(dto);

            return StatusCode(200, dto);
        }
    }
}
