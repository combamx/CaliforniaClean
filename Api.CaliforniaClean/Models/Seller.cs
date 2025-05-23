using System.ComponentModel.DataAnnotations;

namespace Api.CaliforniaEF;

public partial class Seller
{
    public int ID { get; set; }

    [Required]
    [StringLength ( 50 )]
    public string Name { get; set; }

    [Required]
    [EmailAddress]
    [StringLength ( 50 )]
    public string Email { get; set; }

    [Required]
    [Phone]
    [StringLength ( 50 )]
    public string Phone { get; set; }

    [Required]
    public byte Status { get; set; }

    public virtual ICollection<Worker> Workers { get; } = new List<Worker> ( );
}
