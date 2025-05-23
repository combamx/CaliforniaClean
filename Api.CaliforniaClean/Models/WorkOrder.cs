using System.ComponentModel.DataAnnotations;

namespace Api.CaliforniaEF;

public partial class WorkOrder
{
    public int ID { get; set; }

    [Required]
    public int Clave { get; set; }

    [Required]
    public int IDProject { get; set; }

    [Required]
    public int IDCustomer { get; set; }

    [StringLength ( 100 )]
    public string? Contact { get; set; }

    [StringLength ( 100 )]
    public string? Address { get; set; }

    [StringLength ( 100 )]
    public string? City { get; set; }

    [Phone]
    [StringLength ( 100 )]
    public string? Phone { get; set; }

    [Required]
    public int IDAssigned { get; set; }

    [Required]
    public int IDProvider { get; set; }

    public string? Description { get; set; }

    [Required]
    [DataType ( DataType.Date )]
    public DateTime DateOrder { get; set; }

    [Required]
    [DataType ( DataType.Date )]
    public DateTime DateEnd { get; set; }

    [Required]
    public int IDType { get; set; }

    [Required]
    public int IDStatusWO { get; set; }

    [Required]
    public int IDStatusCalendario { get; set; }

    [Required]
    public int IDStatus { get; set; }

    public virtual ICollection<ChangeOrder> ChangeOrders { get; } = new List<ChangeOrder> ( );

    public virtual CommentsWO? CommentsWO { get; set; }

    public virtual ICollection<Document> Documents { get; } = new List<Document> ( );

    public virtual Worker IDAssignedNavigation { get; set; } = null!;

    public virtual Customer IDCustomerNavigation { get; set; } = null!;

    public virtual Project IDProjectNavigation { get; set; } = null!;

    public virtual Provider IDProviderNavigation { get; set; } = null!;

    public virtual StatusDate IDStatusCalendarioNavigation { get; set; } = null!;

    public virtual StatusWorkOrder IDStatusNavigation { get; set; } = null!;

    public virtual TypesOrderWork IDTypeNavigation { get; set; } = null!;

    public virtual ICollection<PrintOrdenWork> PrintOrdenWorks { get; } = new List<PrintOrdenWork> ( );

    public virtual ICollection<WorkOrdersOvertime> WorkOrdersOvertimes { get; } = new List<WorkOrdersOvertime> ( );
}
