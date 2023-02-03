using Api.CaliforniaEF;
using Microsoft.EntityFrameworkCore;

namespace Api.DbContext.CaliforniaEF;

public partial class californiaContext : Microsoft.EntityFrameworkCore.DbContext
{
    public californiaContext()
    {
    }

    public californiaContext(DbContextOptions<californiaContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Building> Buildings { get; set; }

    public virtual DbSet<ChangeOrder> ChangeOrders { get; set; }

    public virtual DbSet<CommentsWO> CommentsWOs { get; set; }

    public virtual DbSet<Customer> Customers { get; set; }

    public virtual DbSet<Document> Documents { get; set; }

    public virtual DbSet<PrintOrdenWork> PrintOrdenWorks { get; set; }

    public virtual DbSet<Project> Projects { get; set; }

    public virtual DbSet<Provider> Providers { get; set; }

    public virtual DbSet<Seller> Sellers { get; set; }

    public virtual DbSet<StatusDate> StatusDates { get; set; }

    public virtual DbSet<StatusProject> StatusProjects { get; set; }

    public virtual DbSet<StatusWorkOrder> StatusWorkOrders { get; set; }

    public virtual DbSet<TypeDocumentProject> TypeDocumentProjects { get; set; }

    public virtual DbSet<TypesOrderWork> TypesOrderWorks { get; set; }

    public virtual DbSet<TypesProject> TypesProjects { get; set; }

    public virtual DbSet<WorkOrder> WorkOrders { get; set; }

    public virtual DbSet<WorkOrdersAssigned> WorkOrdersAssigneds { get; set; }

    public virtual DbSet<WorkOrdersOvertime> WorkOrdersOvertimes { get; set; }

    public virtual DbSet<Worker> Workers { get; set; }

    protected override void OnConfiguring ( DbContextOptionsBuilder optionsBuilder )
    {
        try
        {
            base.OnConfiguring ( optionsBuilder );
            /*=> optionsBuilder.UseSqlServer("Data Source=COCO;Initial Catalog=california;Integrated Security=True;Connect Timeout = 30; Encrypt = False; TrustServerCertificate = False; ApplicationIntent = ReadWrite; MultiSubnetFailover = False");*/
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message, ex);
        }
        
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Building>(entity =>
        {
            entity.Property(e => e.Description).HasMaxLength(50);
        });

        modelBuilder.Entity<ChangeOrder>(entity =>
        {
            entity.HasKey(e => e.ID).HasName("PK_ChangeOrder");

            entity.Property(e => e.Amount).HasColumnType("money");
            entity.Property(e => e.DateChange).HasColumnType("date");
            entity.Property(e => e.Description).HasMaxLength(1);
            entity.Property(e => e.User).HasMaxLength(50);

            entity.HasOne(d => d.IDProjectNavigation).WithMany(p => p.ChangeOrders)
                .HasForeignKey(d => d.IDProject)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ChangeOrders_Projects");

            entity.HasOne(d => d.IDWorkOrderNavigation).WithMany(p => p.ChangeOrders)
                .HasForeignKey(d => d.IDWorkOrder)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ChangeOrders_WorkOrders");
        });

        modelBuilder.Entity<CommentsWO>(entity =>
        {
            entity.HasKey(e => e.ID).HasName("PK_ComentarioWO");

            entity.ToTable("CommentsWO");

            entity.Property(e => e.ID).ValueGeneratedOnAdd();
            entity.Property(e => e.Description).HasMaxLength(100);

            entity.HasOne(d => d.IDNavigation).WithOne(p => p.CommentsWO)
                .HasForeignKey<CommentsWO>(d => d.ID)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_CommentsWO_WorkOrders");
        });

        modelBuilder.Entity<Customer>(entity =>
        {
            entity.Property(e => e.Address).HasMaxLength(100);
            entity.Property(e => e.City).HasMaxLength(50);
            entity.Property(e => e.CompanyName).HasMaxLength(100);
            entity.Property(e => e.Email).HasMaxLength(100);
            entity.Property(e => e.Phone).HasMaxLength(50);
            entity.Property(e => e.Zip).HasMaxLength(50);
        });

        modelBuilder.Entity<Document>(entity =>
        {
            entity.Property(e => e.Description).HasMaxLength(100);
            entity.Property(e => e.Expiration).HasMaxLength(50);
            entity.Property(e => e.Name).HasMaxLength(50);
            entity.Property(e => e.Url).HasMaxLength(100);

            entity.HasOne(d => d.IDChangeOrdenNavigation).WithMany(p => p.Documents)
                .HasForeignKey(d => d.IDChangeOrden)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Documents_ChangeOrders");

            entity.HasOne(d => d.IDProjectNavigation).WithMany(p => p.Documents)
                .HasForeignKey(d => d.IDProject)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Documents_Projects");

            entity.HasOne(d => d.IDWorkOrderNavigation).WithMany(p => p.Documents)
                .HasForeignKey(d => d.IDWorkOrder)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Documents_WorkOrders");

            entity.HasOne(d => d.TypeNavigation).WithMany(p => p.Documents)
                .HasForeignKey(d => d.Type)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Documents_TypeDocumentProjects");
        });

        modelBuilder.Entity<PrintOrdenWork>(entity =>
        {
            entity.Property(e => e.Address).HasMaxLength(50);
            entity.Property(e => e.Assigned).HasMaxLength(50);
            entity.Property(e => e.Change).HasMaxLength(200);
            entity.Property(e => e.City).HasMaxLength(50);
            entity.Property(e => e.Compania).HasMaxLength(50);
            entity.Property(e => e.Contact).HasMaxLength(50);
            entity.Property(e => e.DatePrint).HasColumnType("date");
            entity.Property(e => e.Description).HasMaxLength(600);
            entity.Property(e => e.Hour).HasMaxLength(50);
            entity.Property(e => e.Phone).HasMaxLength(50);
            entity.Property(e => e.Project).HasMaxLength(50);

            entity.HasOne(d => d.IDWorkOrderNavigation).WithMany(p => p.PrintOrdenWorks)
                .HasForeignKey(d => d.IDWorkOrder)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PrintOrdenWorks_WorkOrders");
        });

        modelBuilder.Entity<Project>(entity =>
        {
            entity.Property(e => e.ID).ValueGeneratedNever();
            entity.Property(e => e.Address).HasMaxLength(50);
            entity.Property(e => e.Amount).HasColumnType("money");
            entity.Property(e => e.AmountProvide).HasColumnType("money");
            entity.Property(e => e.City).HasMaxLength(50);
            entity.Property(e => e.DateProject).HasColumnType("date");
            entity.Property(e => e.Description).HasMaxLength(1);
            entity.Property(e => e.OCIP).HasMaxLength(50);
            entity.Property(e => e.ProjectName).HasMaxLength(100);
            entity.Property(e => e.Selle).HasColumnType("money");

            entity.HasOne(d => d.IDCustomerNavigation).WithMany(p => p.Projects)
                .HasForeignKey(d => d.IDCustomer)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Projects_Customers");

            entity.HasOne(d => d.IDProvideNavigation).WithMany(p => p.Projects)
                .HasForeignKey(d => d.IDProvide)
                .HasConstraintName("FK_Projects_Providers");

            entity.HasOne(d => d.IDTypeBuildingNavigation).WithMany(p => p.Projects)
                .HasForeignKey(d => d.IDTypeBuilding)
                .HasConstraintName("FK_Projects_Buildings");

            entity.HasOne(d => d.IDTypeProjectNavigation).WithMany(p => p.Projects)
                .HasForeignKey(d => d.IDTypeProject)
                .HasConstraintName("FK_Projects_TypesProject");

            entity.HasOne(d => d.StatusNavigation).WithMany(p => p.Projects)
                .HasForeignKey(d => d.Status)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Projects_StatusProjects");
        });

        modelBuilder.Entity<Provider>(entity =>
        {
            entity.Property(e => e.Address).HasMaxLength(50);
            entity.Property(e => e.City).HasMaxLength(50);
            entity.Property(e => e.Email).HasMaxLength(50);
            entity.Property(e => e.Name).HasMaxLength(50);
            entity.Property(e => e.Phone).HasMaxLength(50);
        });

        modelBuilder.Entity<Seller>(entity =>
        {
            entity.Property(e => e.Email).HasMaxLength(50);
            entity.Property(e => e.Name).HasMaxLength(50);
            entity.Property(e => e.Phone).HasMaxLength(50);
        });

        modelBuilder.Entity<StatusDate>(entity =>
        {
            entity.ToTable("StatusDate");

            entity.Property(e => e.BackColor).HasMaxLength(50);
            entity.Property(e => e.Description).HasMaxLength(50);
            entity.Property(e => e.TextColor).HasMaxLength(50);
        });

        modelBuilder.Entity<StatusProject>(entity =>
        {
            entity.Property(e => e.Description).HasMaxLength(50);
        });

        modelBuilder.Entity<StatusWorkOrder>(entity =>
        {
            entity.HasKey(e => e.ID).HasName("PK_StatusWorkorders");

            entity.Property(e => e.BackColor).HasMaxLength(50);
            entity.Property(e => e.Description).HasMaxLength(50);
            entity.Property(e => e.Filter).HasMaxLength(50);
            entity.Property(e => e.TextColor).HasMaxLength(50);
        });

        modelBuilder.Entity<TypeDocumentProject>(entity =>
        {
            entity.Property(e => e.Description).HasMaxLength(50);
        });

        modelBuilder.Entity<TypesOrderWork>(entity =>
        {
            entity.ToTable("TypesOrderWork");

            entity.Property(e => e.Description).HasMaxLength(50);
        });

        modelBuilder.Entity<TypesProject>(entity =>
        {
            entity.ToTable("TypesProject");

            entity.Property(e => e.Description).HasMaxLength(50);
        });

        modelBuilder.Entity<WorkOrder>(entity =>
        {
            entity.Property(e => e.Address).HasMaxLength(100);
            entity.Property(e => e.City).HasMaxLength(100);
            entity.Property(e => e.Contact).HasMaxLength(100);
            entity.Property(e => e.DateEnd).HasColumnType("date");
            entity.Property(e => e.DateOrder).HasColumnType("date");
            entity.Property(e => e.Phone).HasMaxLength(100);

            entity.HasOne(d => d.IDAssignedNavigation).WithMany(p => p.WorkOrders)
                .HasForeignKey(d => d.IDAssigned)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_WorkOrders_Workers");

            entity.HasOne(d => d.IDCustomerNavigation).WithMany(p => p.WorkOrders)
                .HasForeignKey(d => d.IDCustomer)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_WorkOrders_Customers");

            entity.HasOne(d => d.IDProjectNavigation).WithMany(p => p.WorkOrders)
                .HasForeignKey(d => d.IDProject)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_WorkOrders_Projects");

            entity.HasOne(d => d.IDProviderNavigation).WithMany(p => p.WorkOrders)
                .HasForeignKey(d => d.IDProvider)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_WorkOrders_Providers");

            entity.HasOne(d => d.IDStatusNavigation).WithMany(p => p.WorkOrders)
                .HasForeignKey(d => d.IDStatus)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_WorkOrders_StatusWorkorders");

            entity.HasOne(d => d.IDStatusCalendarioNavigation).WithMany(p => p.WorkOrders)
                .HasForeignKey(d => d.IDStatusCalendario)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_WorkOrders_StatusDate");

            entity.HasOne(d => d.IDTypeNavigation).WithMany(p => p.WorkOrders)
                .HasForeignKey(d => d.IDType)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_WorkOrders_TypesOrderWork");
        });

        modelBuilder.Entity<WorkOrdersAssigned>(entity =>
        {
            entity.ToTable("WorkOrdersAssigned");

            entity.Property(e => e.DateAssigned).HasColumnType("date");
            entity.Property(e => e.Description).HasMaxLength(50);
            entity.Property(e => e.Document).HasMaxLength(50);

            entity.HasOne(d => d.IDProveedorNavigation).WithMany(p => p.WorkOrdersAssigneds)
                .HasForeignKey(d => d.IDProveedor)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_WorkOrdersAssigned_Providers");

            entity.HasOne(d => d.IDWorkerNavigation).WithMany(p => p.WorkOrdersAssigneds)
                .HasForeignKey(d => d.IDWorker)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_WorkOrdersAssigned_Workers");
        });

        modelBuilder.Entity<WorkOrdersOvertime>(entity =>
        {
            entity.ToTable("WorkOrdersOvertime");

            entity.Property(e => e.DateOrder).HasColumnType("date");

            entity.HasOne(d => d.IDProjectNavigation).WithMany(p => p.WorkOrdersOvertimes)
                .HasForeignKey(d => d.IDProject)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_WorkOrdersOvertime_Projects");

            entity.HasOne(d => d.IDWorkOderNavigation).WithMany(p => p.WorkOrdersOvertimes)
                .HasForeignKey(d => d.IDWorkOder)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_WorkOrdersOvertime_WorkOrders");
        });

        modelBuilder.Entity<Worker>(entity =>
        {
            entity.Property(e => e.Address).HasMaxLength(100);
            entity.Property(e => e.Email).HasMaxLength(50);
            entity.Property(e => e.Name).HasMaxLength(50);
            entity.Property(e => e.Phone).HasMaxLength(50);

            entity.HasOne(d => d.StatusNavigation).WithMany(p => p.Workers)
                .HasForeignKey(d => d.Status)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Workers_Sellers");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
