using BAL.Interface;
using DAL.DataContext;
using DAL.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using IHostingEnvironment = Microsoft.AspNetCore.Hosting.IHostingEnvironment;

namespace HelloDoc.Controllers
{
    


    public class ME_ForSomeOneController : Controller
    {

        private readonly ApplicationDbContext _context;
        private readonly IPatient_Request _request;
      



        //-----------------------Add Context---------------------------------

        public ME_ForSomeOneController(ApplicationDbContext context, IPatient_Request patient_Request)
        {
            _context = context;
            _request = patient_Request;
         
        }
        public IActionResult Me()
        {
            var email = HttpContext.Session.GetString("Email");
            var user = _context.Users.FirstOrDefault(u => u.Email == email);

            var patient = new Patient
            {
                Email=email,
                FirstName = user.FirstName, 
                LastName = user.LastName,
                PhoneNumber = user.Mobile
            };

            return View(patient);
        }

        [HttpPost]
        public IActionResult Me(Patient patient)
        {
            var email = HttpContext.Session.GetString("Email");
            var user = _context.Users.FirstOrDefault(u => u.Email == email);

            _request.AddPatient(patient);
            return View();
        } 
        
        
        
        public IActionResult SomeOne()
        {
            return View();
        }
    }
}
