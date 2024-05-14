using DAL.DataModels;

namespace DAL.ViewModel
{
    public class TimeSheetMainModel
    {

        public List<TimeSheetdataMainPage> timeSheetdataMainPage {  get; set; }

        public List<TimeSheetReimbursement> timeSheetReimbursements { get; set; }

        public string startdate {  get; set; }

        public string enddate { get; set; } 

        public bool isFinalize {get;set;}

        public bool isApproved {  get; set; }
    }
}
