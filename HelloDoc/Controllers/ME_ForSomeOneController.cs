using BAL.Interface;
using DAL.DataContext;
using DAL.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using IHostingEnvironment = Microsoft.AspNetCore.Hosting.IHostingEnvironment;

namespace HelloDoc.Controllers
{
    


    public class ME_ForSomeOneController : Controller
    {

        private readonly ApplicationDbContext _context;
        private readonly IPatient_Request _request;
        private readonly IHostingEnvironment _environment;
        private readonly IAddFile _file;



        //-----------------------Add Context---------------------------------

        public ME_ForSomeOneController(ApplicationDbContext context, IPatient_Request patient_Request, IHostingEnvironment environment, IAddFile file)
        {
            _context = context;
            _request = patient_Request;
            _environment = environment;
            _file = file;   
        }
        public IActionResult Me()
        {
            var email = HttpContext.Session.GetString("Email");
            var user = _context.Users.FirstOrDefault(u => u.Email == email);

            var patient = new Patient
            {
                Email=email,
                FirstName = user.FirstName, 
                LastName = user.LastName,
                PhoneNumber = user.Mobile,
                regions = _context.Regions.ToList()
             };
        
           
            return View(patient);
        }

        [HttpPost]
        public IActionResult Me(Patient patient)
        {
            var email = HttpContext.Session.GetString("Email");
            var user = _context.Users.FirstOrDefault(u => u.Email == email);


            if(ModelState.IsValid) 
            { 
              _request.AddPatient(patient);
                if (patient.Filedata != null)
                {
                    string path = Path.Combine(this._environment.WebRootPath, "Files");
                    var uniquefilesavetoken = new Guid().ToString();

                    string fileName = Path.GetFileName(patient.Filedata.FileName);
                    fileName = $"{uniquefilesavetoken}_{fileName}";
                    _file.AddFile(patient.Filedata, path, fileName);

                    var Request = _request.GetUserByEmail(patient.Email);
                    _request.RequestWiseFile(fileName, Request.RequestId);

                }

                return RedirectToAction("Me");
            }
            else
            {
                patient.regions = _context.Regions.ToList();
                return View(patient);
            }
        } 
        
        
        
        public IActionResult SomeOne()
        {
            Patient patient = new Patient();
            patient.regions = _context.Regions.ToList();
            return View(patient);
        }

        [HttpPost]
        public IActionResult SomeOne(Patient patient)
        {
            var email = HttpContext.Session.GetString("Email");
            var user = _context.Users.FirstOrDefault(u => u.Email == email);


            if (ModelState.IsValid)
            {
                _request.AddPatient(patient);
                if (patient.Filedata != null)
                {
                    string path = Path.Combine(this._environment.WebRootPath, "Files");
                    var uniquefilesavetoken = new Guid().ToString();

                    string fileName = Path.GetFileName(patient.Filedata.FileName);
                    fileName = $"{uniquefilesavetoken}_{fileName}";
                    _file.AddFile(patient.Filedata, path, fileName);

                    var Request = _request.GetUserByEmail(patient.Email);
                    _request.RequestWiseFile(fileName, Request.RequestId);

                }
                return RedirectToAction("SomeOne");
            }
            else
            {
                patient.regions = _context.Regions.ToList();
                return View(patient);
            }
        }
    }
}
