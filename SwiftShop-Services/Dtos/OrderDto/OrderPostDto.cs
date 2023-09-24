using SwiftShop_Core.Enums;
using System.Text.Json.Serialization;

namespace SwiftShop_Services.Dtos.OrderDto
{
    public class OrderPostDto
    {
        [JsonIgnore]
        public string? UserId { get; set; }
        public string FullName { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public string Note { get; set; }
        public List<OrderItemDto> OrderItems { get; set; }
    }
}
