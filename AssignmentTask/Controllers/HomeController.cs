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
            var result = _project.ProjectList().Where(item => (string.IsNullOrEmpty(SearchValue) || item.ProjectName.ToLower().Contains(SearchValue.ToLower()))).OrderBy(s =>s.ProjectId).ToList();
            return PartialView("_ProjectPartial",result);
        }
        [HttpGet]
        public IActionResult EditProject(string id)
        {
            ViewBag.Domains = _project.DomainList();
            var result = _project.GetProject(id);
            return PartialView("_EditModal",result);
        }

        [HttpPost]
        public IActionResult EditPost(ProjectViewModel projectViewModel,string id)
        {
            _project.UpdateProject(projectViewModel,id);
            return RedirectToAction("Index");
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
