using BAL.Interface;
using DAL.DataContext;
using DAL.ViewModel;
using DAL.ViewModels;
using Microsoft.AspNetCore.Mvc;
using IHostingEnvironment = Microsoft.AspNetCore.Hosting.IHostingEnvironment;

namespace HelloDoc.Controllers
{
    public class DashBoardController : Controller
    {

        private readonly ApplicationDbContext _context;
        private readonly IHostingEnvironment _environment;
        private readonly IAddFile _files;
        private readonly IPatient_Request _patient;

        public DashBoardController(ApplicationDbContext context,IHostingEnvironment environment , IAddFile files,IPatient_Request patient)
        {
            _context = context;
            _environment = environment;
            _files = files;
            _patient = patient;
        }
        public IActionResult Index()
        {
            
            var Email = HttpContext.Session.GetString("Email");
            var mail = _context.AspNetUsers.FirstOrDefault(u => u.Email == Email);
            
            var result = from req in _context.Requests
                         join requestfile in _context.RequestWiseFiles on req.RequestId equals requestfile.RequestId
                         into reqs
                         where req.Email == Email
                         from requestfile in reqs.DefaultIfEmpty()

                         select new Patient_Dash
                         {
                             CurrentStatus = req.Status,
                             CreatedDate = req.CreatedDate,
                             FilePath = requestfile.FileName != null ? requestfile.FileName : null,
                             requestid = req.RequestId,
                             count = _context.RequestWiseFiles.Count(u => u.RequestId == req.RequestId),

                         };

            return View(result.ToList());

        }

        public IActionResult viewDocs(int requestid)
        {
            var Email = HttpContext.Session.GetString("Email");
            var mail = _context.AspNetUsers.FirstOrDefault(u => u.Email == Email);
            var reque = _context.RequestWiseFiles.Where(u => u.RequestId == requestid).ToList();
            if (mail == null)
            {
                return NotFound();
            }
            else
            {
                ViewBag.username = mail.UserName;
            }
            var result = new ViewDoc
            {
                requestwisefile = reque,
                requestid = requestid
            };
            return View(result);
        }

        [HttpPost]
        public IActionResult uploadfile(int reqid)
        {
            var file = Request.Form.Files["file"];
            string path = Path.Combine(_environment.WebRootPath, "Files");
            _files.AddFile(file, path);

            _patient.RequestWiseFile(file.FileName , reqid);
            return RedirectToAction("viewDocs", new { requestid = reqid} );

        }

       
       

        public  IActionResult  Patient_Profile()
        {

            var email = HttpContext.Session.GetString("Email");
            var user = _context.Users.FirstOrDefault(u => u.Email == email);
            var Patient_Profile = new Patient_Profile();
            Patient_Profile.FirstName = user.FirstName;
            Patient_Profile.Email = user.Email;
            Patient_Profile.LastName = user.LastName;
            Patient_Profile.PhoneNumber = user.Mobile;
            Patient_Profile.Street = user.Street;
            Patient_Profile.City = user.City;
            Patient_Profile.State = user.State;
            Patient_Profile. ZipCode = user.ZipCode;

        
             
            return View(Patient_Profile);
        }
    }
}





      
       
        
