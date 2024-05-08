using DAL.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.ViewModel
{
    public class TimeSheet
    {
        public DateOnly startdate { get; set; }
        public DateOnly enddate { get; set; }
        public int? physicianId { get; set; }
        public List<TimeSheetForm> timesheetdata { get; set; }



    }
}