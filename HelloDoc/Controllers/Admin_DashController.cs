using Microsoft.AspNetCore.Mvc;

namespace HelloDoc.Controllers
{
    public class Admin_DashController : Controller
    {
        public IActionResult Admin_Dash()
        {
            return View();
        }  
        public IActionResult test()
        {
            return View();
        }
    }
}
