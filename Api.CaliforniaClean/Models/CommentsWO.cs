namespace Api.CaliforniaEF;
public partial class CommentsWO
{
    public int ID { get; set; }

    public string Description { get; set; } = null!;

    public int IDWorkOrder { get; set; }

    public virtual WorkOrder IDNavigation { get; set; } = null!;
}
