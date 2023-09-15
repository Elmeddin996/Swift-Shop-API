using SwiftShop_Core.Models;
using SwiftShop_Core.Repositories;
using SwiftShop_Data.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SwiftShop_Data.Repository
{
    public class CategoryRepository : Repository<Category>, ICategoryRepository
    {
        public CategoryRepository(SwiftDbContext context) : base(context)
        {

        }
    }
}
