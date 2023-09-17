﻿using SwiftShop_Services.Dtos.BasketItemDto;
using SwiftShop_Services.Dtos.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SwiftShop_Services.Interfaces
{
    public interface IBasketService
    {
        void ReduceBasketItem(BasketItemPostDto dto);
        void AddToBasket(BasketItemPostDto dto);
        List<BasketItemGetDto> GetAll();
        void Delete(int id);
    }
}