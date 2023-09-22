using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SwiftShop_Services.Dtos.UserDto
{
    public class UserPutDto
    {
        public string? UserName { get; set; }
        public string? Email { get; set; }
        public string? FullName { get; set; }
        public string? Address { get; set; }
        public string? Phone { get; set; }
        public string Password { get; set; }
    }

    public class UserPutDtoValidator : AbstractValidator<UserPutDto>
    {
        public UserPutDtoValidator()
        {
            RuleFor(x => x.FullName).MaximumLength(25);
            RuleFor(x => x.UserName).MaximumLength(20);
            RuleFor(x => x.Email).EmailAddress();
            RuleFor(x => x.Address).MaximumLength(100);
            RuleFor(x => x.Phone)
                .Matches(@"^(\+\d{1,3})?\s?\d{11,13}$")
                .WithMessage("Please enter a valid phone number");
            RuleFor(x => x.Password).NotEmpty().MinimumLength(8);

        }
    }
}
