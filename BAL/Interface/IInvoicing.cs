using DAL.DataModels;
using DAL.ViewModel;
using DAL.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL.Interface
{
    public interface IInvoicing
    {
        public void AddNewSheet(DateOnly date, string physicianId);
        public List<TimeSheetForm> getTimesheetdetails(string physicianId, string date);
        public bool isTimeSheetExist(DateOnly startdate);
        public TimesheetDetail GetTimeSheetDetailOccurance(int? physicianId, DateOnly date);

        public TimeSheetMainModel getTimesheetTableData(string date, int? physicianId);

        public void Finalize(int id);
    }
}
