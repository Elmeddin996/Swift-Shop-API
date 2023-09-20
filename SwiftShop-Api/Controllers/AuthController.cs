using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SwiftShop_Services.Dtos.UserDto;
using SwiftShop_Services.Helpers;
using SwiftShop_Core.Models;
using SwiftShop_API.Services;
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
        private readonly IEmailSender _emailSender;
        private readonly TokenEncoderDecoder _tokenEncDec;

        public AuthController(SignInManager<AppUser> signInManager,  UserManager<AppUser> userManager, IHttpContextAccessor httpContextAccessor, RoleManager<IdentityRole> roleManager, JwtService jwtService, IEmailSender emailSender, TokenEncoderDecoder tokenEncDec)
        {
            _signInManager = signInManager;
            _userManager = userManager;
            _httpContextAccessor = httpContextAccessor;
            _roleManager = roleManager;
            _jwtService = jwtService;
            _emailSender = emailSender;
            _tokenEncDec = tokenEncDec;
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

        [HttpGet("AllUsers")]
        [Authorize(Roles = "Admin")]
        public IActionResult GetAllUsers()
        {
            var users = _userManager.Users;

            if (users == null) return NotFound();

            List<UserGetDto> userDtos = new List<UserGetDto>();

            foreach (var user in users)
            {
                UserGetDto dto = new UserGetDto
                {
                    FullName = user.FullName,
                    UserName = user.UserName,
                    Address = user.Address,
                    Phone = user.Phone,
                    Email = user.Email
                };

                userDtos.Add(dto);
            }

            return Ok(userDtos);
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
                Phone = registerDto.Phone,
                IsAdmin = false
            };

            var result = await _userManager.CreateAsync(user, registerDto.Password);
            if (result.Succeeded)
            {
                await _userManager.AddToRoleAsync(user, "Member");
                var token = await _userManager.GenerateEmailConfirmationTokenAsync(user);

                string encodedToken = _tokenEncDec.EncodeToken(token);
                string confirmationLink = $"{Request.Scheme}://{Request.Host}/api/auth/confirmemail?encodedToken={encodedToken}&email={user.Email}";

                _emailSender.Send(user.Email, "Email Confirme", $"Click <a href=\"{confirmationLink}\">here</a> to verification your email");

            }
            else
                return NotFound();


            return Ok();
        }

        [HttpGet("SendConfirmEmailToken")]
        [Authorize]
        public async Task<IActionResult> CreateToken()
        {
            string userName = User.Identity.Name;

            AppUser user = await _userManager.FindByNameAsync(userName);

            if (user == null) return NotFound();

            if (user.EmailConfirmed == true) return Ok("Your Email Alredy Confirmed");
           

            var token = await _userManager.GenerateEmailConfirmationTokenAsync(user);

            string encodedToken = _tokenEncDec.EncodeToken(token);
            string confirmationLink = $"{Request.Scheme}://{Request.Host}/api/auth/confirmemail?encodedToken={encodedToken}&email={user.Email}";

            _emailSender.Send(user.Email, "Email Confirme", $"Click <a href=\"{confirmationLink}\">here</a> to verification your email");

            return Ok();
        }

        [HttpGet("confirmemail")]
        public async Task<IActionResult> ConfirmEmail([FromQuery] string encodedToken, [FromQuery] string email)
        {
            string token = _tokenEncDec.DecodeToken(encodedToken);

            if (string.IsNullOrWhiteSpace(token) || string.IsNullOrWhiteSpace(email))
            {
                return BadRequest("Token and email are required.");
            }

            var user = await _userManager.FindByEmailAsync(email);
            if (user == null)
            {
                return NotFound("User not found.");
            }

            var result = await _userManager.ConfirmEmailAsync(user, token);
            if (result.Succeeded)
            {
                //return Redirect($"{Request.Scheme}://{Request.Host}/");
                return Ok("Email confirmed successfully.");
            }

            return BadRequest(result.Errors);
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

        [HttpDelete("DeleteUser")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Delete(string email)
        {
            var user = await _userManager.FindByEmailAsync(email);
            await _userManager.DeleteAsync(user);

            return Ok();
        }
    }
}
