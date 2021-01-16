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

//        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
//        {
//            if (!optionsBuilder.IsConfigured)
//            {
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
//                optionsBuilder.UseSqlServer("Server=DESKTOP-01F9C8A;Initial Catalog=AjaxServerSideDb;Persist Security Info=True;User ID=sa;Password=2good2btrue;");
//            }
//        }

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
