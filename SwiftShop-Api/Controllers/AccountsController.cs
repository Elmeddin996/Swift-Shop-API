using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using SwiftShop_API.Services;
using SwiftShop_Core.Models;
using SwiftShop_Services.Dtos.UserDto;
using SwiftShop_Services.Helpers;

namespace SwiftShop_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountsController : ControllerBase
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly IEmailSender _emailSender;
        private readonly TokenEncoderDecoder _tokenEncDec;
        private readonly IConfiguration _configuration;
        public AccountsController(UserManager<AppUser> userManager, IEmailSender emailSender, TokenEncoderDecoder tokenEncDec, IConfiguration configuration)
        {
            _userManager = userManager;
            _emailSender = emailSender;
            _tokenEncDec = tokenEncDec;
            _configuration = configuration;
        }

        [HttpPost("SendConfirmEmailToken")]
        [Authorize]
        public async Task<IActionResult> CreateToken()
        {
            string userName = User.Identity.Name;

            AppUser user = await _userManager.FindByNameAsync(userName);

            if (user == null) return NotFound();

            if (user.EmailConfirmed == true) return Ok("Your Email Alredy Confirmed");


            var token = await _userManager.GenerateEmailConfirmationTokenAsync(user);

            string encodedToken = _tokenEncDec.EncodeToken(token);
            string confirmationLink = $"{Request.Scheme}://{Request.Host}/api/accounts/confirmemail?encodedToken={encodedToken}&email={user.Email}";

            _emailSender.Send(user.Email, "Email Confirme", $"Click <a href=\"{confirmationLink}\">here</a> to verification your email");

            return Ok();
        }

        [HttpGet("confirmemail")]
        [Authorize]
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
                return Ok("Email confirmed successfully.");
            }

            return BadRequest(result.Errors);
        }

        [HttpPost("forgotpassword")]
        public async Task<IActionResult> ForgetPassword(ForgotPasswordDto passwordDto)
        {
            AppUser user = await _userManager.FindByEmailAsync(passwordDto.Email);

            if (user == null || user.IsAdmin) return BadRequest("Email is not correct");

            string token = await _userManager.GeneratePasswordResetTokenAsync(user);

            string encodedToken = _tokenEncDec.EncodeToken(token);
            string resetPasswordUrl = $"{Request.Scheme}://{Request.Host}/api/accounts/resetpassword?encodedToken={encodedToken}&email={passwordDto.Email}";

            _emailSender.Send(passwordDto.Email, "Reset Password", $"Click <a href=\"{resetPasswordUrl}\">here</a> to reset your password");

            return Ok();
        }

        [HttpGet("resetpassword")]
        public async Task<IActionResult> ResetPassword([FromQuery] string encodedToken, [FromQuery] string email)
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
            var result = await _userManager.VerifyUserTokenAsync(user, _userManager.Options.Tokens.PasswordResetTokenProvider, "ResetPassword", token);

            if (result)
            {
                var reactAppUrl = _configuration["FrontUrl:BaseUrl"] + $"reset-password?token={encodedToken}&email={email}";
                return Redirect(reactAppUrl);
            }

            return BadRequest("error");

        }

        [HttpPost("ResetPasswordChange")]
        public async Task<IActionResult> ResetPassword(ResetPasswordPostDto dto)
        {
            string token = _tokenEncDec.DecodeToken(dto.Token);

            if (dto.Password != dto.ConfirmPassword) return BadRequest("Password is don't match");

            var user = await _userManager.FindByEmailAsync(dto.Email);

            if (user == null || user.IsAdmin)
            {
                return BadRequest("Email is not correct");
            }

            var result = await _userManager.ResetPasswordAsync(user, token, dto.Password);

            if (!result.Succeeded)
            {
                return BadRequest("Password reset failed");
            }

            return Ok("Password reset successful");
        }

    }
}
