using System.ComponentModel.DataAnnotations;

namespace Api.CaliforniaEF;

public partial class StatusWorkOrder
{
    public int ID { get; set; }

    [Required]
    [StringLength ( 50 )]
    public string Description { get; set; }

    [Required]
    [StringLength ( 50 )]
    public string TextColor { get; set; }

    [Required]
    [StringLength ( 50 )]
    public string BackColor { get; set; }

    [Required]
    [StringLength ( 50 )]
    public string Filter { get; set; }

    [Required]
    public byte Order { get; set; }

    public virtual ICollection<WorkOrder> WorkOrders { get; } = new List<WorkOrder> ( );
}
