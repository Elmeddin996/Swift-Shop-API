using FluentValidation;
using Microsoft.AspNetCore.Http;


namespace SwiftShop_Services.Dtos.ProductDto
{
    public class ProductPutDto
    {

        public int CategoryId { get; set; }
        public int BrandId { get; set; }
        public string Name { get; set; }
        public decimal SalePrice { get; set; }
        public decimal CostPrice { get; set; }
        public string Description { get; set; }
        public decimal DiscountPercent { get; set; }


        public IFormFile PosterImageFile { get; set; }
        public List<IFormFile>? ImageFiles { get; set; }
    }

    public class ProductPutDtoValidator : AbstractValidator<ProductPutDto>
    {
        public ProductPutDtoValidator()
        {
            RuleFor(x => x.Name).NotEmpty().MaximumLength(15).MinimumLength(2);
            RuleFor(x => x.SalePrice).GreaterThanOrEqualTo(x => x.CostPrice);
            RuleFor(x => x.CostPrice).GreaterThanOrEqualTo(0);
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

                if (x.PosterImageFile.Length > 2097152)
                    context.AddFailure(nameof(x.PosterImageFile), "ImageFile must be less or equal than 2MB");

                if (x.PosterImageFile.ContentType != "image/jpeg" && x.PosterImageFile.ContentType != "image/png")
                    context.AddFailure(nameof(x.PosterImageFile), "ImageFile must be image/jpeg or image/png");


                if (x.ImageFiles != null)
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
