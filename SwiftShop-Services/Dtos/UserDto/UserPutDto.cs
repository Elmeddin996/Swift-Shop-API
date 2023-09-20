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
        public string UserName { get; set; }
        public string Email { get; set; }
        public string FullName { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
    }

    public class UserPutDtoValidator : AbstractValidator<UserPutDto>
    {
        public UserPutDtoValidator()
        {
            RuleFor(x => x.FullName).NotEmpty().MaximumLength(25).MinimumLength(6);
            RuleFor(x => x.UserName).NotEmpty().MinimumLength(3).MaximumLength(20);
            RuleFor(x => x.Email).NotEmpty().EmailAddress();
            RuleFor(x => x.Address).NotEmpty().MaximumLength(100);
            RuleFor(x => x.Phone)
                .NotEmpty()
                .Matches(@"^(\+\d{1,3})?\s?\d{11,13}$")
                .WithMessage("Please enter a valid phone number");
        }
    }
}
