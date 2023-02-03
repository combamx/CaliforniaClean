using Api.CaliforniaEF;
using Newtonsoft.Json;
using System.ComponentModel;

namespace Api.CaliforniaClean.RequestModel;

[DisplayName ( "Provider Object" )]
[Description ( "Provider Data" )]
public class ProviderRequest
{
    [JsonProperty ( "id" )]
    public int ID { get; set; }

    [JsonProperty ( "id" )]
    public string Name { get; set; } = null!;

    [JsonProperty ( "id" )]
    public string? Email { get; set; }

    [JsonProperty ( "id" )]
    public string? Address { get; set; }

    [JsonProperty ( "id" )]
    public string? City { get; set; }

    [JsonProperty ( "id" )]
    public int? Zip { get; set; }

    [JsonProperty ( "id" )]
    public string? Phone { get; set; }

    [JsonProperty ( "id" )]
    public byte Status { get; set; }

}

