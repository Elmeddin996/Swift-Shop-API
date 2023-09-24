using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SwiftShop_Services.Dtos.OrderDto
{
    public class OrderItemDto
    {
        public int ProductId { get; set; }
        public int Count { get; set; }
    }
}
