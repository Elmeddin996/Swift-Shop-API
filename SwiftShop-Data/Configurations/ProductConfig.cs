﻿using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;
using SwiftShop_Core.Models;

namespace SwiftShop_Data.Configurations
{
    public class ProductConfig : IEntityTypeConfiguration<Product>
    {
        public void Configure(EntityTypeBuilder<Product> builder)
        {
            builder.Property(x => x.Name).HasMaxLength(25).IsRequired(true);
            builder.Property(x => x.Stock).IsRequired(true);
            builder.Property(x => x.SalePrice).HasColumnType("money");
            builder.Property(x => x.CostPrice).HasColumnType("money");
            builder.Property(x => x.DiscountPercent).HasColumnType("money");
        }
    }
}
