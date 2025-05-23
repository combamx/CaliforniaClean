using System.ComponentModel.DataAnnotations;

namespace Api.CaliforniaEF;

public partial class TypeDocumentProject
{
    public int ID { get; set; }

    [Required]
    [StringLength ( 50 )]
    public string Description { get; set; }

    [Required]
    public int IDTypeProject { get; set; }

    public virtual ICollection<Document> Documents { get; } = new List<Document> ( );
}
