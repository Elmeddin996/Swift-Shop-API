using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;
using SwiftShop_Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SwiftShop_Data.Configurations
{
    public class OrderConfig : IEntityTypeConfiguration<Order>
    {
        public void Configure(EntityTypeBuilder<Order> builder)
        {
            builder.Property(x => x.FullName).HasMaxLength(20).IsRequired(true);
            builder.Property(x => x.Address).HasMaxLength(100).IsRequired(true);
            builder.Property(x => x.Note).HasMaxLength(200);
            builder.Property(x => x.Email).HasMaxLength(50).IsRequired(true);
            builder.Property(x => x.Phone).HasMaxLength(20).IsRequired(true);

        }
    }
}
