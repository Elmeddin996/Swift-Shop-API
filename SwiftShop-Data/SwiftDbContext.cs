using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using SwiftShop_Core.Models;
using SwiftShop_Data.Configurations;

namespace SwiftShop_Data
{
    public class SwiftDbContext : IdentityDbContext
    {
        public SwiftDbContext(DbContextOptions<SwiftDbContext> options) : base(options)
        {
        }

        public DbSet<Product> Products { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Brand> Brands { get; set; }
        public DbSet<ProductImage> ProductImages { get; set; }
        public DbSet<Slider> Sliders { get; set; }
        public DbSet<AppUser> AppUsers { get; set; }
        public DbSet<BasketItem> BasketItems { get; set; }
        public DbSet<StoreData> StoreData { get; set; }
        public DbSet<Order> Orders { get; set; }    
        public DbSet<OrderItem> OrderItems { get; set; }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfigurationsFromAssembly(typeof(CategoryConfig).Assembly);
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Product>()
           .HasMany(product => product.ProductImages)
           .WithOne(image => image.Product)
           .HasForeignKey(image => image.ProductId);

            modelBuilder.Entity<Product>()
           .HasOne(product => product.Category)
           .WithMany(category => category.Products)
           .HasForeignKey(product => product.CategoryId);

            modelBuilder.Entity<Product>()
           .HasOne(product => product.Brand)
           .WithMany(brand => brand.Products)
           .HasForeignKey(product => product.BrandId);

            modelBuilder.Entity<BasketItem>()
           .HasOne(item => item.User)
           .WithMany(user => user.BasketItems)
           .HasForeignKey(item => item.UserId);

            modelBuilder.Entity<BasketItem>()
           .HasOne(item => item.Product)
           .WithMany()
           .HasForeignKey(item => item.ProductId);

            modelBuilder.Entity<Order>()
           .HasOne(item => item.AppUser)
           .WithMany(user=>user.Orders)
           .HasForeignKey(item => item.UserId);

            modelBuilder.Entity<Order>()
          .HasMany(o=>o.OrderItems)
          .WithOne(oi => oi.Order)
          .HasForeignKey(item => item.OrderId);

            modelBuilder.Entity<OrderItem>()
           .HasOne(oi=>oi.Order)
           .WithMany(o=>o.OrderItems)
           .HasForeignKey(oi => oi.OrderId);
        }
    }
}
