namespace Api.CaliforniaEF;

public partial class StatusWorkOrder
{
    public int ID { get; set; }

    public string Description { get; set; } = null!;

    public string TextColor { get; set; } = null!;

    public string BackColor { get; set; } = null!;

    public string Filter { get; set; } = null!;

    public byte Order { get; set; }

    public virtual ICollection<WorkOrder> WorkOrders { get; } = new List<WorkOrder>();
}
