using System.ComponentModel.DataAnnotations;

namespace Api.CaliforniaEF;

public class Customer
{
    public int ID { get; set; }

    [Required]
    [StringLength ( 100 )]
    public string CompanyName { get; set; }

    [StringLength ( 100 )]
    public string? Address { get; set; }

    [StringLength ( 50 )]
    public string? City { get; set; }

    [StringLength ( 10 )]
    public string? Zip { get; set; }

    [Phone]
    [StringLength ( 50 )]
    public string? Phone { get; set; }

    public bool Status { get; set; }

    [EmailAddress]
    [StringLength ( 100 )]
    public string? Email { get; set; }

    public virtual ICollection<Project> Projects { get; } = new List<Project> ( );

    public virtual ICollection<WorkOrder> WorkOrders { get; } = new List<WorkOrder> ( );

}

