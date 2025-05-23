using System.ComponentModel.DataAnnotations;

namespace Api.CaliforniaEF;

public partial class Project
{
    public int ID { get; set; }

    [Required]
    [StringLength ( 100 )]
    public string ProjectName { get; set; }

    [Required]
    [StringLength ( 50 )]
    public string Address { get; set; }

    [StringLength ( 50 )]
    public string? City { get; set; }

    [StringLength ( 100 )]
    public string? Description { get; set; }

    [DataType ( DataType.Date )]
    public DateTime? DateProject { get; set; }

    [Range ( 0 , double.MaxValue )]
    public decimal? Amount { get; set; }

    public double? RetentionsProject { get; set; }

    [Range ( 0 , double.MaxValue )]
    public decimal? Retentions { get; set; }

    public double? SellerProject { get; set; }

    [Range ( 0 , double.MaxValue )]
    public decimal? Selle { get; set; }

    public int IDCustomer { get; set; }

    public int? IDSeller { get; set; }

    public int? IDProvide { get; set; }

    public int? IDTypeProject { get; set; }

    public int? IDTypeBuilding { get; set; }

    [Range ( 0 , double.MaxValue )]
    public decimal? AmountProvide { get; set; }

    public string? Inclusion { get; set; }

    [Required]
    [StringLength ( 50 )]
    public string OCIP { get; set; }

    public int Status { get; set; }

    public virtual ICollection<ChangeOrder> ChangeOrders { get; } = new List<ChangeOrder> ( );

    public virtual ICollection<Document> Documents { get; } = new List<Document> ( );

    public virtual Customer IDCustomerNavigation { get; set; } = null!;

    public virtual Provider? IDProvideNavigation { get; set; }

    public virtual Building? IDTypeBuildingNavigation { get; set; }

    public virtual TypesProject? IDTypeProjectNavigation { get; set; }

    public virtual StatusProject StatusNavigation { get; set; } = null!;

    public virtual ICollection<WorkOrder> WorkOrders { get; } = new List<WorkOrder> ( );

    public virtual ICollection<WorkOrdersOvertime> WorkOrdersOvertimes { get; } = new List<WorkOrdersOvertime> ( );
}
