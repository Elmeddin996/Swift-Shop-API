using SwiftShop_Services.Dtos.OrderDto;
using SwiftShop_Services.Dtos.Common;

namespace SwiftShop_Services.Interfaces
{
    public interface IOrderService
    {
        CreateEntityDto Create(OrderPostDto dto);
        void Edit(int id, OrderPutDto dto);
        List<OrderGetDto> GetAll();
        OrderGetByIdDto GetById(int id);
        void Delete(int id);
    }
}
