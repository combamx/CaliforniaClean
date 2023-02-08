namespace Api.CaliforniaEF;

public partial class Provider
{
    public int ID { get; set; }

    public string Name { get; set; } = null!;

    public string? Email { get; set; }

    public string? Address { get; set; }

    public string? City { get; set; }

    public int? Zip { get; set; }

    public string? Phone { get; set; }

    public byte Status { get; set; }

    public virtual ICollection<Project> Projects { get; } = new List<Project>();

    public virtual ICollection<WorkOrder> WorkOrders { get; } = new List<WorkOrder>();

    public virtual ICollection<WorkOrdersAssigned> WorkOrdersAssigneds { get; } = new List<WorkOrdersAssigned>();
}
