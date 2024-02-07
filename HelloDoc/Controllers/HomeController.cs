using HelloDoc.DataContext;
using HelloDoc.DataModels;
using HelloDoc.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using Microsoft.EntityFrameworkCore;

using System.Security.Principal;

namespace HelloDoc.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ApplicationDbContext _context;


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

        public IActionResult Create_Patient(Region a)
        {
            if (a != null)
            {
                // Check if the region already exists in the database
                var existingRegion = _context.Regions.FirstOrDefault(r => r.RegionId == a.RegionId);

                if (existingRegion == null)
                {
                    // Region does not exist, so add it to the database
                    _context.Regions.Add(a);
                    _context.SaveChanges();
                }
                else
                {
                    // Region already exists, handle accordingly (e.g., return a message)
                    // You can customize this part based on your application's requirements
                    return BadRequest("Region already exists in the database.");
                }
            }

            return View();
        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
