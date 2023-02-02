using System;
using System.Collections.Generic;

namespace Api.CaliforniaEF;

public partial class Worker
{
    public int ID { get; set; }

    public string Name { get; set; } = null!;

    public string? Address { get; set; }

    public string? Phone { get; set; }

    public string? Email { get; set; }

    public int Status { get; set; }

    public virtual Seller StatusNavigation { get; set; } = null!;

    public virtual ICollection<WorkOrder> WorkOrders { get; } = new List<WorkOrder>();

    public virtual ICollection<WorkOrdersAssigned> WorkOrdersAssigneds { get; } = new List<WorkOrdersAssigned>();
}
