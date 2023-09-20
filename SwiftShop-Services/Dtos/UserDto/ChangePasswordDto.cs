using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SwiftShop_Services.Dtos.UserDto
{
    public class ChangePasswordDto
    {
        public string Password { get; set; }
        public string NewPassword { get; set; }
        public string ConfirmPassword { get; set; }
    }

    public class ChangePasswordDtoValidator:AbstractValidator<ChangePasswordDto>
    {
        public ChangePasswordDtoValidator() 
        {
            RuleFor(x => x.Password).NotEmpty().MinimumLength(6).MaximumLength(20);
            RuleFor(x => x.NewPassword).NotEmpty().MinimumLength(6).MaximumLength(20);
            RuleFor(x => x.ConfirmPassword).Equal(x => x.NewPassword).WithMessage("Passwords do not match");
        }
    }
}
