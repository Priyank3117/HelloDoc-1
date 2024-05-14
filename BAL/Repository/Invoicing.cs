using BAL.Interface;
using DAL.DataContext;
using DAL.DataModels;
using DAL.ViewModel;
using DAL.ViewModels;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using static System.Runtime.InteropServices.JavaScript.JSType;

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
                              timeSheetId = timesheet.TimesheetId,
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

        public TimeSheetMainModel getTimesheetTableData(string date, int? physicianId)
        {
            var table = new TimeSheetMainModel();

            table.isFinalize =(bool) _context.Timesheets.FirstOrDefault(i => i.PhysicianId == physicianId && i.StartDate == DateOnly.Parse(date)).IsFinalize;

            table.timeSheetdataMainPage = (from timesheetdetails in _context.TimesheetDetails
                                join timesheet in _context.Timesheets
                                on timesheetdetails.TimesheetId equals timesheet.TimesheetId into timesheetjoin
                                from timesheetTotal in timesheetjoin.DefaultIfEmpty()
                                where timesheetTotal.PhysicianId == physicianId && timesheetTotal.StartDate == DateOnly.Parse(date)
                                select new TimeSheetdataMainPage()
                                {
                                    shiftDate = timesheetdetails.TimesheetDate,
                                    shift = _context.ShiftDetails.Where(u => DateOnly.FromDateTime(u.ShiftDate) == timesheetdetails.TimesheetDate && u.Shift.PhysicianId == physicianId && u.IsDeleted != new System.Collections.BitArray(new[] { true })).Count(),
                                    NightShiftWeekend = 0,
                                    HouseCallNightWeekend = 0,
                                    PhoneConsultant = 0,
                                    HouseCall = 0,
                                    PhoneConsultantNightWeekend = 0,
                                    BatchTesting = 0,

                                }).Distinct().ToList();
            return table;
        }

        public TimeSheetMainModel getReimbursementTableData(DateOnly startdateonly,DateOnly enddateonly)
        {
            var table = new TimeSheetMainModel();

            table.startdate = startdateonly.ToString("MMM dd, yyyy");
            table.enddate = enddateonly.ToString("MMM dd, yyyy");

            table.timeSheetReimbursements =(from timesheetdetails in _context.TimesheetDetails 
                                            join timesheetDetailReimbursement in _context.TimesheetDetailReimbursements
                                            on timesheetdetails.TimesheetDetailId equals timesheetDetailReimbursement.TimesheetDetailId
                                            where timesheetDetailReimbursement.IsDeleted == false && timesheetdetails.TimesheetDate >= startdateonly && timesheetdetails.TimesheetDate < enddateonly
                                            select new TimeSheetReimbursement()
                                            {
                                                day = timesheetdetails.TimesheetDate.Day,
                                                date = timesheetdetails.TimesheetDate.ToString("MMM dd, yyyy"),
                                                item = timesheetDetailReimbursement.ItemName,
                                                Bill = timesheetDetailReimbursement.Bill,
                                                Amount = timesheetDetailReimbursement.Amount
                                            }).ToList();

            return table;
        }

        public void Finalize(int id)
        {
            var isFinalize = _context.Timesheets.FirstOrDefault(i => i.TimesheetId == id);

            if (isFinalize != null)
            {
                isFinalize.IsFinalize = true;
                _context.Timesheets.Update(isFinalize);
                _context.SaveChanges();
            }

        }

        
    }
}