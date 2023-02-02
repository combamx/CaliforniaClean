using System;
using System.Collections.Generic;

namespace Api.CaliforniaEF;

public partial class Document
{
    public int ID { get; set; }

    public string Name { get; set; } = null!;

    public string Description { get; set; } = null!;

    public string Url { get; set; } = null!;

    public int IDCustomer { get; set; }

    public int IDProvide { get; set; }

    public int IDProject { get; set; }

    public int IDWorkOrder { get; set; }

    public int IDChangeOrden { get; set; }

    public string Expiration { get; set; } = null!;

    public int Type { get; set; }

    public int Status { get; set; }

    public virtual ChangeOrder IDChangeOrdenNavigation { get; set; } = null!;

    public virtual Project IDProjectNavigation { get; set; } = null!;

    public virtual WorkOrder IDWorkOrderNavigation { get; set; } = null!;

    public virtual TypeDocumentProject TypeNavigation { get; set; } = null!;
}
