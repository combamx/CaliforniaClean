using System.ComponentModel.DataAnnotations;

namespace Api.CaliforniaEF;

public partial class WorkOrdersOvertime
{
    public int ID { get; set; }

    [Required]
    [DataType ( DataType.Date )]
    public DateTime DateOrder { get; set; }

    [Required]
    public TimeSpan BeginTime { get; set; }

    [Required]
    public TimeSpan EndTime { get; set; }

    [Required]
    public byte People { get; set; }

    [Required]
    public byte TotalHrsPeople { get; set; }

    [Required]
    public byte TotalHrsGroup { get; set; }

    [Required]
    public byte AmountHrs { get; set; }

    [Required]
    public int IDProject { get; set; }

    [Required]
    public int IDWorkOder { get; set; }

    public virtual Project IDProjectNavigation { get; set; } = null!;

    public virtual WorkOrder IDWorkOderNavigation { get; set; } = null!;
}
