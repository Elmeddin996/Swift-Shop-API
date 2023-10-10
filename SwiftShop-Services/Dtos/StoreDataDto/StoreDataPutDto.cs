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
        public string? AboutCompany { get; set; }
        public string? WhatsappLink { get; set; }
        public string? InstagramLink { get; set; }
        public string? FacebookLink { get; set; }
        public string? LinkedinLink { get; set; }
        public IFormFile? LogoImageFile { get; set; }
    }

    public class StoreDataPutDtoValidator : AbstractValidator<StoreDataPutDto>
    {
        public StoreDataPutDtoValidator()
        {
            When(x => x.LogoImageFile != null, () =>
            {
                RuleFor(x => x.LogoImageFile.Length)
                    .LessThanOrEqualTo(6291456)
                    .WithMessage("LogoImageFile must be less or equal than 6MB");

                RuleFor(x => x.LogoImageFile.ContentType)
                    .Must(contentType => contentType == "image/jpeg" || contentType == "image/png")
                    .WithMessage("LogoImageFile must be image/jpeg or image/png");
            });
        }
    }
}
