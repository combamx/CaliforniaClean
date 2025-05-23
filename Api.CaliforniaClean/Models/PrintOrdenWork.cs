using System.ComponentModel.DataAnnotations;

namespace Api.CaliforniaEF;

public partial class PrintOrdenWork
{
    public int ID { get; set; }

    [Required]
    public int IDWorkOrder { get; set; }

    [Required]
    [StringLength ( 50 )]
    public string Compania { get; set; }

    [Required]
    [StringLength ( 50 )]
    public string Project { get; set; }

    [Required]
    [DataType ( DataType.Date )]
    public DateTime DatePrint { get; set; }

    [Required]
    [StringLength ( 50 )]
    public string Hour { get; set; }

    [Required]
    [StringLength ( 50 )]
    public string Contact { get; set; }

    [Required]
    [Phone]
    [StringLength ( 50 )]
    public string Phone { get; set; }

    [Required]
    [StringLength ( 50 )]
    public string Address { get; set; }

    [Required]
    [StringLength ( 50 )]
    public string City { get; set; }

    [Required]
    [StringLength ( 50 )]
    public string Assigned { get; set; }

    [StringLength ( 600 )]
    public string? Description { get; set; }

    [StringLength ( 200 )]
    public string? Change { get; set; }

    public virtual WorkOrder IDWorkOrderNavigation { get; set; } = null!;
}
