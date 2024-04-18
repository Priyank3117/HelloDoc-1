using DAL.DataModels;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.ViewModel
{
    public class PhysicianProfile
    {
        public string? Username { get; set; }

		[Required]
		[DataType(DataType.Password)]
		[RegularExpression(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$",
		ErrorMessage = "Password must contain at least one uppercase letter, one lowercase letter, one digit, one special character, and be at least 8 characters long.")]
		public string? Password { get; set; }
        public string? Status { get; set; }
        public string? Role { get; set; }

        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public string? Email { get; set; }
        public string? ConfirmEmail { get; set; }
        public string? MobileNo { get; set; }

        public string? Address1 { get; set; }
        public string? Address2 { get; set; }
        public string? City { get; set; }
        public string? Street { get; set; }
        public int? State { get; set; }
        public string? ZipCode { get; set; }
        public List<Region>? Regions { get; set; }
        public List<PhysicianRegion>? WorkingRegions { get; set; }
        public int physicianid { get; set; }

        public string? MedicalLicense { get; set; }
        public string? NPINumber { get; set; }
        public string? SynchronizationEmail { get; set; }

        public string? BusinessName { get; set; }
        public string? BusinessWebsite { get; set; }
        public string? AdminNotes { get; set; }
        public IFormFile? File { get; set; }
        public string PhotoFileName { get; set; }
        public string SignatureFilename { get; set; }
        public BitArray? IsAgreement { get; set; }
        public BitArray? IsBackground { get; set; }
        public BitArray? IsHippa { get; set; }
        public BitArray? NonDiscoluser { get; set; }
        public BitArray? License { get; set; }
    }
}
