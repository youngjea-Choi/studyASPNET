using System.ComponentModel.DataAnnotations;

namespace BasicWeb.Models
{
    public class Category
    {
        [Key] // 기본키
        public int Id { get; set; }

        [Required] // null 허용x
        public string Name { get; set; }
        public string DisplayOrder { get; set; }
        public DateTime postdate { get; set; }= DateTime.Now; 
    }
}
