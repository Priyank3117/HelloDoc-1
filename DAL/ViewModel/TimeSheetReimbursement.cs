using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.ViewModel
{
    public class TimeSheetReimbursement
    {

        public string date {  get; set; }
        public string item { get; set; }
        public int? day { get; set; }
        public int Amount { get; set; }

        public string Bill { get; set; }

    }
}
