using Api.CaliforniaEF;
using Newtonsoft.Json;
using System.ComponentModel;

namespace Api.CaliforniaClean.RequestModel;

[DisplayName ( "Worker Object" )]
[Description ( "Worker Data" )]
public class WorkerRequest
{
    [JsonProperty ( "id" )]
    public int ID { get; set; }

    [JsonProperty ( "name" )]
    public string Name { get; set; } = null!;

    [JsonProperty ( "address" )]
    public string? Address { get; set; }

    [JsonProperty ( "phone" )]
    public string? Phone { get; set; }

    [JsonProperty ( "email" )]
    public string? Email { get; set; }

    [JsonProperty ( "status" )]
    public int Status { get; set; }

    [JsonProperty ( "seller" )]
    public virtual Seller StatusNavigation { get; set; } = null!;
}

