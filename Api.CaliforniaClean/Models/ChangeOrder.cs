namespace Api.CaliforniaEF;
public partial class ChangeOrder
{
    public int ID { get; set; }

    public int Clave { get; set; }

    public DateTime DateChange { get; set; }

    public decimal Amount { get; set; }

    public int IDStatusCO { get; set; }

    public int IDWorkOrder { get; set; }

    public int IDProject { get; set; }

    public string? Description { get; set; }

    public string User { get; set; } = null!;

    public bool Status { get; set; }

    public virtual ICollection<Document> Documents { get; } = new List<Document>();

    public virtual Project IDProjectNavigation { get; set; } = null!;

    public virtual WorkOrder IDWorkOrderNavigation { get; set; } = null!;
}
