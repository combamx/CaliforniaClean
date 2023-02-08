namespace Api.CaliforniaEF;

public partial class Building
{
    public int ID { get; set; }

    public string Description { get; set; } = null!;

    public byte IDTypeProject { get; set; }

    public byte Order { get; set; }

    public virtual ICollection<Project> Projects { get; } = new List<Project>();
}
