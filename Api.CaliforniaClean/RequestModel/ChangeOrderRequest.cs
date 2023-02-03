using Api.CaliforniaEF;
using Newtonsoft.Json;
using System.ComponentModel;

namespace Api.CaliforniaClean.RequestModel;

[DisplayName ( "Change Order Object" )]
[Description ( "Change Order Data" )]
public class ChangeOrderRequest
{
    [JsonProperty ( "id" )]
    public int ID { get; set; }

    [JsonProperty ( "clave" )]
    public int Clave { get; set; }

    [JsonProperty ( "date_change" )]
    public DateTime DateChange { get; set; }

    [JsonProperty ( "amount" )]
    public decimal Amount { get; set; }

    [JsonProperty ( "id_status_co" )]
    public int IDStatusCO { get; set; }

    [JsonProperty ( "id_work_order" )]
    public int IDWorkOrder { get; set; }

    [JsonProperty ( "id_project" )]
    public int IDProject { get; set; }

    [JsonProperty ( "description" )]
    public string? Description { get; set; }

    [JsonProperty ( "user" )]
    public string User { get; set; } = null!;

    [JsonProperty ( "status" )]
    public bool Status { get; set; }
        
}

