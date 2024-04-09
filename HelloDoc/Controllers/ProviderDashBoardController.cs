using BAL.Interface;
using DAL.DataContext;
using DAL.ViewModel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using static BAL.Repository.Authorizationrepo;

namespace HelloDoc.Controllers
{

    [CustomAuthorize("Physician")]
    public class ProviderDashBoardController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IProviderDashBoard _providerDashBoard;
        private readonly IAdminDashBoard _AdminDashBoard;

        public ProviderDashBoardController(ApplicationDbContext context,IProviderDashBoard providerDashBoard,IAdminDashBoard adminDashBoard) { 
           

           _context = context;
            _providerDashBoard = providerDashBoard;
            _AdminDashBoard = adminDashBoard;
        }
     
        public IActionResult ProviderDashBoard()
        {
            var email = HttpContext.Session.GetString("Email");
            if (email != null)
            {
                ViewBag.username = _context.AspNetUsers.First(u => u.Email == email).UserName;
            }
            var DashData = _AdminDashBoard.GetList();

            var dashboardData = _providerDashBoard.GetCount();

            // Set ViewBag properties
            ViewBag.NewCount = dashboardData.NewCount;
            ViewBag.PendingCount = dashboardData.PendingCount;
            ViewBag.ActiveCount = dashboardData.ActiveCount;
            ViewBag.Conclude = dashboardData.Conclude;
            ViewBag.ToClosed = dashboardData.ToClosed;
            ViewBag.Unpaid = dashboardData.Unpaid;

            return View("DashBoard/ProviderDashBoard",DashData.ToList());
       
        }

        public JsonResult CheckSession()
        {
            var request = HttpContext.Request;
            var token = request.Cookies["jwt"];
            if (string.IsNullOrEmpty(token))
            {
                return Json(new { sessionExists = false });
            }
            else
            {
                return Json(new { sessionExists = true });
            }
        }

        public IActionResult SearchPatient(string SearchValue, string Filterselect,
           string selectvalue, string partialName, int[] currentstatus, int currentpage, int pagesize)
        {

            var FilterData = _AdminDashBoard.GetRequestData(SearchValue, Filterselect, selectvalue,
            partialName, currentstatus).ToList();

            int totalItems = FilterData.Count();
            int totalPages = (int)Math.Ceiling((double)totalItems / pagesize);
            if (SearchValue != null || selectvalue != null || Filterselect != null)
            {
                if (totalPages <= 1)
                {
                    currentpage = 1;
                }
            }
            var paginatedData = FilterData.Skip((currentpage - 1) * pagesize).Take(pagesize).ToList();
            ViewBag.TotalPages = totalPages;
            ViewBag.CurrentPage = currentpage;
            return PartialView(partialName, paginatedData);

        }
    }
}
