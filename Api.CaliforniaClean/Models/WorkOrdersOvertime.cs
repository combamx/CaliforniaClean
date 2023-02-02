using System;
using System.Collections.Generic;

namespace Api.CaliforniaEF;

public partial class WorkOrdersOvertime
{
    public int ID { get; set; }

    public DateTime DateOrder { get; set; }

    public TimeSpan BeginTime { get; set; }

    public TimeSpan EndTime { get; set; }

    public byte People { get; set; }

    public byte TotalHrsPeople { get; set; }

    public byte TotalHrsGroup { get; set; }

    public byte AmountHrs { get; set; }

    public int IDProject { get; set; }

    public int IDWorkOder { get; set; }

    public virtual Project IDProjectNavigation { get; set; } = null!;

    public virtual WorkOrder IDWorkOderNavigation { get; set; } = null!;
}
