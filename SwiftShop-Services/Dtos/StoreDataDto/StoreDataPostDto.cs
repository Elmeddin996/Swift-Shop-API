using FluentValidation;
using Microsoft.AspNetCore.Http;

namespace SwiftShop_Services.Dtos.StoreDataDto
{
    public class StoreDataPostDto
    {
        public string Phone { get; set; }
        public string Address { get; set; }
        public string LogoText { get; set; }
        public string CompanyName { get; set; }
        public string WhatsappLink { get; set; }
        public string InstagramLink { get; set; }
        public string FacebookLink { get; set; }
        public string LinkedinLink { get; set; }
        public IFormFile? LogoImageFile { get; set; }
        public IFormFile? EmptyBasketImageFile { get; set; }
    }
    
    public class StoreDataPostDtoValidator : AbstractValidator<StoreDataPostDto>
    {
        public StoreDataPostDtoValidator()
        {
            RuleFor(x => x).Custom((x, context) =>
            {
                if (x.LogoImageFile.Length > 2097152)
                    context.AddFailure(nameof(x.LogoImageFile), "ImageFile must be less or equal than 2MB");

                if (x.LogoImageFile.ContentType != "image/jpeg" && x.LogoImageFile.ContentType != "image/png")
                    context.AddFailure(nameof(x.LogoImageFile), "ImageFile must be image/jpeg or image/png");
            });

            RuleFor(x => x).Custom((x, context) =>
            {
                if (x.EmptyBasketImageFile.Length > 2097152)
                    context.AddFailure(nameof(x.EmptyBasketImageFile), "ImageFile must be less or equal than 2MB");

                if (x.EmptyBasketImageFile.ContentType != "image/jpeg" && x.EmptyBasketImageFile.ContentType != "image/png")
                    context.AddFailure(nameof(x.EmptyBasketImageFile), "ImageFile must be image/jpeg or image/png");
            });

        }
    }
}
