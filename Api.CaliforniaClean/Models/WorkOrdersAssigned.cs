using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;

namespace Api.CaliforniaEF;

[DisplayName ( "Work Orders Assigned Object" )]
[Description ( "Work Orders Assigned Data" )]
public partial class WorkOrdersAssigned
{
    [JsonProperty ( "id" )]
    public int ID { get; set; }

    [JsonProperty ( "clave" )]
    public int Clave { get; set; }

    [JsonProperty ( "date_assigned" )]
    public DateTime DateAssigned { get; set; }

    [JsonProperty ( "id_worker" )]
    public int IDWorker { get; set; }

    [JsonProperty ( "id_proveedor" )]
    public int IDProveedor { get; set; }

    [JsonProperty ( "id_order" )]
    public int Order { get; set; }

    [JsonProperty ( "id_status" )]
    public int Status { get; set; }

    [JsonProperty ( "document" )]
    public string Document { get; set; } = null!;

    [JsonProperty ( "description" )]
    public string Description { get; set; } = null!;

    [JsonIgnore]
    public virtual Provider IDProveedorNavigation { get; set; } = null!;

    [JsonIgnore]
    public virtual Worker IDWorkerNavigation { get; set; } = null!;
}
