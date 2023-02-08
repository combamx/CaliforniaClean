using Newtonsoft.Json;

namespace Api.CaliforniaClean.RequestModel;

public class WorkOrdersAssignedRequest
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
}

