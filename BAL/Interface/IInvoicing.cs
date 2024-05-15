using DAL.DataModels;
using DAL.ViewModel;
using DAL.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace BAL.Interface
{
    public interface IInvoicing
    {
        public void AddNewSheet(DateOnly date, string physicianId);
        public List<TimeSheetForm> getTimesheetdetails(string physicianId, string date);
        public bool isTimeSheetExist(DateOnly startdate);
        public TimesheetDetail GetTimeSheetDetailOccurance(int? physicianId, DateOnly date);

        public TimeSheetMainModel getTimesheetTableData(string date, int? physicianId);
        public TimeSheetMainModel getReimbursementTableData(DateOnly startdateonly, DateOnly enddateonly);
        public TimeSheetMainModel GetTableData(DateOnly startdateonly, DateOnly enddateonly, string date, int? physicianId);
        public void Finalize(int id);

    }
}
