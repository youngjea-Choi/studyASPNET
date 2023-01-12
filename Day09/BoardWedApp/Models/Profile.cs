using System.ComponentModel.DataAnnotations;

namespace BoardWebApp.Models
{
    public class Profile
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public string Division { get; set; }

        [Required]
        public string Title { get; set; }

        [Required]
        public string Description { get; set; }

        public string? Url { get; set; }

        //저장될 파일명

        [FileExtensions(Extensions = ".jpg, .png, .jpeg", ErrorMessage = "이미지 파일을 선택하세요.")]
        public string? FileName { get; set; }
    }

    public class TempProfile
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public string Division { get; set; }

        [Required]
        public string Title { get; set; }

        [Required]
        public string Description { get; set; }

    
        public string? Url { get; set; }

        [Display(Name = "이미지 파일")]
        public IFormFile? ProfileImage { get; set; }

        public string? FileName { get; set; }
    }
}