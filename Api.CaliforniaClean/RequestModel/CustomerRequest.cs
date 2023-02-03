using Newtonsoft.Json;
using System.ComponentModel;

namespace Api.CaliforniaClean.RequestModel;

[DisplayName ( "Customer Object" )]
[Description ( "Customer Data" )]
public class CustomerRequest
{
    [JsonProperty ( "id" )]
    public int ID { get; set; }

    [JsonProperty ( "company_name" )]
    public string CompanyName { get; set; } = null!;

    [JsonProperty ( "address" )]
    public string? Address { get; set; }

    [JsonProperty ( "city" )]
    public string? City { get; set; }

    [JsonProperty ( "zip" )]
    public string? Zip { get; set; }

    [JsonProperty ( "phone" )]
    public string? Phone { get; set; }

    [JsonProperty ( "status" )]
    public bool Status { get; set; }

    [JsonProperty ( "email" )]
    public string? Email { get; set; }
}

