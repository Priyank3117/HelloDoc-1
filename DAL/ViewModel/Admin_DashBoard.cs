using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.ViewModel
{
    public class Admin_DashBoard
    {
         [StringLength(100)]
        public string? Name { get; set; } 

        public string? BirthDate { get; set;}

        public string? Requestor { get; set; }

        public  DateTime? RequestedDate { get; set; }

        public string? PhoneNumber { get; set; }
        public string? PhoneNumber_P{ get; set; }

        public string? Address {  get; set; }

        public string? Notes { get; set; }

        public int? requesttypeid { get; set; }

        public int? regionid { get; set;}

        public int? status { get; set;}
    }
}
