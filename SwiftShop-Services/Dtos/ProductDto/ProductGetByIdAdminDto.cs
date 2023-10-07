using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SwiftShop_Services.Dtos.ProductDto
{
    public class ProductGetByIdAdminDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int CategoryId { get; set; }
        public int BrandId { get; set; }
        public int Rate { get; set; }
        public decimal SalePrice { get; set; }
        public decimal CostPrice { get; set; }
        public decimal DiscountPercent { get; set; }
        public int Stock { get; set; }
        public string ImageName { get; set; }
        public string ImageUrl { get; set; }



        public List<string> ImageNames { get; set; }
        public List<string> ImageUrls { get; set; }
    }

}
