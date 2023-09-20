using FluentValidation;
using Microsoft.AspNetCore.Http;

namespace SwiftShop_Services.Dtos.StoreDataDto
{
    public class StoreDataPutDto
    {
        public string? Phone { get; set; }
        public string? Address { get; set; }
        public string? LogoText { get; set; }
        public string? CompanyName { get; set; }
        public string? WhatsappLink { get; set; }
        public string? InstagramLink { get; set; }
        public string? FacebookLink { get; set; }
        public string? LinkedinLink { get; set; }
        public IFormFile? LogoImageFile { get; set; }
        public IFormFile? EmptyBasketImageFile { get; set; }
    }

    public class StoreDataPutDtoValidator : AbstractValidator<StoreDataPutDto>
    {
        public StoreDataPutDtoValidator()
        {
            When(x => x.LogoImageFile != null, () =>
            {
                RuleFor(x => x.LogoImageFile.Length)
                    .LessThanOrEqualTo(2097152)
                    .WithMessage("LogoImageFile must be less or equal than 2MB");

                RuleFor(x => x.LogoImageFile.ContentType)
                    .Must(contentType => contentType == "image/jpeg" || contentType == "image/png")
                    .WithMessage("LogoImageFile must be image/jpeg or image/png");
            });

            When(x => x.EmptyBasketImageFile != null, () =>
            {
                RuleFor(x => x.EmptyBasketImageFile.Length)
                    .LessThanOrEqualTo(2097152)
                    .WithMessage("EmptyBasketImageFile must be less or equal than 2MB");

                RuleFor(x => x.EmptyBasketImageFile.ContentType)
                    .Must(contentType => contentType == "image/jpeg" || contentType == "image/png")
                    .WithMessage("EmptyBasketImageFile must be image/jpeg or image/png");
            });

        }
    }
}
