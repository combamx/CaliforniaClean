namespace Api.CaliforniaEF;

public partial class Project
{
    public int ID { get; set; }

    public string ProjectName { get; set; } = null!;

    public string Address { get; set; } = null!;

    public string? City { get; set; }

    public string? Description { get; set; }

    public DateTime? DateProject { get; set; }

    public decimal? Amount { get; set; }

    public double? RetentionsProject { get; set; }

    public decimal? Retentions { get; set; }

    public double? SellerProject { get; set; }

    public decimal? Selle { get; set; }

    public int IDCustomer { get; set; }

    public int? IDSeller { get; set; }

    public int? IDProvide { get; set; }

    public int? IDTypeProject { get; set; }

    public int? IDTypeBuilding { get; set; }

    public decimal? AmountProvide { get; set; }

    public string? Inclusion { get; set; }

    public string OCIP { get; set; } = null!;

    public int Status { get; set; }

    public virtual ICollection<ChangeOrder> ChangeOrders { get; } = new List<ChangeOrder>();

    public virtual ICollection<Document> Documents { get; } = new List<Document>();

    public virtual Customer IDCustomerNavigation { get; set; } = null!;

    public virtual Provider? IDProvideNavigation { get; set; }

    public virtual Building? IDTypeBuildingNavigation { get; set; }

    public virtual TypesProject? IDTypeProjectNavigation { get; set; }

    public virtual StatusProject StatusNavigation { get; set; } = null!;

    public virtual ICollection<WorkOrder> WorkOrders { get; } = new List<WorkOrder>();

    public virtual ICollection<WorkOrdersOvertime> WorkOrdersOvertimes { get; } = new List<WorkOrdersOvertime>();
}
