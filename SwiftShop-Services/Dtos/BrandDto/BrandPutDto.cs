using FluentValidation;

namespace SwiftShop_Services.Dtos.BrandDto
{
    public class BrandPutDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

    public class BrandPutValidator : AbstractValidator<BrandPutDto>
    {
        public BrandPutValidator()
        {
            RuleFor(x => x.Id).NotEmpty();
            RuleFor(x => x.Name).NotEmpty().WithMessage("Name cannot be empty!").MaximumLength(25).WithMessage("Maximum length should be 25!");
        }
    }
}
