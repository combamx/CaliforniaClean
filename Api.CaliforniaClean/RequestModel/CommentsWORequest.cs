using Api.CaliforniaEF;
using Newtonsoft.Json;
using System.ComponentModel;

namespace Api.CaliforniaClean.RequestModel;

[DisplayName ( "Comments Work Order Object" )]
[Description ( "Comments Work Order Data" )]
public class CommentsWORequest
{
    [JsonProperty ( "id" )]
    public int ID { get; set; }

    [JsonProperty ( "description" )]
    public string Description { get; set; } = null!;

    [JsonProperty ( "id_work_order" )]
    public int IDWorkOrder { get; set; }
    
}

