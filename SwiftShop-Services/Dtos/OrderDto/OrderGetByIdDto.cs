using SwiftShop_Core.Enums;
using SwiftShop_Core.Models;

namespace SwiftShop_Services.Dtos.OrderDto
{
    public class OrderGetByIdDto
    {
        public int Id { get; set; }
        public string FullName { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public string Note { get; set; }
        public DateTime CreatedAt { get; set; }
        public OrderStatus Status { get; set; }
        public List<OrderItemInOrderDto> OrderItems { get; set; }

    }
}
