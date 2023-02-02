using System;
using System.Collections.Generic;

namespace Api.CaliforniaEF;

public partial class TypeDocumentProject
{
    public int ID { get; set; }

    public string Description { get; set; } = null!;

    public int IDTypeProject { get; set; }

    public virtual ICollection<Document> Documents { get; } = new List<Document>();
}
