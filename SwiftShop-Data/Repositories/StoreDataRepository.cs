using SwiftShop_Core.Models;
using SwiftShop_Core.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SwiftShop_Data.Repositories
{
    public class StoreDataRepository:Repository<StoreData>,IStoreDataRepository
    {
        public StoreDataRepository(SwiftDbContext context) : base(context) { }
    }
}
