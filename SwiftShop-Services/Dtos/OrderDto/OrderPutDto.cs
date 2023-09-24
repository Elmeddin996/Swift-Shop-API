using SwiftShop_Core.Enums;
using SwiftShop_Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SwiftShop_Services.Dtos.OrderDto
{
    public class OrderPutDto
    {
        public OrderStatus Status { get; set; }
    }
}
