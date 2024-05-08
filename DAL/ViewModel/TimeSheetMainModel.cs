namespace DAL.ViewModel
{
    public class TimeSheetMainModel
    {

        public List<TimeSheetdataMainPage> timeSheetdataMainPage { get; set; }

        public List<TimeSheetReimbursement> timeSheetReimbursements { get; set; }

        public bool isFinalize {  get; set; }
    }
}
