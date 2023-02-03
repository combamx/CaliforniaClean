using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Api.CaliforniaEF;

[DisplayName ( "Project Object" )]
[Description ( "Project Data" )]
public partial class Project
{
    [JsonProperty ( "id" )]
    public int ID { get; set; }

    [MaxLength ( 100 )]
    [JsonProperty ( "project_name" )]
    public string ProjectName { get; set; } = null!;

    [MaxLength ( 50 )]
    [JsonProperty ( "address" )]
    public string Address { get; set; } = null!;

    [MaxLength ( 50 )]
    [JsonProperty ( "city" )]
    public string? City { get; set; }

    [MaxLength ( 100 )]
    [JsonProperty ( "description" )]
    public string? Description { get; set; }

    [JsonProperty ( "date_project" )]
    public DateTime? DateProject { get; set; }

    [JsonProperty ( "amount" )]
    public decimal? Amount { get; set; }

    [JsonProperty ( "retentions_project" )]
    public byte? RetentionsProject { get; set; }

    [JsonProperty ( "retentions" )]
    public byte? Retentions { get; set; }

    [JsonProperty ( "seller" )]
    public byte? SellerProject { get; set; }

    [JsonProperty ( "amount_seller" )]
    public decimal? Selle { get; set; }

    [JsonProperty ( "id_customer" )]
    public int IDCustomer { get; set; }

    [JsonProperty ( "id_seller" )]
    public int? IDSeller { get; set; }

    [JsonProperty ( "id_provide" )]
    public int? IDProvide { get; set; }

    [JsonProperty ( "id_typo_project" )]
    public int? IDTypeProject { get; set; }

    [JsonProperty ( "id_type_building" )]
    public int? IDTypeBuilding { get; set; }

    [JsonProperty ( "amount_provide" )]
    public decimal? AmountProvide { get; set; }

    [JsonProperty ( "inclusion" )]
    public string? Inclusion { get; set; }

    [JsonProperty ( "ocip" )]
    public string OCIP { get; set; } = null!;

    [JsonProperty ( "status" )]
    public int Status { get; set; }

    public virtual ICollection<ChangeOrder> ChangeOrders { get; } = new List<ChangeOrder>();

    public virtual ICollection<Document> Documents { get; } = new List<Document>();

    public virtual Customer IDCustomerNavigation { get; set; } = null!;

    public virtual Provider? IDProvideNavigation { get; set; }

    public virtual Building? IDTypeBuildingNavigation { get; set; }

    public virtual TypesProject? IDTypeProjectNavigation { get; set; }

    public virtual StatusProject StatusNavigation { get; set; } = null!;

    public virtual ICollection<WorkOrder> WorkOrders { get; } = new List<WorkOrder>();

    public virtual ICollection<WorkOrdersOvertime> WorkOrdersOvertimes { get; } = new List<WorkOrdersOvertime>();
}
