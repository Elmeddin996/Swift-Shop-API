namespace SwiftShop_Core.Models
{
    public class Product
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public string? Description { get; set; }
        public int CategoryId { get; set; }
        public int BrandId { get; set; }
        public int Rate { get; set; }
        public decimal SalePrice { get; set; }
        public decimal CostPrice { get; set; }
        public decimal DiscountPercent { get; set; }
        public int Stock { get; set; }


        public List<ProductImage> ProductImages { get; set; } = new List<ProductImage>();
        public Category Category { get; set; }
        public Brand Brand { get; set; }

    }
}
