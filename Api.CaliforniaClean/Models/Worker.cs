using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;

namespace Api.CaliforniaEF;

[DisplayName ( "Worker Object" )]
[Description ( "Worker Data" )]
public partial class Worker
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

    [JsonIgnore]
    public virtual ICollection<WorkOrder> WorkOrders { get; } = new List<WorkOrder>();

    [JsonIgnore]
    public virtual ICollection<WorkOrdersAssigned> WorkOrdersAssigneds { get; } = new List<WorkOrdersAssigned>();
}
