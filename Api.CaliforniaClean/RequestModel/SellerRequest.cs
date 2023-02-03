using Api.CaliforniaEF;
using Newtonsoft.Json;
using System.ComponentModel;

namespace Api.CaliforniaClean.RequestModel;

[DisplayName ( "Seller Object" )]
[Description ( "Seller Data" )]
public class SellerRequest
{
    [JsonProperty ( "id" )]
    public int ID { get; set; }

    [JsonProperty ( "name" )]
    public string Name { get; set; } = null!;

    [JsonProperty ( "email" )]
    public string Email { get; set; } = null!;

    [JsonProperty ( "phone" )]
    public string Phone { get; set; } = null!;

    [JsonProperty ( "status" )]
    public byte Status { get; set; }

}
