using FluentValidation;
using Microsoft.AspNetCore.Http;

namespace SwiftShop_Services.Dtos.ProductDto
{
    public class ProductPostDto
    {

        public int CategoryId { get; set; }
        public int BrandId { get; set; }
        public int Rate { get; set; }
        public string Name { get; set; }
        public decimal SalePrice { get; set; }
        public decimal CostPrice { get; set; }
        public string Description { get; set; }
        public decimal DiscountPercent { get; set; }
        public int Stock { get; set; }


        public IFormFile PosterImageFile { get; set; }
        public List<IFormFile> ImageFiles { get; set; }
    }

    public class ProductPostDtoValidator : AbstractValidator<ProductPostDto>
    {
        public ProductPostDtoValidator()
        {
            RuleFor(x => x.Name).NotEmpty().MaximumLength(25).MinimumLength(2);
            RuleFor(x => x.SalePrice).GreaterThanOrEqualTo(x => x.CostPrice);
            RuleFor(x => x.CostPrice).GreaterThanOrEqualTo(0);
            RuleFor(x => x.PosterImageFile).NotNull();
            RuleFor(x => x.DiscountPercent).GreaterThanOrEqualTo(0).LessThanOrEqualTo(100);

            RuleFor(x => x).Custom((x, context) =>
            {
                if (x.DiscountPercent > 0)
                {
                    var price = x.SalePrice * (100 - x.DiscountPercent) / 100;
                    if (x.CostPrice > price)
                    {
                        context.AddFailure(nameof(x.DiscountPercent), "DiscountPercent is incorrect");
                    }
                }
            });

            RuleFor(x => x).Custom((x, context) =>
            {
                if (x != null && x.PosterImageFile != null)
                {
                    if (x.PosterImageFile.Length > 2097152)
                        context.AddFailure(nameof(x.PosterImageFile), "ImageFile must be less or equal than 2MB");

                    if (x.PosterImageFile.ContentType != "image/jpeg" && x.PosterImageFile.ContentType != "image/png")
                        context.AddFailure(nameof(x.PosterImageFile), "ImageFile must be image/jpeg or image/png");

                }

                if (x != null && x.ImageFiles != null)
                {
                    foreach (var img in x.ImageFiles)
                    {
                        if (img.Length > 2097152)
                            context.AddFailure(nameof(img), "ImageFile must be less or equal than 2MB");

                        if (img.ContentType != "image/jpeg" && img.ContentType != "image/png")
                            context.AddFailure(nameof(img), "ImageFile must be image/jpeg or image/png");
                    }
                }

            });

        }
    }
}
