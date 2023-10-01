using FluentValidation;

namespace SwiftShop_Services.Dtos.BrandDto
{
    public class BrandPostDto
    {
        public string Name { get; set; }
    }

    public class BrandPostValidator : AbstractValidator<BrandPostDto>
    {
        public BrandPostValidator()
        {
            RuleFor(x => x.Name).NotEmpty().WithMessage("Name cannot be empty!").MaximumLength(25).WithMessage("Maximum length should be 25!");
        }
    }
}
