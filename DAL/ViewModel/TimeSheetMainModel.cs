using DAL.DataModels;

namespace DAL.ViewModel
{
    public class TimeSheetMainModel
    {

        public List<TimeSheetdataMainPage> timeSheetdataMainPage { get; set; }

        public List<TimesheetDetailReimbursement> timeSheetReimbursements { get; set; }

        public bool isFinalize {    get;set;}
    }
}
