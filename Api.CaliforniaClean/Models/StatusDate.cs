using System.ComponentModel.DataAnnotations;

namespace Api.CaliforniaEF;

public partial class StatusDate
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

    public virtual ICollection<WorkOrder> WorkOrders { get; } = new List<WorkOrder> ( );
}
