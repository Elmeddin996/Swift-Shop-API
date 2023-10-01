using FluentValidation;

namespace SwiftShop_Services.Dtos.UserDto
{
    public class UserRegisterDto
    {
        public string UserName { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string ConfirmPassword { get; set; }
        public string? Address { get; set; }
        public string Phone { get; set; }

    }

    public class UserRegisterDtoValidator : AbstractValidator<UserRegisterDto>
    {
        public UserRegisterDtoValidator()
        {
            RuleFor(x => x.FullName).NotEmpty().MaximumLength(25).MinimumLength(6);
            RuleFor(x => x.UserName).NotEmpty().MinimumLength(3).MaximumLength(20);
            RuleFor(x => x.Password).NotEmpty().MinimumLength(6).MaximumLength(20);
            RuleFor(x => x.ConfirmPassword).Equal(x => x.Password).WithMessage("Passwords do not match");
            RuleFor(x => x.Email).NotEmpty().EmailAddress();
            RuleFor(x => x.Address).MaximumLength(100);
            RuleFor(x => x.Phone)
                .NotEmpty()
                .Matches(@"^(\+\d{1,3})?\s?\d{11,13}$")
                .WithMessage("Please enter a valid phone number");
        }
    }
}