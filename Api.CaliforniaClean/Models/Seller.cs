using System;
using System.Collections.Generic;

namespace Api.CaliforniaEF;

public partial class Seller
{
    public int ID { get; set; }

    public string Name { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string Phone { get; set; } = null!;

    public byte Status { get; set; }

    public virtual ICollection<Worker> Workers { get; } = new List<Worker>();
}
