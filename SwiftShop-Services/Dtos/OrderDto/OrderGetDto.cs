using SwiftShop_Core.Enums;
using SwiftShop_Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SwiftShop_Services.Dtos.OrderDto
{
    public class OrderGetDto
    {
        public int Id { get; set; }
        public string FullName { get; set; }
        public DateTime CreatedAt { get; set; }
        public OrderStatus Status { get; set; }
        public List<OrderItemInOrderDto> OrderItems { get; set; }
    }

    public class OrderItemInOrderDto
    {
        public int ProductId { get; set; }
        public int Count { get; set; }
    }
}
