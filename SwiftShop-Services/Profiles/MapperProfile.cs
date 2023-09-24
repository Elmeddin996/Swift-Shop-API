using AutoMapper;
using Microsoft.AspNetCore.Http;
using SwiftShop_Core.Models;
using SwiftShop_Services.Dtos.BasketItemDto;
using SwiftShop_Services.Dtos.BrandDto;
using SwiftShop_Services.Dtos.CategoryDto;
using SwiftShop_Services.Dtos.OrderDto;
using SwiftShop_Services.Dtos.ProductDto;
using SwiftShop_Services.Dtos.SliderDto;
using SwiftShop_Services.Dtos.StoreDataDto;


namespace SwiftShop_Services.Profiles
{
    public class MapperProfile : Profile
    {
        public MapperProfile(IHttpContextAccessor accessor)
        {

            CreateMap<Product, ProductGetByIdDto>();
            CreateMap<Product, ProductGetDto>();
            CreateMap<ProductPostDto, Product>();
            CreateMap<Product, ProductPutDto>();
            CreateMap<ProductPutDto, Product>();


            CreateMap<CategoryPostDto, Category>();
            CreateMap<CategoryPutDto, Category>();
            CreateMap<Category, CategoryGetDto>();
            CreateMap<Category, CategoryInProductDto>();
            CreateMap<Category, CategoryGetByIdDto>();

            CreateMap<BrandPostDto, Brand>();
            CreateMap<BrandPutDto, Brand>();
            CreateMap<Brand, BrandGetDto>();
            CreateMap<Brand, BrandInProductDto>();
            CreateMap<Brand, BrandGetByIdDto>();

            CreateMap<SliderPostDto, Slider>();
            CreateMap<SliderPutDto, Slider>();
            CreateMap<Slider, SliderGetByIdDto>();
            CreateMap<Slider, SliderGetDto>();

            CreateMap<OrderPutDto, Order>();
            CreateMap<Order, OrderGetByIdDto>();
            CreateMap<Order, OrderGetDto>();

            CreateMap<OrderItem, OrderItemInOrderDto>();

            CreateMap<BasketItemPostDto, BasketItem>();
            CreateMap<BasketItem, BasketItemGetDto>(); 
            
            CreateMap<StoreDataPostDto, StoreData>();
            CreateMap<StoreData, StoreDataGetDto>();

        }
    }
}
