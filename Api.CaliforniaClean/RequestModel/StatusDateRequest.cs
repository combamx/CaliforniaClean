using Api.CaliforniaEF;
using Newtonsoft.Json;
using System.ComponentModel;

namespace Api.CaliforniaClean.RequestModel;

[DisplayName ( "Status Date Object" )]
[Description ( "Status Date Data" )]
public class StatusDateRequest
{
    [JsonProperty ( "id" )]
    public int ID { get; set; }

    [JsonProperty ( "description" )]
    public string Description { get; set; } = null!;

    [JsonProperty ( "text_color" )]
    public string TextColor { get; set; } = null!;

    [JsonProperty ( "back_color" )]
    public string BackColor { get; set; } = null!;

}

