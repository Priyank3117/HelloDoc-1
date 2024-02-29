
using BAL.Interface;
using DAL.DataContext;
using DAL.DataModels;
using DAL.ViewModel;
using Microsoft.AspNetCore.Mvc;
using static System.Runtime.InteropServices.JavaScript.JSType;

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
             var DashData = _AdminDashboard.GetList();



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
        
        
        
        public IActionResult SearchPatient(string SearchValue,string Filterselect,string selectvalue, string partialName, int[] currentstatus)
       {

            var FilterData = _AdminDashboard.GetRequestData( SearchValue,  Filterselect, selectvalue,  partialName,currentstatus).ToList();
             

            return PartialView(partialName, FilterData);    
       
        }

        public IActionResult ViewCase(int id,int status)
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
            viewCase.ConfirmationNumber = patientdata.confirmationnum;
            viewCase.status = status;

            

           return View(viewCase);
        }

        public ActionResult ViewNotes(int id)
        {

            //if admin add notes in transfer request that will added in the requeststatus log
            //tables notes it will known as the transfer notes
          var result = _AdminDashboard.GetViewNotes(id).ToList();
           return View(result);
        } 
        public ActionResult CancelCase(int Requestid,string Reason,string Notes)
        {
            var user = _context.Requests.FirstOrDefault(h => h.RequestId == Requestid);

  
            if (user != null)
            {
                user.Status = 3;
                user.CaseTag = Reason;


                RequestStatusLog requeststatuslog = new RequestStatusLog();

                requeststatuslog.RequestId = Requestid;
                requeststatuslog.Notes = Notes;
                requeststatuslog.CreatedDate = DateTime.Now;
                requeststatuslog.Status = 3;

                _context.Add(requeststatuslog);
                _context.SaveChanges();

                _context.Update(user);
                _context.SaveChanges();

                return RedirectToAction("Admin_Dash");


            }

            return Ok();
           
        }


    }
}
