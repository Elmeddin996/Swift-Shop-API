using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;
using SwiftShop_Core.Models;

namespace SwiftShop_Data.Configurations
{
    public class SliderConfig : IEntityTypeConfiguration<Slider>
    {
        public void Configure(EntityTypeBuilder<Slider> builder)
        {
            builder.Property(x => x.Title).HasMaxLength(30).IsRequired(false);
            builder.Property(x => x.Desc).HasMaxLength(150).IsRequired(false);
            builder.Property(x => x.ImageName).HasMaxLength(100).IsRequired(false);
        }
    }
}
