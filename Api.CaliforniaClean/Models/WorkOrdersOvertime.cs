using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;

namespace Api.CaliforniaEF;

[DisplayName ( "Work Orders Overtime Object" )]
[Description ( "Work Orders Overtime Data" )]
public partial class WorkOrdersOvertime
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

    [JsonIgnore]
    public virtual Project IDProjectNavigation { get; set; } = null!;

    [JsonIgnore]
    public virtual WorkOrder IDWorkOderNavigation { get; set; } = null!;
}
