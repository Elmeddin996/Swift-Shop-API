using SwiftShop_Core.Models;
using SwiftShop_Core.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SwiftShop_Data.Repositories
{
    public class BrandRepository : Repository<Brand>, IBrandRepository
    {
        public BrandRepository(SwiftDbContext context) : base(context)
        {

        }
    }
    
}
