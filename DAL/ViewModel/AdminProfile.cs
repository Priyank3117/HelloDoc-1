using DAL.DataModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.ViewModel
{
    public class AdminProfile
    {
        public List<Region> Regions { get; set; }

       public string? UserName { get; set; }       
        
        public int? state { get; set; }

        public string? Password {  get; set; }

        public string? FirstName {  get; set; }
        public string? LastName { get; set; }

        public string? Email {  get; set; }
        public string? ConfirmEmail { get; set; }

        public string? PhoneNumAspNetUsers { get; set; }

        public string? Address1 { get; set; }
        public string? Address2 { get; set; }

        public string City { get; set; }

        public string zip { get; set; }

        public string MobileNumAdmin {get; set;}

        public int SelectedStateId { get; set; }
    }
}
