using HelloDoc.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using Microsoft.EntityFrameworkCore;
using DAL.DataContext;
using DAL.DataModels;
using System.Drawing;
using System.Security.Principal;
using DAL.ViewModels;

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

        //----------------------------------------------------------------------------
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Patient_login(AspNetUser user)
        {

            var Email = _context.AspNetUsers.FirstOrDefault(m => m.Email == user.Email);
            var pwd = _context.AspNetUsers.FirstOrDefault(m => m.PasswordHash == user.PasswordHash);

          
            
           if(ModelState.IsValid)
            {

                if (Email != null && Email.PasswordHash == user.PasswordHash)
                {
                    return RedirectToAction(nameof(Privacy));

                }
                else
                {
                    return NotFound();
                }
            }
            
           return View();

        }


        //-------------------------------login ------------------------------------------
        //-------------------------------view model-------------------------------------------
        [HttpPost]
        public  IActionResult Patient_Request(Patient patient)
        {
            AspNetUser aspnetUser = new AspNetUser();
            User user = new User();
            Request request = new Request();   

            var status = _context.Users.FirstOrDefault(User => User.Email == patient.Email);
            RequestClient request_c = new RequestClient();    
            var username = aspnetUser.UserName = patient.FirstName + ' ' + patient.LastName;


            if (patient != null && status == null)
            {
                Guid id = Guid.NewGuid();
                aspnetUser.AspNetUserId = id.ToString(); ;
                aspnetUser.UserName = username;
                aspnetUser.Email = patient.Email;
                aspnetUser.PhoneNumber = patient.PhoneNumber;
                aspnetUser.CreatedDate = DateTime.Now;

                _context.AspNetUsers.Add(aspnetUser);
                _context.SaveChanges();

                user.AspNetUserId = aspnetUser.AspNetUserId;
                user.FirstName = patient.FirstName;
                user.LastName = patient.LastName;
                user.Email = patient.Email;
                user.Mobile = patient.PhoneNumber;
                user.CreatedDate = DateTime.Now;
                user.Street = patient.Street;
                user.City = patient.City;
                user.State = patient.State;
                user.ZipCode = patient.ZipCode;
                user.CreatedBy = patient.FirstName;
                user.CreatedDate = DateTime.Now;


                _context.Users.Add(user);
                _context.SaveChanges();

                request.UserId = user.UserId;
                request.FirstName = patient.FirstName;
                request.LastName = patient.LastName;
                request.Email = patient.Email;
                request.PhoneNumber = patient.PhoneNumber;
                request.CreatedDate = DateTime.Now;

                _context.Requests.Add(request);
                _context.SaveChanges();


                request_c.RequestId = request.RequestId;
                request_c.FirstName = patient.FirstName;
                request_c.LastName = patient.LastName;
                request_c.Email = patient.Email;
                request_c.PhoneNumber = patient.PhoneNumber;
                request_c.Street = patient.Street;
                request_c.City = patient.City;
                request_c.State = patient.State;
                request_c.ZipCode = patient.ZipCode;




                _context.RequestClients.Add(request_c);
                _context.SaveChanges();

            }
            else {

                request.UserId = status.UserId;
                request.FirstName = patient.FirstName;
                request.LastName = patient.LastName;
                request.Email = patient.Email;
                request.PhoneNumber = patient.PhoneNumber;
                request.CreatedDate = DateTime.Now;

                _context.Requests.Add(request);
                _context.SaveChanges();


                request_c.RequestId = request.RequestId;
                request_c.FirstName = patient.FirstName;
                request_c.LastName = patient.LastName;
                request_c.Email = patient.Email;
                request_c.PhoneNumber = patient.PhoneNumber;
                request_c.Street = patient.Street;
                request_c.City = patient.City;
                request_c.State = patient.State;
                request_c.ZipCode = patient.ZipCode;




                _context.RequestClients.Add(request_c);
                _context.SaveChanges();

            }

            return View();
        }


        //-------------------------------view model-------------------------------------------



        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
