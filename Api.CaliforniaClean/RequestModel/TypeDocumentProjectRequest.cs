using Newtonsoft.Json;
using System.ComponentModel;

namespace Api.CaliforniaClean.RequestModel;

[DisplayName ( "Type Document Project Object" )]
[Description ( "Type Document Project Data" )]
public class TypeDocumentProjectRequest
{
    [JsonProperty ( "id" )]
    public int ID { get; set; }

    [JsonProperty ( "description" )]
    public string Description { get; set; } = null!;

    [JsonProperty ( "id_type_project" )]
    public int IDTypeProject { get; set; }

}
