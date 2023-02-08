using System;
using System.Collections.Generic;

namespace Api.CaliforniaEF;

public partial class TypesOrderWork
{
    public int ID { get; set; }

    public string Description { get; set; } = null!;

    public virtual ICollection<WorkOrder> WorkOrders { get; } = new List<WorkOrder>();
}
