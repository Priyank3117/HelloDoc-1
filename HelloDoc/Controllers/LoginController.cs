using DAL.DataContext;
using DAL.DataModels;
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
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Patient_login(AspNetUser user)
        {

            var Email = _context.AspNetUsers.FirstOrDefault(m => m.Email == user.Email);
            var pwd = _context.AspNetUsers.FirstOrDefault(m => m.PasswordHash == user.PasswordHash);



            if (ModelState.IsValid)
            {

                if (Email != null && Email.PasswordHash == user.PasswordHash)
                {
                    return RedirectToAction("Privacy", "Home");

                }
                else
                {
                    return NotFound();
                }

                
            }
            return View();
        }
    }

    
}
