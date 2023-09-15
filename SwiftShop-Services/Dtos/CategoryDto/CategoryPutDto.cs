using FluentValidation;

namespace SwiftShop_Services.Dtos.CategoryDto
{
    public class CategoryPutDto
    {
        public string Name { get; set; }
    }

    public class CategoryPutValidator : AbstractValidator<CategoryPutDto>
    {
        public CategoryPutValidator()
        {
            RuleFor(x => x.Name).NotEmpty().WithMessage("Name cannot be empty!").MaximumLength(20).WithMessage("Maximum length should be 20!");

        }
    }
}
