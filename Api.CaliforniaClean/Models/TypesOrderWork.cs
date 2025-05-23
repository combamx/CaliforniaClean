using System.ComponentModel.DataAnnotations;

namespace Api.CaliforniaEF;

public partial class TypesOrderWork
{
    public int ID { get; set; }

    [Required]
    [StringLength ( 50 )]
    public string Description { get; set; }

    public virtual ICollection<WorkOrder> WorkOrders { get; } = new List<WorkOrder> ( );
}
