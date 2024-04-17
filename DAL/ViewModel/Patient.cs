using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using DAL.DataModels;

namespace DAL.ViewModels
{
    public class Patient
    {

        // For ASPNETUSER

        [Key]
        [StringLength(128)]
        public string? Id { get; set; }

        [Column(TypeName = "character varying")]
        [Required]
        public string? PasswordHash { get; set; }
        [Column(TypeName = "character varying")]


        [Required]
        [Compare("PasswordHash")]
        public string? Confirmpassword { get; set; }

        [Required]
        [StringLength(256)]
        [DataType(DataType.EmailAddress, ErrorMessage = "Enter email in correct format (mailto:example@email.com)")]
        public string Email { get; set; } = null!;

        public List<Region>? regions { get; set; }

        [Column(TypeName = "character varying")]
        [RegularExpression(@"^(?:(\+?91|0)?[ ]?([\-\s]?[6-9]\d{9})|(\+?91|0)?[ ]?(\d{5})[ ]?(\d{5}))$", ErrorMessage = "Enter a valid Phone number")]
        public string? PhoneNumber { get; set; }

        [Column(TypeName = "timestamp without time zone")]
        public DateTime? CreatedDate { get; set; }

        [Column(TypeName = "timestamp without time zone")]
        public DateTime? BirthDate { get; set; }

        [Required]
        [StringLength(100)]
        public string FirstName { get; set; } = null!;

        [Required]
        [StringLength(100)]
        public string LastName { get; set; }

        [StringLength(100)]
        public string? Street { get; set; }

        [StringLength(100)]
        public string? City { get; set; }

        [StringLength(100)]
        public string? State { get; set; }

        [RegularExpression(@"^\d{5}$", ErrorMessage = "Zip code must be 5 digits")]
        public string? ZipCode { get; set; }

        public int? Typeid { get; set; }

        public IFormFile? Filedata { get; set; }

        public List<Region>? Region { get; set; }   

        public string? AdminNote { get; set; }
    }
}
