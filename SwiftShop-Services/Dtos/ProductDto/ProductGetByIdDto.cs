namespace SwiftShop_Services.Dtos.ProductDto
{
    public class ProductGetByIdDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int CategoryId { get; set; }
        public int BrandId { get; set; }
        public int Rate { get; set; }
        public decimal SalePrice { get; set; }
        public decimal DiscountPercent { get; set; }
        public int Stock { get; set; }



        public List<string> ImageNames { get; set; }
        public List<string> ImageUrls { get; set; }
        public CategoryInProductDto Category { get; set; }
        public BrandInProductDto Brand { get; set; }
    }

    public class CategoryInProductDto
    {
        public int Id { get; set; }
        public string Name { get; set; }

    }

    public class BrandInProductDto
    {
        public int Id { get; set; }
        public string Name { get; set; }

    }
}
