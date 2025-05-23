using System.ComponentModel.DataAnnotations;

namespace Api.CaliforniaEF;

public partial class Worker
{
    public int ID { get; set; }

    [Required]
    [StringLength ( 50 )]
    public string Name { get; set; }

    [StringLength ( 100 )]
    public string? Address { get; set; }

    [Phone]
    [StringLength ( 50 )]
    public string? Phone { get; set; }

    [EmailAddress]
    [StringLength ( 50 )]
    public string? Email { get; set; }

    public int Status { get; set; }

    public virtual Seller StatusNavigation { get; set; } = null!;

    public virtual ICollection<WorkOrder> WorkOrders { get; } = new List<WorkOrder> ( );

    public virtual ICollection<WorkOrdersAssigned> WorkOrdersAssigneds { get; } = new List<WorkOrdersAssigned> ( );
}
