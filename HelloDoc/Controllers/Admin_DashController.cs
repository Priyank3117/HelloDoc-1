
using BAL.Interface;
using DAL.DataContext;
using DAL.ViewModel;
using Microsoft.AspNetCore.Mvc;

namespace HelloDoc.Controllers
{
    public class Admin_DashController : Controller
    {


        private readonly ApplicationDbContext _context;
        private readonly IAdmin_DashBoard _AdminDashboard;
      

        public Admin_DashController(ApplicationDbContext context , IAdmin_DashBoard adminDashboard)
        {
            _context = context;
            _AdminDashboard = adminDashboard;
        }
        public IActionResult Admin_Dash()
        {
             var DashData = _AdminDashboard.GetRequestData();

            return View(DashData.ToList());
        }  
       public IActionResult AdminDash(string partialName)
        {
            var DashData = _AdminDashboard.GetRequestData().ToList();

            return PartialView(partialName,DashData);

        } 
        
        
        public IActionResult SearchPatient(string SearchValue,string Filterselect,string selectvalue, string partialName)
               {

            var FilterData = _AdminDashboard.GetRequestData()
                .Where(item => (string.IsNullOrEmpty(SearchValue) || item.Name.Contains(SearchValue)) &&
                              (string.IsNullOrEmpty(Filterselect) || item.requesttypeid == int.Parse(Filterselect)) &&
                              (string.IsNullOrEmpty(selectvalue) || item.regionid == int.Parse(selectvalue))).ToList();

            return PartialView(partialName, FilterData);

         
        }
    }
}
