
using System.ComponentModel.DataAnnotations;

namespace BoardWebApp.Models
{
    public class CreateRole
    {
        [Required]
        public string RoleName { get; set; }
   

    }
}
