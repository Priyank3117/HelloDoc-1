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
        public IActionResult Index()
        {

            var email = HttpContext.Session.GetString("Email");
            var result = (from req in _context.Requests
                          join requestfile in _context.RequestWiseFiles on req.RequestId equals requestfile.RequestId
                          where req.Email == email
                          select new Patient_Dash 
                          {
                              CurrentStatus = req.Status,
                              CreatedDate = requestfile.CreatedDate,

                          }).ToList();

            return View(result);

        }
    }
}





      
       
        
