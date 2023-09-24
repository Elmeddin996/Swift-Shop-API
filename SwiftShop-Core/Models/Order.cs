using SwiftShop_Core.Enums;

namespace SwiftShop_Core.Models
{
    public class Order
    {
        public int Id { get; set; }   
        public string? UserId { get; set; }
        public string FullName { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public string Note { get; set; }
        public DateTime CreatedAt { get; set; }
        public OrderStatus Status { get; set; }

        public AppUser? AppUser { get; set; }    
        public List<OrderItem> OrderItems { get; set; } = new List<OrderItem>();
    }
}
