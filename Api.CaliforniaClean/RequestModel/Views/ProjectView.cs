using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace Api.CaliforniaClean.RequestModel.Views;

[DisplayName ( "Project View Object" )]
[Description ( "Project View Data" )]

public class ProjectView
{
    [JsonProperty ( "id", PropertyName = "id" )]
    [Description ( "id" )]
    public int ID { get; set; }

    [JsonProperty ( "project_name" )]
    [Description ( "project_name" )]
    public string ProjectName { get; set; } = null!;

    [JsonProperty ( "address" )]
    [Description ( "address" )]
    public string Address { get; set; } = null!;

    [JsonProperty ( "city" )]
    [Description ( "City" )]
    public string? City { get; set; }

    [JsonProperty ( "description" )]
    public string? Description { get; set; }

    [JsonProperty ( "date_project" )]
    public DateTime? DateProject { get; set; }

    [JsonProperty ( "amount" )]
    public string? Amount { get; set; }

    [JsonProperty ( "retentions_project" )]
    public float? RetentionsProject { get; set; }

    [JsonProperty ( "retentions" )]
    public string? Retentions { get; set; }

    [JsonProperty ( "percent_seller" )]
    public float? SellerProject { get; set; }

    [JsonProperty ( "amount_seller" )]
    public string? Selle { get; set; }

    [JsonProperty ( "amount_provide" )]
    public string? AmountProvide { get; set; }

    [JsonProperty ( "name_selle" )]
    public string? NameSelle { get; set; }

    [JsonProperty ( "type_project_description" )]
    public string? TypeProjectDescription { get; set; }

    [JsonProperty ( "type_building_description" )]
    public string? TypeBuildingDescription { get; set; }

    [ JsonProperty ( "inclusion" )]
    public string? Inclusion { get; set; }

    [JsonProperty ( "ocip" )]
    public string? OCIP { get; set; } = null!;

    [JsonProperty ( "status" )]
    public string? Status { get; set; }
}

