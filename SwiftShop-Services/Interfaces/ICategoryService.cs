using SwiftShop_Services.Dtos.CategoryDto;
using SwiftShop_Services.Dtos.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SwiftShop_Services.Implementations;

namespace SwiftShop_Services.Interfaces
{
    public interface ICategoryService
    {
        CreateEntityDto Create(CategoryPostDto dto);
        void Edit(CategoryPutDto dto);
        List<CategoryGetDto> GetAll();
        CategoryGetByIdDto GetById(int id);
        void Delete(int id);
    }
}
