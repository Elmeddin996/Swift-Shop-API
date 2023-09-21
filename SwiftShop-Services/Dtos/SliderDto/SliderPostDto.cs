using FluentValidation;
using Microsoft.AspNetCore.Http;


namespace SwiftShop_Services.Dtos.SliderDto
{
    public class SliderPostDto
    {
        public string Title { get; set; }
        public string Desc { get; set; }
        public IFormFile ImageFile { get; set; }
    }

    public class SliderPostDtoValidator : AbstractValidator<SliderPostDto>
    {
        public SliderPostDtoValidator()
        {
            RuleFor(x => x.Title).NotEmpty().MaximumLength(15).MinimumLength(2);
            RuleFor(x => x.ImageFile).NotNull();

            RuleFor(x => x).Custom((x, context) =>
            {
                if (x.ImageFile.Length > 2097152)
                    context.AddFailure(nameof(x.ImageFile), "ImageFile must be less or equal than 2MB");

                if (x.ImageFile.ContentType != "image/jpeg" && x.ImageFile.ContentType != "image/png")
                    context.AddFailure(nameof(x.ImageFile), "ImageFile must be image/jpeg or image/png");
            });

        }
    }
}
