using HelloDoc.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using Microsoft.EntityFrameworkCore;
using DAL.DataContext;
using DAL.DataModels;
using System.Drawing;
using System.Security.Principal;

namespace HelloDoc.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ApplicationDbContext _context;

        public object AspNetUsers { get; private set; }

        public HomeController(ApplicationDbContext context)
        {
            _context = context;
        }


        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }
        public IActionResult  Patient_submit_request()

        {
            return View();
        }  
        public IActionResult  Patient_site()

        {
            return View();
        }
          public IActionResult  Patient_login()

        {
            return View();
        }
          public IActionResult  Patient_ResetPassword()

        {
            return View();
        } 
        public IActionResult  Patient_Request()

        {
            return View();
        } public IActionResult  Family_Friend_Request()

        {
            return View();
        } public IActionResult  Concierge_Request()

        {
            return View();
        } 
        public IActionResult  Business_Request()

        {
            return View();
        } 
        public IActionResult  Create_Patient()

        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Patient_login(AspNetUser user)
        {

            var Email = _context.AspNetUsers.FirstOrDefault(m => m.Email == user.Email);
            var pwd = _context.AspNetUsers.FirstOrDefault(m => m.PasswordHash == user.PasswordHash);

            if (Email == null)
            {
                return NotFound();
            }
            else
            {
                if (Email.PasswordHash == user.PasswordHash)
                {
                    return RedirectToAction(nameof(Privacy));

                }
                else
                {
                    return NotFound();
                }
            }

        }

        


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
