using Newtonsoft.Json;
using System.ComponentModel;

namespace Api.CaliforniaClean.RequestModel;

[DisplayName ( "Work Orders Overtime Object" )]
[Description ( "Work Orders Overtime Data" )]
public class WorkOrdersOvertimeRequest
{
    [JsonProperty ( "id" )]
    public int ID { get; set; }

    [JsonProperty ( "date_order" )]
    public DateTime DateOrder { get; set; }

    [JsonProperty ( "begin_time" )]
    public TimeSpan BeginTime { get; set; }

    [JsonProperty ( "end_time" )]
    public TimeSpan EndTime { get; set; }

    [JsonProperty ( "people" )]
    public byte People { get; set; }

    [JsonProperty ( "total_hrs_people" )]
    public byte TotalHrsPeople { get; set; }

    [JsonProperty ( "total_hrs_group" )]
    public byte TotalHrsGroup { get; set; }

    [JsonProperty ( "amount_hrs" )]
    public byte AmountHrs { get; set; }

    [JsonProperty ( "id_project" )]
    public int IDProject { get; set; }

    [JsonProperty ( "id_work_order" )]
    public int IDWorkOder { get; set; }
}

