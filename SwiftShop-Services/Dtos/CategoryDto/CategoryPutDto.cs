using FluentValidation;

namespace SwiftShop_Services.Dtos.CategoryDto
{
    public class CategoryPutDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

    public class CategoryPutValidator : AbstractValidator<CategoryPutDto>
    {
        public CategoryPutValidator()
        {
            RuleFor(x => x.Id).NotEmpty();
            RuleFor(x => x.Name).NotEmpty().WithMessage("Name cannot be empty!").MaximumLength(25).WithMessage("Maximum length should be 25!");

        }
    }
}
