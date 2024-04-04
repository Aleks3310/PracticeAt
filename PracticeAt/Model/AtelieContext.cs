using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace PracticeAt;

public partial class AtelieContext : DbContext
{
    public AtelieContext()
    {
    }

    public AtelieContext(DbContextOptions<AtelieContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Client> Clients { get; set; }

    public virtual DbSet<Material> Materials { get; set; }

    public virtual DbSet<Measurement> Measurements { get; set; }

    public virtual DbSet<Modernization> Modernizations { get; set; }

    public virtual DbSet<Order> Orders { get; set; }

    public virtual DbSet<Payment> Payments { get; set; }

    public virtual DbSet<Position> Positions { get; set; }

    public virtual DbSet<Provider> Providers { get; set; }

    public virtual DbSet<Repair> Repairs { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<Worker> Workers { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseNpgsql("Host=localhost;Port=5432;Database=Atelie;Username=postgres;Password=1234");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Client>(entity =>
        {
            entity.HasKey(e => e.Clientid).HasName("clients_pkey");

            entity.ToTable("clients");

            entity.Property(e => e.Clientid).HasColumnName("clientid");
            entity.Property(e => e.Email)
                .HasMaxLength(40)
                .HasColumnName("email");
            entity.Property(e => e.FirstName)
                .HasMaxLength(70)
                .HasColumnName("first_name");
            entity.Property(e => e.LastName)
                .HasMaxLength(70)
                .HasColumnName("last_name");
            entity.Property(e => e.Patronymic)
                .HasMaxLength(70)
                .HasColumnName("patronymic");
            entity.Property(e => e.PhoneNumber)
                .HasMaxLength(16)
                .HasColumnName("phone_number");
        });

        modelBuilder.Entity<Material>(entity =>
        {
            entity.HasKey(e => e.Materialid).HasName("materials_pkey");

            entity.ToTable("materials");

            entity.Property(e => e.Materialid).HasColumnName("materialid");
            entity.Property(e => e.Name)
                .HasMaxLength(100)
                .HasColumnName("name");
            entity.Property(e => e.Providerid).HasColumnName("providerid");
            entity.Property(e => e.Quantity).HasColumnName("quantity");
            entity.Property(e => e.Unit)
                .HasMaxLength(7)
                .HasColumnName("unit");
            entity.Property(e => e.UnitCost).HasColumnName("unit_cost");

            entity.HasOne(d => d.Provider).WithMany(p => p.Materials)
                .HasForeignKey(d => d.Providerid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("materials_providerid_fkey");
        });

        modelBuilder.Entity<Measurement>(entity =>
        {
            entity.HasKey(e => e.Measurementid).HasName("measurements_pkey");

            entity.ToTable("measurements");

            entity.Property(e => e.Measurementid).HasColumnName("measurementid");
            entity.Property(e => e.ArmLength).HasColumnName("arm_length");
            entity.Property(e => e.ChestWidth).HasColumnName("chest_width");
            entity.Property(e => e.Clientid).HasColumnName("clientid");
            entity.Property(e => e.HipCircumference).HasColumnName("hip_circumference");
            entity.Property(e => e.MeasurementDate).HasColumnName("measurement_date");
            entity.Property(e => e.ShoulderWidth).HasColumnName("shoulder_width");
            entity.Property(e => e.WaistSize).HasColumnName("waist_size");

            entity.HasOne(d => d.Client).WithMany(p => p.Measurements)
                .HasForeignKey(d => d.Clientid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("measurements_clientid_fkey");
        });

        modelBuilder.Entity<Modernization>(entity =>
        {
            entity.HasKey(e => e.Modernid).HasName("modernization_pkey");

            entity.ToTable("modernization");

            entity.Property(e => e.Modernid).HasColumnName("modernid");
            entity.Property(e => e.Materialid).HasColumnName("materialid");
            entity.Property(e => e.Measurementid).HasColumnName("measurementid");
            entity.Property(e => e.ModernCost).HasColumnName("modern_cost");
            entity.Property(e => e.ModernTime)
                .HasMaxLength(14)
                .HasColumnName("modern_time");
            entity.Property(e => e.Orderid).HasColumnName("orderid");
            entity.Property(e => e.Workerid).HasColumnName("workerid");

            entity.HasOne(d => d.Material).WithMany(p => p.Modernizations)
                .HasForeignKey(d => d.Materialid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("modernization_materialid_fkey");

            entity.HasOne(d => d.Measurement).WithMany(p => p.Modernizations)
                .HasForeignKey(d => d.Measurementid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("modernization_measurementid_fkey");

            entity.HasOne(d => d.Order).WithMany(p => p.Modernizations)
                .HasForeignKey(d => d.Orderid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("modernization_orderid_fkey");

            entity.HasOne(d => d.Worker).WithMany(p => p.Modernizations)
                .HasForeignKey(d => d.Workerid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("modernization_workerid_fkey");
        });

        modelBuilder.Entity<Order>(entity =>
        {
            entity.HasKey(e => e.Orderid).HasName("orders_pkey");

            entity.ToTable("orders");

            entity.Property(e => e.Orderid).HasColumnName("orderid");
            entity.Property(e => e.Clientid).HasColumnName("clientid");
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.OrderDate).HasColumnName("order_date");
            entity.Property(e => e.Status)
                .HasMaxLength(12)
                .HasColumnName("status");

            entity.HasOne(d => d.Client).WithMany(p => p.Orders)
                .HasForeignKey(d => d.Clientid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("orders_clientid_fkey");
        });

        modelBuilder.Entity<Payment>(entity =>
        {
            entity.HasKey(e => e.Paymentid).HasName("payments_pkey");

            entity.ToTable("payments");

            entity.Property(e => e.Paymentid).HasColumnName("paymentid");
            entity.Property(e => e.Modernid).HasColumnName("modernid");
            entity.Property(e => e.Orderid).HasColumnName("orderid");
            entity.Property(e => e.PaymentAmount).HasColumnName("payment_amount");
            entity.Property(e => e.PaymentDate).HasColumnName("payment_date");
            entity.Property(e => e.Repairid).HasColumnName("repairid");

            entity.HasOne(d => d.Modern).WithMany(p => p.Payments)
                .HasForeignKey(d => d.Modernid)
                .HasConstraintName("payments_upgradeid_fkey");

            entity.HasOne(d => d.Order).WithMany(p => p.Payments)
                .HasForeignKey(d => d.Orderid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("payments_orderid_fkey");

            entity.HasOne(d => d.Repair).WithMany(p => p.Payments)
                .HasForeignKey(d => d.Repairid)
                .HasConstraintName("payments_repairid_fkey");
        });

        modelBuilder.Entity<Position>(entity =>
        {
            entity.HasKey(e => e.Positionid).HasName("positions_pkey");

            entity.ToTable("positions");

            entity.Property(e => e.Positionid).HasColumnName("positionid");
            entity.Property(e => e.PositionName)
                .HasMaxLength(15)
                .HasColumnName("position_name");
        });

        modelBuilder.Entity<Provider>(entity =>
        {
            entity.HasKey(e => e.Providerid).HasName("providers_pkey");

            entity.ToTable("providers");

            entity.Property(e => e.Providerid).HasColumnName("providerid");
            entity.Property(e => e.Amount).HasColumnName("amount");
            entity.Property(e => e.Date).HasColumnName("date");
            entity.Property(e => e.MaterialName)
                .HasMaxLength(100)
                .HasColumnName("material_name");
            entity.Property(e => e.PhoneNumber)
                .HasMaxLength(16)
                .HasColumnName("phone_number");
            entity.Property(e => e.ProviderName)
                .HasMaxLength(100)
                .HasColumnName("provider_name");
        });

        modelBuilder.Entity<Repair>(entity =>
        {
            entity.HasKey(e => e.Repairid).HasName("repairs_pkey");

            entity.ToTable("repairs");

            entity.Property(e => e.Repairid).HasColumnName("repairid");
            entity.Property(e => e.Materialid).HasColumnName("materialid");
            entity.Property(e => e.Orderid).HasColumnName("orderid");
            entity.Property(e => e.RepairCost).HasColumnName("repair_cost");
            entity.Property(e => e.RepairTime)
                .HasMaxLength(14)
                .HasColumnName("repair_time");
            entity.Property(e => e.Workerid).HasColumnName("workerid");

            entity.HasOne(d => d.Material).WithMany(p => p.Repairs)
                .HasForeignKey(d => d.Materialid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("repairs_materialid_fkey");

            entity.HasOne(d => d.Order).WithMany(p => p.Repairs)
                .HasForeignKey(d => d.Orderid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("repairs_orderid_fkey");

            entity.HasOne(d => d.Worker).WithMany(p => p.Repairs)
                .HasForeignKey(d => d.Workerid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("repairs_workerid_fkey");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.Userid).HasName("users_pkey");

            entity.ToTable("users");

            entity.Property(e => e.Userid).HasColumnName("userid");
            entity.Property(e => e.Login)
                .HasMaxLength(50)
                .HasColumnName("login");
            entity.Property(e => e.Password)
                .HasMaxLength(100)
                .HasColumnName("password");
        });

        modelBuilder.Entity<Worker>(entity =>
        {
            entity.HasKey(e => e.Workerid).HasName("workers_pkey");

            entity.ToTable("workers");

            entity.Property(e => e.Workerid).HasColumnName("workerid");
            entity.Property(e => e.Address).HasColumnName("address");
            entity.Property(e => e.BirthDate).HasColumnName("birth_date");
            entity.Property(e => e.FirstName)
                .HasMaxLength(70)
                .HasColumnName("first_name");
            entity.Property(e => e.LastName)
                .HasMaxLength(70)
                .HasColumnName("last_name");
            entity.Property(e => e.PassportNumber)
                .HasMaxLength(6)
                .HasColumnName("passport_number");
            entity.Property(e => e.PassportSeries)
                .HasMaxLength(4)
                .HasColumnName("passport_series");
            entity.Property(e => e.Patronymic)
                .HasMaxLength(70)
                .HasColumnName("patronymic");
            entity.Property(e => e.PhoneNumber)
                .HasMaxLength(16)
                .HasColumnName("phone_number");
            entity.Property(e => e.Positionid).HasColumnName("positionid");
            entity.Property(e => e.Userid).HasColumnName("userid");

            entity.HasOne(d => d.Position).WithMany(p => p.Workers)
                .HasForeignKey(d => d.Positionid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("workers_positionid_fkey");

            entity.HasOne(d => d.User).WithMany(p => p.Workers)
                .HasForeignKey(d => d.Userid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("workers_userid_fkey");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
