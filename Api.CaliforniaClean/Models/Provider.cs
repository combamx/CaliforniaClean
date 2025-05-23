using System.ComponentModel.DataAnnotations;

namespace Api.CaliforniaEF;

public partial class Provider
{
    public int ID { get; set; }

    [Required]
    [StringLength ( 50 )]
    public string Name { get; set; }

    [EmailAddress]
    [StringLength ( 50 )]
    public string? Email { get; set; }

    [StringLength ( 50 )]
    public string? Address { get; set; }

    [StringLength ( 50 )]
    public string? City { get; set; }

    [Range ( 0 , int.MaxValue )]
    public int? Zip { get; set; }

    [Phone]
    [StringLength ( 50 )]
    public string? Phone { get; set; }

    [Required]
    public byte Status { get; set; }

    public virtual ICollection<Project> Projects { get; } = new List<Project> ( );

    public virtual ICollection<WorkOrder> WorkOrders { get; } = new List<WorkOrder> ( );

    public virtual ICollection<WorkOrdersAssigned> WorkOrdersAssigneds { get; } = new List<WorkOrdersAssigned> ( );
}
