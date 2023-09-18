using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SwiftShop_Services.Dtos.UserDto;
using SwiftShop_Core.Models;
using SwiftShop_API.Services;
using SwiftShop_Services.Exceptions;
using Microsoft.AspNetCore.Authorization;

namespace SwiftShop_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly SignInManager<AppUser> _signInManager;
        private readonly UserManager<AppUser> _userManager;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly JwtService _jwtService;

        public AuthController(SignInManager<AppUser> signInManager, UserManager<AppUser> userManager, IHttpContextAccessor httpContextAccessor, RoleManager<IdentityRole> roleManager, JwtService jwtService)
        {
            _signInManager = signInManager;
            _userManager = userManager;
            _httpContextAccessor = httpContextAccessor;
            _roleManager = roleManager;
            _jwtService = jwtService;
        }


        [HttpGet("UserData")]
        [Authorize]
        public async Task<IActionResult> Get()
        {
            string userName = User.Identity.Name;

            AppUser user = await _userManager.FindByNameAsync(userName);

            if (user == null) return NotFound();

            UserGetDto dto = new UserGetDto();

            dto.FullName = user.FullName;
            dto.UserName = user.UserName;
            dto.Address = user.Address;
            dto.Phone = user.Phone;
            dto.Email = user.Email;

            return Ok(dto);
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

        [HttpGet("Logout")]
        [Authorize]
        public async Task<IActionResult> Logout()
        {
            await _signInManager.SignOutAsync();

            return Ok();
        }

        [HttpDelete]
        [Authorize(Roles ="Admin")]
        public async Task<IActionResult> Delete(string id)
        {
           var user = await _userManager.FindByIdAsync(id);
            await _userManager.DeleteAsync(user);

            return Ok();
        }
    }
}
