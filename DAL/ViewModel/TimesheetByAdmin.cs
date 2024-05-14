using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.ViewModel
{
    public class TimesheetByAdmin
    {
        public bool isFinalize {  get; set; }

        public bool isApproved { get; set; }

        public string startdate { get; set; }

        public string enddate { get; set; }


    }
}
