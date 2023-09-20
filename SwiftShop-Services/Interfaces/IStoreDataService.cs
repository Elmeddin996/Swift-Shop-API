using SwiftShop_Services.Dtos.Common;
using SwiftShop_Services.Dtos.StoreDataDto;


namespace SwiftShop_Services.Interfaces
{
    public interface IStoreDataService
    {
        CreateEntityDto Create(StoreDataPostDto dto);
        void Edit(StoreDataPutDto dto);
        StoreDataGetDto Get();
    }
}
