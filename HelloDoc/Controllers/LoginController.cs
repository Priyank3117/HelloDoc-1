using DAL.DataContext;
using DAL.ViewModel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HelloDoc.Controllers
{
   
    public class LoginController : Controller
    {
        private readonly ApplicationDbContext _context;
        public LoginController(ApplicationDbContext context)
        {
            _context = context;
        }
        public IActionResult Patient_login()

        {
            return View();
        }

        public IActionResult Patient_ResetPassword()

        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Patient_login(Patient_login patient)
        {
           
            var Email = _context.AspNetUsers.FirstOrDefault(m => m.Email == patient.Email);
            var pwd = _context.AspNetUsers.FirstOrDefault(m => m.PasswordHash == patient.PasswordHash);



            if (ModelState.IsValid)
            {

                if (Email != null && Email.PasswordHash == patient.PasswordHash )
                {
                    HttpContext.Session.SetString("Email",patient.Email);
                    return RedirectToAction("index", "Dashboard", new {email = patient.Email});

                } 
            }
            return View();
        }
    }

    
}
