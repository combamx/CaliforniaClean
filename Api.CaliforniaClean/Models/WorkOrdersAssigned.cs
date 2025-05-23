using System.ComponentModel.DataAnnotations;

namespace Api.CaliforniaEF;

public partial class WorkOrdersAssigned
{
    public int ID { get; set; }

    [Required]
    public int Clave { get; set; }

    [Required]
    [DataType ( DataType.Date )]
    public DateTime DateAssigned { get; set; }

    [Required]
    public int IDWorker { get; set; }

    [Required]
    public int IDProveedor { get; set; }

    [Required]
    public int Order { get; set; }

    [Required]
    public int Status { get; set; }

    [Required]
    [StringLength ( 50 )]
    public string Document { get; set; }

    [Required]
    [StringLength ( 50 )]
    public string Description { get; set; }

    public virtual Provider IDProveedorNavigation { get; set; } = null!;

    public virtual Worker IDWorkerNavigation { get; set; } = null!;
}
