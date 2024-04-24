using AssignmentBAL.Interface;
using AssignmentDAL.ViewModel;
using AssignmentTask.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace AssignmentTask.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IProjects _project;

        public HomeController(ILogger<HomeController> logger,IProjects project)
        {
            _logger = logger;
                _project = project;
        }

        public IActionResult Index()
        {
            ViewBag.Domains = _project.DomainList();
            return View();
        }

        [HttpPost]
        public IActionResult ProjectAdd(ProjectViewModel projectViewModel)
        {
            _project.AddProject(projectViewModel);
            
            return RedirectToAction("Index");
        }

        public IActionResult GetSearchProjects(string SearchValue)
        {
            var result = _project.ProjectList().Where(item => (string.IsNullOrEmpty(SearchValue) || item.ProjectName.ToLower().Contains(SearchValue.ToLower()))).ToList();
            return PartialView("_ProjectPartial",result);
        }

        public IActionResult EditProject(string id)
        {
            var result = _project.GetProject(id);
            return Json(result);
        }

        public IActionResult DeleteProject(string id)
        {
            _project.DeleteProject(id);
            ViewBag.Domains = _project.DomainList();
            return View("Index");
        }


        public IActionResult Privacy()
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
