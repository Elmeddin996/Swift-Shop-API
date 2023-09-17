using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;
using SwiftShop_Core.Models;

namespace SwiftShop_Data.Configurations
{
    public class ProductConfig : IEntityTypeConfiguration<Product>
    {
        public void Configure(EntityTypeBuilder<Product> builder)
        {
            builder.Property(x => x.Name).HasMaxLength(15).IsRequired(true);
            builder.Property(x => x.SalePrice).HasColumnType("money");
            builder.Property(x => x.CostPrice).HasColumnType("money");
        }
    }
}
