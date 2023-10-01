using Microsoft.AspNetCore.Identity;

namespace SwiftShop_Core.Models
{
    public class AppUser:IdentityUser
    {
        public string FullName { get; set; }
        public string? Address { get; set; }
        public string Phone { get; set; }
        public bool IsAdmin { get; set; }

        public ICollection<BasketItem> BasketItems { get; set; }
        public ICollection<Order> Orders { get; set; }
    }
}
