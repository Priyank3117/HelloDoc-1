using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.ViewModel
{
    public class ViewNotes
    {


        public List<String>? AdminNotes { get; set; }

        public List<String>? TransferNotes { get; set; }

        public List<String>? PhysicianNotes { get; set; }

        public String? AdditionalNotes { get; set; }

        public int RequestId { get; set; }
    }
}
