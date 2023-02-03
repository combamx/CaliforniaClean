using Api.CaliforniaEF;
using Newtonsoft.Json;
using System.ComponentModel;

namespace Api.CaliforniaClean.RequestModel;

[DisplayName ( "Print Orden Work Object" )]
[Description ( "Print Orden Work Data" )]
public class PrintOrdenWorkRequest
{
    [JsonProperty ( "id" )]
    public int ID { get; set; }

    [JsonProperty ( "id_work_order" )]
    public int IDWorkOrder { get; set; }

    [JsonProperty ( "compania" )]
    public string Compania { get; set; } = null!;

    [JsonProperty ( "project" )]
    public string Project { get; set; } = null!;

    [JsonProperty ( "date_print" )]
    public DateTime DatePrint { get; set; }

    [JsonProperty ( "hour" )]
    public string Hour { get; set; } = null!;

    [JsonProperty ( "contact" )]
    public string Contact { get; set; } = null!;

    [JsonProperty ( "phone" )]
    public string Phone { get; set; } = null!;

    [JsonProperty ( "address" )]
    public string Address { get; set; } = null!;

    [JsonProperty ( "city" )]
    public string City { get; set; } = null!;

    [JsonProperty ( "assigned" )]
    public string Assigned { get; set; } = null!;

    [JsonProperty ( "description" )]
    public string? Description { get; set; }

    [JsonProperty ( "change" )]
    public string? Change { get; set; }

}

