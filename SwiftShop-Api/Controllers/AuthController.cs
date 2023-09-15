using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SwiftShop_API.Dtos.UserDto;
using SwiftShop_Core.Models;
using SwiftShop_API.Services;
using SwiftShop_Services.Exceptions;

namespace SwiftShop_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {

        private readonly UserManager<AppUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly JwtService _jwtService;

        public AuthController(UserManager<AppUser> userManager, RoleManager<IdentityRole> roleManager, JwtService jwtService)
        {
            _userManager = userManager;
            _roleManager = roleManager;
            _jwtService = jwtService;
        }

       


        [HttpPost("Register")]
        public async Task<IActionResult> Register(UserRegisterDto registerDto)
        {
            if (_userManager.Users.Any(x => x.UserName == registerDto.UserName))
                return Conflict("UserName is alredy taken");


            if (_userManager.Users.Any(x => x.Email == registerDto.Email))
                return Conflict("Email is alredy taken");

            var user = new AppUser
            {
                UserName = registerDto.UserName,
                FullName = registerDto.FullName,
                Email = registerDto.Email,
                Address = registerDto.Address,
                Phone=registerDto.Phone,    
                IsAdmin=false
            };

            var result = await _userManager.CreateAsync(user, registerDto.Password);
            if (result.Succeeded)
            await _userManager.AddToRoleAsync(user, "Member");
            else
                return NotFound();
            
            
            return Ok();
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login(UserLoginDto loginDto)
        {
            AppUser user = await _userManager.FindByEmailAsync(loginDto.Email);

            if (user == null)
                return Unauthorized();

            if (!await _userManager.CheckPasswordAsync(user, loginDto.Password))
                return Unauthorized();

            var roles = await _userManager.GetRolesAsync(user);

            return Ok(_jwtService.GenerateToken(user, roles));
        }


        //[HttpGet("Role")]
        //public async Task<IActionResult> CreateRole()
        //{
        //    await _roleManager.CreateAsync(new IdentityRole("Member"));
        //    await _roleManager.CreateAsync(new IdentityRole("Admin"));

        //    return Ok();
        //}



        //[HttpGet("CreateAdmin")]
        //public async Task<IActionResult> CreateAdmin()
        //{
        //    var user = new AppUser
        //    {
        //        UserName = "Admin",
        //        FullName = "Elmeddin Mirzeyev",
        //        Email = "admin@gmail.com"
        //    };

        //    await _userManager.CreateAsync(user, "Admin123");
        //    await _userManager.AddToRoleAsync(user, "Admin");

        //    return Ok();
        //}
    }
}
