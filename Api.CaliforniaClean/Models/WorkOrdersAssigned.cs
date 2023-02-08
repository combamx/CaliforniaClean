using System;
using System.Collections.Generic;

namespace Api.CaliforniaEF;

public partial class WorkOrdersAssigned
{
    public int ID { get; set; }

    public int Clave { get; set; }

    public DateTime DateAssigned { get; set; }

    public int IDWorker { get; set; }

    public int IDProveedor { get; set; }

    public int Order { get; set; }

    public int Status { get; set; }

    public string Document { get; set; } = null!;

    public string Description { get; set; } = null!;

    public virtual Provider IDProveedorNavigation { get; set; } = null!;

    public virtual Worker IDWorkerNavigation { get; set; } = null!;
}
