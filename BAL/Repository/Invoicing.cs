using BAL.Interface;
using DAL.DataContext;
using DAL.DataModels;
using DAL.ViewModels;

namespace BAL.Repository
{
    public class Invoicing : IInvoicing
    {
        private readonly ApplicationDbContext _context;

        public Invoicing(ApplicationDbContext context)
        {
            _context = context;
        }


        public List<TimeSheetForm> getTimesheetdetails(string physicianId, string date)
        {
            var startdate = DateTime.Parse(date);
            var enddate = startdate.Date.Day == 1 ? new DateTime(startdate.Year, startdate.Month, 15) : new DateTime(startdate.Year, startdate.Month, 1).AddMonths(1).AddDays(-1);

            var result = (from timesheet in _context.Timesheets
                          join timesheetdetail in _context.TimesheetDetails
                          on timesheet.TimesheetId equals timesheetdetail.TimesheetId
                          where timesheet.StartDate == DateOnly.FromDateTime(startdate) && timesheet.PhysicianId == int.Parse(physicianId)
                          orderby timesheetdetail.TimesheetDate
                          select new TimeSheetForm()
                          {
                              date = timesheetdetail.TimesheetDate,
                              physicianId = timesheet.PhysicianId,
                              onCallhours = 0,
                              totalHours = timesheetdetail.TotalHours,
                              isWeekend = (bool)timesheetdetail.IsWeekend,
                              HouseCallNo = timesheetdetail.NumberOfHouseCall,
                              PhoneCallNo = timesheetdetail.NumberOfPhoneCall

                          }).ToList();


            return result;
        }

        public bool isTimeSheetExist(DateOnly startdate)
        {
            bool result = _context.Timesheets.Any(u => u.StartDate == startdate);
            return result;
        }

        public void AddNewSheet(DateOnly date, string physicianId)
        {
            DateOnly enddate = date.Day == 1 ? new DateOnly(date.Year, date.Month, 15) : new DateOnly(date.Year, date.Month, 1).AddMonths(1).AddDays(-1);
            var timeSheet = new Timesheet();
            timeSheet.PhysicianId = int.Parse(physicianId);
            timeSheet.StartDate = date;
            timeSheet.EndDate = enddate;
            timeSheet.CreatedDate = DateTime.Now;
            timeSheet.IsFinalize = false;
            timeSheet.IsApproved = false;
            timeSheet.CreatedBy = _context.Physicians.First(u => u.PhysicianId == int.Parse(physicianId)).AspNetUserId;
            _context.Timesheets.Add(timeSheet);
            _context.SaveChanges();

            for (int i = date.Day; i <= enddate.Day; i++)
            {
                var TimesheetDetailDate = new DateOnly(enddate.Year, enddate.Month, i);
                var timesheetdetail = new TimesheetDetail();
                timesheetdetail.TimesheetId = timeSheet.TimesheetId;
                timesheetdetail.TimesheetDate = TimesheetDetailDate;
                timesheetdetail.TotalHours = 0;
                timesheetdetail.IsWeekend = false;
                timesheetdetail.NumberOfHouseCall = 0;
                timesheetdetail.NumberOfPhoneCall = 0;
                _context.TimesheetDetails.Add(timesheetdetail);
            }
            _context.SaveChanges();
        }

        public  TimesheetDetail  GetTimeSheetDetailOccurance(int? physicianId,DateOnly date)
        {
            var timesheetdetail = _context.TimesheetDetails.FirstOrDefault(s => s.Timesheet.PhysicianId != physicianId && s.TimesheetDate == date) ;
            return timesheetdetail;
        }

    }
}