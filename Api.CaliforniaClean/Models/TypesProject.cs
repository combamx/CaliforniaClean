using System.ComponentModel.DataAnnotations;

namespace Api.CaliforniaEF;

public partial class TypesProject
{
    public int ID { get; set; }

    [Required]
    [StringLength ( 50 )]
    public string Description { get; set; }

    public virtual ICollection<Project> Projects { get; } = new List<Project> ( );
}
