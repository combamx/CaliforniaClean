using Newtonsoft.Json;
using System.ComponentModel;

namespace Api.CaliforniaClean.RequestModel;

[DisplayName ( "Status Project Object" )]
[Description ( "Status Project Data" )]
public class StatusProjectRequest
{
    [JsonProperty ( "id" )]
    public int ID { get; set; }

    [JsonProperty ( "description" )]
    public string Description { get; set; } = null!;

}
