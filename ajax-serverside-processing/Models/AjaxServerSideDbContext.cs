using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace ajax_serverside_processing.Models
{
    public partial class AjaxServerSideDbContext : DbContext
    {
        public AjaxServerSideDbContext()
        {
        }

        public AjaxServerSideDbContext(DbContextOptions<AjaxServerSideDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<ShippingTb> ShippingTb { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ShippingTb>(entity =>
            {
                entity.ToTable("ShippingTB");

                entity.Property(e => e.CompanyAgent).HasMaxLength(100);

                entity.Property(e => e.CompanyName).HasMaxLength(100);

                entity.Property(e => e.Country).HasMaxLength(100);

                entity.Property(e => e.OrderId).HasMaxLength(100);

                entity.Property(e => e.ShipAddress).HasMaxLength(100);

                entity.Property(e => e.ShipCity).HasMaxLength(100);

                entity.Property(e => e.ShipDate).HasColumnType("datetime");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
