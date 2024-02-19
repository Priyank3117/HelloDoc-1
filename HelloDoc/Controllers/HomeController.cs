using HelloDoc.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using Microsoft.EntityFrameworkCore;
using DAL.DataContext;
using DAL.DataModels;
using System.Drawing;
using System.Security.Principal;
using DAL.ViewModels;
using Microsoft.EntityFrameworkCore.Query.SqlExpressions;

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
          
        public IActionResult  Create_Patient()

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
