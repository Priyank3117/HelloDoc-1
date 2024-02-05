using HelloDoc.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace HelloDoc.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
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
        } public IActionResult  Business_Request()

        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
