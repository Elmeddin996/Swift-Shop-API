namespace SwiftShop_Services.Dtos.ProductDto
{
    public class ProductGetByIdDto
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public string CategoryId { get; set; }
        public string BrandId { get; set; }
        public decimal SalePrice { get; set; }
        public decimal CostPrice { get; set; }

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
