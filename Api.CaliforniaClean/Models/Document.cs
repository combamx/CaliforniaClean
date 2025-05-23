using System.ComponentModel.DataAnnotations;

namespace Api.CaliforniaEF;

public partial class Document
{
    public int ID { get; set; }

    [Required]
    [StringLength ( 50 )]
    public string Name { get; set; }

    [Required]
    [StringLength ( 100 )]
    public string Description { get; set; }

    [Required]
    [StringLength ( 100 )]
    [Url]
    public string Url { get; set; }

    [Required]
    public int IDCustomer { get; set; }

    [Required]
    public int IDProvide { get; set; }

    [Required]
    public int IDProject { get; set; }

    [Required]
    public int IDWorkOrder { get; set; }

    [Required]
    public int IDChangeOrden { get; set; }

    [Required]
    [StringLength ( 50 )]
    public string Expiration { get; set; }

    [Required]
    public int Type { get; set; }

    [Required]
    public int Status { get; set; }

    public virtual ChangeOrder IDChangeOrdenNavigation { get; set; } = null!;

    public virtual Project IDProjectNavigation { get; set; } = null!;

    public virtual WorkOrder IDWorkOrderNavigation { get; set; } = null!;

    public virtual TypeDocumentProject TypeNavigation { get; set; } = null!;
}
