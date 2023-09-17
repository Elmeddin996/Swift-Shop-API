namespace SwiftShop_Services.Dtos.ProductDto
{
    public class ProductGetDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string CategoryId { get; set; }
        public string BrandId { get; set; }
        public decimal SalePrice { get; set; }
        public decimal CostPrice { get; set; }

        public string ImageName { get; set; }
        public string ImageUrl { get; set; }

    }
}
