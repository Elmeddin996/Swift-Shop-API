using SwiftShop_Services.Dtos.Common;
using SwiftShop_Services.Dtos.SliderDto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SwiftShop_Services.Interfaces
{
    public interface ISliderService
    {
        CreateEntityDto Create(SliderPostDto dto);
        void Edit(int id, SliderPutDto dto);
        SliderGetByIdDto GetById(int id);
        List<SliderGetDto> GetAll();
        void Delete(int id);
    }
}
