namespace Api.CaliforniaEF;
public partial class Customer
{
    public int ID { get; set; }

    public string CompanyName { get; set; } = null!;

    public string? Address { get; set; }

    public string? City { get; set; }

    public string? Zip { get; set; }

    public string? Phone { get; set; }

    public bool Status { get; set; }

    public string? Email { get; set; }

    public virtual ICollection<Project> Projects { get; } = new List<Project>();

    public virtual ICollection<WorkOrder> WorkOrders { get; } = new List<WorkOrder>();
}
