using Api.CaliforniaEF;
using Newtonsoft.Json;
using System.ComponentModel;

namespace Api.CaliforniaClean.RequestModel;
[DisplayName ( "Types Order Work Object" )]
[Description ( "Types Order Work Data" )]

public class TypesOrderWorkRequest
{
    [JsonProperty ( "id" )]
    public int ID { get; set; }

    [JsonProperty ( "description" )]
    public string Description { get; set; } = null!;

}
