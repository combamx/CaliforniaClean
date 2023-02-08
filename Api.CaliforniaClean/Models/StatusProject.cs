namespace Api.CaliforniaEF;

public partial class StatusProject
{
    public int ID { get; set; }

    public string Description { get; set; } = null!;

    public virtual ICollection<Project> Projects { get; } = new List<Project>();
}
