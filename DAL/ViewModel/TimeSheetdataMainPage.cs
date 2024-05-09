using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.ViewModel
{
    public class TimeSheetdataMainPage
    {

        public DateOnly shiftDate {  get; set; }
        public int shift { get; set; }
        public int NightShiftWeekend { get; set; }
        public int HouseCall { get; set; }
        public int HouseCallNightWeekend { get; set;}
        public int PhoneConsultant { get; set; }
        public int PhoneConsultantNightWeekend { get; set; }    
        public int BatchTesting {  get; set; }

    }
}
