using FluentValidation;

namespace SwiftShop_Services    .Dtos.CategoryDto
{
    public class CategoryPostDto

    {
        public string Name { get; set; }
    }

    public class CategoryPostValidator : AbstractValidator<CategoryPostDto>
    {
        public CategoryPostValidator()
        {
            RuleFor(x => x.Name).NotEmpty().WithMessage("Name cannot be empty!").MaximumLength(15).WithMessage("Maximum length should be 15!");
        }
    }

}
