using SwiftShop_Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SwiftShop_Services.Dtos.BasketItemDto
{
    public class BasketItemPostDto
    {
        public int ProductId { get; set; }
        public string UserId { get; set; }
    }
}
