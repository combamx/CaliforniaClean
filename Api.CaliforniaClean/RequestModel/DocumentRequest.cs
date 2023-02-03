using Api.CaliforniaEF;
using Newtonsoft.Json;
using System.ComponentModel;

namespace Api.CaliforniaClean.RequestModel;

[DisplayName ( "Document Object" )]
[Description ( "Document Data" )]
public class DocumentRequest
{
    [JsonProperty ( "id" )]
    public int ID { get; set; }

    [JsonProperty ( "name" )]
    public string Name { get; set; } = null!;

    [JsonProperty ( "description" )]
    public string Description { get; set; } = null!;

    [JsonProperty ( "url" )]
    public string Url { get; set; } = null!;

    [JsonProperty ( "id_customer" )]
    public int IDCustomer { get; set; }

    [JsonProperty ( "id_provide" )]
    public int IDProvide { get; set; }

    [JsonProperty ( "id_project" )]
    public int IDProject { get; set; }

    [JsonProperty ( "id_work_order" )]
    public int IDWorkOrder { get; set; }

    [JsonProperty ( "id_change_orden" )]
    public int IDChangeOrden { get; set; }

    [JsonProperty ( "expiration" )]
    public string Expiration { get; set; } = null!;

    [JsonProperty ( "type" )]
    public int Type { get; set; }

    [JsonProperty ( "status" )]
    public int Status { get; set; }

}

