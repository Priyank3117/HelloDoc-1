using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.ViewModel
{
    public class Patient_ResetPassword
    {
        [Required]
        public string Email { get; set; }

      
        [DataType(DataType.Password)]
        [RegularExpression(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$",
        ErrorMessage = "Password must contain at least one uppercase letter, one lowercase letter, one digit, one special character, and be at least 8 characters long.")]
        public string? Password { get; set; }

        [Compare("Password")]
        public string? ConfirmPassword {get; set;}

        public string? token { get; set; }
    }
}
