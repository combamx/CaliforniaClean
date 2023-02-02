using Newtonsoft.Json;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Api.CaliforniaEF;

//[DisplayName ( "Building Object" )]
//[Description ( "Building Data" )]
public partial class Building
{
    //[JsonProperty ( "id" )]
    public int ID { get; set; }

    //[Required]
    //[MaxLength ( 50 )]
    //[JsonProperty ( "description" )]
    public string Description { get; set; } = null!;

    //[JsonProperty ( "id_type_project" )]
    public byte IDTypeProject { get; set; }

    //[JsonProperty ( "order" )]
    public byte Order { get; set; }

    public virtual ICollection<Project> Projects { get; } = new List<Project>();
}
