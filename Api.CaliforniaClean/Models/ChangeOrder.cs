using System.ComponentModel.DataAnnotations;

namespace Api.CaliforniaEF;

public partial class ChangeOrder
{
    public int ID { get; set; }

    [Required]
    public int Clave { get; set; }

    [Required]
    [DataType ( DataType.Date )]
    public DateTime DateChange { get; set; }

    [Required]
    [Range ( 0 , double.MaxValue )]
    public decimal Amount { get; set; }

    [Required]
    public int IDStatusCO { get; set; }

    [Required]
    public int IDWorkOrder { get; set; }

    [Required]
    public int IDProject { get; set; }

    [StringLength ( 1 )]
    public string? Description { get; set; }

    [Required]
    [StringLength ( 50 )]
    public string User { get; set; }

    [Required]
    public bool Status { get; set; }

    public virtual ICollection<Document> Documents { get; } = new List<Document> ( );

    public virtual Project IDProjectNavigation { get; set; } = null!;

    public virtual WorkOrder IDWorkOrderNavigation { get; set; } = null!;
}
