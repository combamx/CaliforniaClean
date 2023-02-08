namespace Api.CaliforniaEF;

public partial class WorkOrder
{
    public int ID { get; set; }

    public int Clave { get; set; }

    public int IDProject { get; set; }

    public int IDCustomer { get; set; }

    public string? Contact { get; set; }

    public string? Address { get; set; }

    public string? City { get; set; }

    public string? Phone { get; set; }

    public int IDAssigned { get; set; }

    public int IDProvider { get; set; }

    public string? Description { get; set; }

    public DateTime DateOrder { get; set; }

    public DateTime DateEnd { get; set; }

    public int IDType { get; set; }

    public int IDStatusWO { get; set; }

    public int IDStatusCalendario { get; set; }

    public int IDStatus { get; set; }

    public virtual ICollection<ChangeOrder> ChangeOrders { get; } = new List<ChangeOrder>();

    public virtual CommentsWO? CommentsWO { get; set; }

    public virtual ICollection<Document> Documents { get; } = new List<Document>();

    public virtual Worker IDAssignedNavigation { get; set; } = null!;

    public virtual Customer IDCustomerNavigation { get; set; } = null!;

    public virtual Project IDProjectNavigation { get; set; } = null!;

    public virtual Provider IDProviderNavigation { get; set; } = null!;

    public virtual StatusDate IDStatusCalendarioNavigation { get; set; } = null!;

    public virtual StatusWorkOrder IDStatusNavigation { get; set; } = null!;

    public virtual TypesOrderWork IDTypeNavigation { get; set; } = null!;

    public virtual ICollection<PrintOrdenWork> PrintOrdenWorks { get; } = new List<PrintOrdenWork>();

    public virtual ICollection<WorkOrdersOvertime> WorkOrdersOvertimes { get; } = new List<WorkOrdersOvertime>();
}
