using SwiftShop_Services.Dtos.Common;
using SwiftShop_Services.Dtos.ProductDto;


namespace SwiftShop_Services.Interfaces
{
    public interface IProductService
    {
        CreateEntityDto Create(ProductPostDto dto);
        void Edit(ProductPutDto dto);
        ProductGetByIdDto GetById(int id);
        ProductGetByIdAdminDto GetByIdAdmin(int id);
        List<ProductGetDto> GetAll();
        void Delete(int id);
    }
}
