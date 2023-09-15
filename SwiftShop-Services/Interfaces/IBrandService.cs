using SwiftShop_Services.Dtos.CategoryDto;
using SwiftShop_Services.Dtos.Common;
using SwiftShop_Services.Dtos.BrandDto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SwiftShop_Services.Interfaces
{
    public interface IBrandService
    {
        CreateEntityDto Create(BrandPostDto dto);
        void Edit(int id, BrandPutDto dto);
        List<BrandGetDto> GetAll();
        BrandGetByIdDto GetById(int id);
        void Delete(int id);
    }
}
