using FluentValidation;

namespace SwiftShop_Services.Dtos.BrandDto
{
    public class BrandPutDto
    {
        public string Name { get; set; }
    }

    public class BrandPutValidator : AbstractValidator<BrandPutDto>
    {
        public BrandPutValidator()
        {
            RuleFor(x => x.Name).NotEmpty().WithMessage("Name cannot be empty!").MaximumLength(15).WithMessage("Maximum length should be 15!");
        }
    }
}
