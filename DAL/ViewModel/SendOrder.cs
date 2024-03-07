using DAL.DataModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.ViewModel
{
    public class SendOrder
    { 
        public List<HealthProfessionalType>? ProfessionName { get; set; }

        public List<string>? BusinessName { get; set; }

       public string? BusinessContact { get; set; }

        public string? Email { get; set; }

        public string? FaxNum{ get; set; }

        public List<string>? Retail { get; set;}

    }
}
