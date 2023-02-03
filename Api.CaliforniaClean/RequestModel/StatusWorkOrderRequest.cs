using Api.CaliforniaEF;
using Newtonsoft.Json;
using System.ComponentModel;

namespace Api.CaliforniaClean.RequestModel;

[DisplayName ( "Status Work Order Object" )]
[Description ( "Status Work Order Data" )]
public class StatusWorkOrderRequest
{
    [JsonProperty ( "id" )]
    public int ID { get; set; }

    [JsonProperty ( "description" )]
    public string Description { get; set; } = null!;

    [JsonProperty ( "text_color" )]
    public string TextColor { get; set; } = null!;

    [JsonProperty ( "back_color" )]
    public string BackColor { get; set; } = null!;

    [JsonProperty ( "filter" )]
    public string Filter { get; set; } = null!;

    [JsonProperty ( "order" )]
    public byte Order { get; set; }

}
