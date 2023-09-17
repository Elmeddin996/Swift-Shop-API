using SwiftShop_Core.Models;
using SwiftShop_Core.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SwiftShop_Data.Repositories
{
    public class BasketRepository:Repository<BasketItem> ,IBasketRepository
    {
        public BasketRepository(SwiftDbContext context):base(context)
        {
            
        }
    }
}
