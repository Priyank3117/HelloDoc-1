
using BAL.Interface;
using DAL.DataContext;
using DAL.ViewModel;
using Microsoft.AspNetCore.Mvc;

namespace HelloDoc.Controllers
{
    public class Admin_DashController : Controller
    {


        private readonly ApplicationDbContext _context;
        private readonly IAdmin_DashBoard _AdminDashboard;
      

        public Admin_DashController(ApplicationDbContext context , IAdmin_DashBoard adminDashboard)
        {
            _context = context;
            _AdminDashboard = adminDashboard;
        }
        public IActionResult Admin_Dash()
        {
             var DashData = _AdminDashboard.GetRequestData();

            var newcount = (_context.Requests.Where(item => item.Status == 1)).Count();
            var pendingcount = (_context.Requests.Where(item => item.Status == 2)).Count();
            var activecount = (_context.Requests.Where(item => item.Status == 4 || item.Status == 5)).Count();
            var conclude = (_context.Requests.Where(item => item.Status == 6)).Count();
            var toclosed = (_context.Requests.Where(item => item.Status == 3 || item.Status == 7 || item.Status == 8)).Count();
            var unpaid = (_context.Requests.Where(item => item.Status == 9)).Count();
            ViewBag.NewCount = newcount;
            ViewBag.PendingCount = pendingcount;
            ViewBag.activecount = activecount;
            ViewBag.conclude = conclude;
            ViewBag.toclosed = toclosed;
            ViewBag.unpaid = unpaid;

            return View(DashData.ToList());
        }  
       public IActionResult AdminDash(string partialName)
        {
            var DashData = _AdminDashboard.GetRequestData().ToList();

            return PartialView(partialName,DashData);

        } 
        
        
        public IActionResult SearchPatient(string SearchValue,string Filterselect,string selectvalue, string partialName)
               {

            var FilterData = _AdminDashboard.GetRequestData()
                .Where(item => (string.IsNullOrEmpty(SearchValue) || item.Name.Contains(SearchValue)) &&
                              (string.IsNullOrEmpty(Filterselect) || item.requesttypeid == int.Parse(Filterselect)) &&
                              (string.IsNullOrEmpty(selectvalue) || item.regionid == int.Parse(selectvalue))).ToList();

            return PartialView(partialName, FilterData);
       
        }

        public IActionResult ViewCase(int id)
        {
            var patientdata = _AdminDashboard.getregionwise().Where(s => s.reqclientid == id).FirstOrDefault();

            ViewCase viewCase = new ViewCase();

            viewCase.FirstName = patientdata.Name;
            viewCase.LastName = patientdata.LastName;
            viewCase.DateOfBirth = DateTime.Parse(patientdata.BirthDate);
            viewCase.Phone = patientdata.PhoneNumber_P;
            viewCase.Email = patientdata.Email;
            viewCase.Notes = patientdata.Notes;
            viewCase.region = patientdata.regionname;
            viewCase.address = patientdata.Address;

           return View(viewCase);
        }

    }
}
