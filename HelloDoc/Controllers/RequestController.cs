using BAL.Interface;
using BAL.Repository;
using DAL.DataContext;
using DAL.DataModels;
using DAL.ViewModel;
using DAL.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace HelloDoc.Controllers
{
    public class RequestController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IPatient_Request _request;
        private readonly IFamily_Request _other_Request;
        private readonly IConcierge_Request _concierge;


        public RequestController(ApplicationDbContext context,IPatient_Request patient_Request,IFamily_Request other_Req,
            IConcierge_Request concierge)
        {
            _context = context;
            _request = patient_Request;
            _other_Request = other_Req;
            _concierge = concierge; 
        }


        public IActionResult Patient_Request()

        {
            return View();
        }

        //verify email
        [HttpPost]
        public IActionResult CheckEmail(string email)
        {
            var user = _context.Users.FirstOrDefault(u => u.Email == email);
            return Json(new { exists = user != null });
        }

        [HttpPost]
        public IActionResult Patient_Request(Patient patient)
        {
             _request.AddPatient(patient);

             return View();
        }
        public IActionResult Family_Friend_Request()

        {
            return View();
        }

        [HttpPost]
        public IActionResult Family_Friend_Request(Other_Request other_Reqs)

        {
            _other_Request.AddData(other_Reqs);
            return View();
        }

        public IActionResult Concierge_Request()

        {
            return View();
        }
        [HttpPost]
        public IActionResult Concierge_Request(Other_Request other_Reqs)

        {
            _concierge.AddData(other_Reqs);
            return View();
        }
    }
}
