using Microsoft.AspNetCore.Mvc;

namespace HelloDoc.Controllers
{
    public class RequestController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
