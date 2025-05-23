using System.ComponentModel.DataAnnotations;

namespace Api.CaliforniaClean.RequestModel
{
    public class UserLogin
    {
        [Required]
        public string Username { get; set; }

        [Required]
        public string Password { get; set; }
    }
}
