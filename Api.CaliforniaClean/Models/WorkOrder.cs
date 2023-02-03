using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;

namespace Api.CaliforniaEF;

[DisplayName ( "Work Order Object" )]
[Description ( "Work Order Data" )]
public partial class WorkOrder
{
    [JsonProperty ( "id" )]
    public int ID { get; set; }

    [JsonProperty ( "clave" )]
    public int Clave { get; set; }

    [JsonProperty ( "id_project" )]
    public int IDProject { get; set; }

    [JsonProperty ( "id_customer" )]
    public int IDCustomer { get; set; }

    [JsonProperty ( "contact" )]
    public string? Contact { get; set; }

    [JsonProperty ( "address" )]
    public string? Address { get; set; }

    [JsonProperty ( "city" )]
    public string? City { get; set; }

    [JsonProperty ( "phone" )]
    public string? Phone { get; set; }

    [JsonProperty ( "id_assigned" )]
    public int IDAssigned { get; set; }

    [JsonProperty ( "id_provider" )]
    public int IDProvider { get; set; }

    [JsonProperty ( "description" )]
    public string? Description { get; set; }

    [JsonProperty ( "date_order" )]
    public DateTime DateOrder { get; set; }

    [JsonProperty ( "date_end" )]
    public DateTime DateEnd { get; set; }

    [JsonProperty ( "id_type" )]
    public int IDType { get; set; }

    [JsonProperty ( "id_status_wo" )]
    public int IDStatusWO { get; set; }

    [JsonProperty ( "id_status_calendario" )]
    public int IDStatusCalendario { get; set; }

    [JsonProperty ( "id_status" )]
    public int IDStatus { get; set; }

    [JsonIgnore]
    public virtual ICollection<ChangeOrder> ChangeOrders { get; } = new List<ChangeOrder>();

    [JsonIgnore]
    public virtual CommentsWO? CommentsWO { get; set; }

    [JsonIgnore]
    public virtual ICollection<Document> Documents { get; } = new List<Document>();

    [JsonIgnore]
    public virtual Worker IDAssignedNavigation { get; set; } = null!;

    [JsonIgnore]
    public virtual Customer IDCustomerNavigation { get; set; } = null!;

    [JsonIgnore]
    public virtual Project IDProjectNavigation { get; set; } = null!;

    [JsonIgnore]
    public virtual Provider IDProviderNavigation { get; set; } = null!;

    [JsonIgnore]
    public virtual StatusDate IDStatusCalendarioNavigation { get; set; } = null!;

    [JsonIgnore]
    public virtual StatusWorkOrder IDStatusNavigation { get; set; } = null!;

    [JsonIgnore]
    public virtual TypesOrderWork IDTypeNavigation { get; set; } = null!;

    [JsonIgnore]
    public virtual ICollection<PrintOrdenWork> PrintOrdenWorks { get; } = new List<PrintOrdenWork>();

    [JsonIgnore]
    public virtual ICollection<WorkOrdersOvertime> WorkOrdersOvertimes { get; } = new List<WorkOrdersOvertime>();
}
