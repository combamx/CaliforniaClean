using System;
using System.Collections.Generic;

namespace Api.CaliforniaEF;

public partial class PrintOrdenWork
{
    public int ID { get; set; }

    public int IDWorkOrder { get; set; }

    public string Compania { get; set; } = null!;

    public string Project { get; set; } = null!;

    public DateTime DatePrint { get; set; }

    public string Hour { get; set; } = null!;

    public string Contact { get; set; } = null!;

    public string Phone { get; set; } = null!;

    public string Address { get; set; } = null!;

    public string City { get; set; } = null!;

    public string Assigned { get; set; } = null!;

    public string? Description { get; set; }

    public string? Change { get; set; }

    public virtual WorkOrder IDWorkOrderNavigation { get; set; } = null!;
}
