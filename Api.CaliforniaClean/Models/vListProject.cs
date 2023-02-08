using System;
using System.Collections.Generic;

namespace Api.CaliforniaEF;

public partial class vListProject
{
    public int ID { get; set; }

    public string ProjectName { get; set; } = null!;

    public string Address { get; set; } = null!;

    public string? City { get; set; }

    public string? Description { get; set; }

    public DateTime? DateProject { get; set; }

    public string? Amount { get; set; }

    public double? RetentionsProject { get; set; }

    public string? Retentions { get; set; }

    public double? SellerProject { get; set; }

    public string? Selle { get; set; }

    public string CompanyName { get; set; } = null!;

    public string? NameSelle { get; set; }

    public string? TypeProjectDescription { get; set; }

    public string? TypeBuildingDescription { get; set; }

    public string? AmountProvide { get; set; }

    public string? Inclusion { get; set; }

    public string OCIP { get; set; } = null!;

    public string? Status { get; set; }
}
