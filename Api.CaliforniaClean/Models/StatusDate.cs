using System;
using System.Collections.Generic;

namespace Api.CaliforniaEF;

public partial class StatusDate
{
    public int ID { get; set; }

    public string Description { get; set; } = null!;

    public string TextColor { get; set; } = null!;

    public string BackColor { get; set; } = null!;

    public virtual ICollection<WorkOrder> WorkOrders { get; } = new List<WorkOrder>();
}
