using DAL.DataContext;
using DAL.ViewModel;
using DAL.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace HelloDoc.Controllers
{
    public class DashBoardController : Controller
    {

        private readonly ApplicationDbContext _context;

        public DashBoardController(ApplicationDbContext context)
        {
            _context = context;
        }
        public IActionResult Index( string Email)
        {
            var mail = _context.AspNetUsers.FirstOrDefault(u => u.Email == Email);
            if (mail == null)
            {
                return NotFound();
            }
            else
            {
                ViewBag.username = mail.UserName;
            }
            var email = HttpContext.Session.GetString("Email");
            var result = from req in _context.Requests
                         join requestfile in _context.RequestWiseFiles on req.RequestId equals requestfile.RequestId
                         into reqs
                         where req.Email == email
                         from requestfile in reqs.DefaultIfEmpty()

                         select new Patient_Dash
                         {
                             CurrentStatus = req.Status,
                             CreatedDate = req.CreatedDate,
                             FilePath = requestfile.FileName != null ? requestfile.FileName : null,
                             requestid = req.RequestId

                          };

            return View(result.ToList());

        }

        [HttpGet]
        public IActionResult viewDocs(int requestid)
        {
            var Email = HttpContext.Session.GetString("Email");
            var mail = _context.AspNetUsers.FirstOrDefault(u => u.Email == Email);
            var reque = _context.RequestWiseFiles.FirstOrDefault(u => u.RequestId == requestid);
            if (mail == null)
            {
                return NotFound();
            }
            else
            {
                ViewBag.username = mail.UserName;
            }
            var result = (from req in _context.Requests where req.RequestId == requestid
               select new ViewDoc
            {
                DocName =  reque.FileName,
                Uploader = req.FirstName + " " + req.LastName,
                   UpDate = req.CreatedDate
                
            }).ToList();
            return View(result);
        }
    }
}





      
       
        
