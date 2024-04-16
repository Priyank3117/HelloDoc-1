using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using DAL.DataModels;

namespace DAL.ViewModel
{
    public class SendOrder
    {

        [Required]
        public List<HealthProfessionalType>? ProfessionName { get; set; }

        [Required]
        public string? Name { get; set; }
        public int? requestid { get; set; }

        public int? vendorId { get; set; }

        [Required]
        public string? BusinessContact { get; set; }


        [Required]
       
        public string Email { get; set; } 

        public string? FaxNum{ get; set; }


        public string? Disciription { get; set; }

        public List<string>? Retail { get; set;}

    }
}
