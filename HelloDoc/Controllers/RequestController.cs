using BAL.Interface;
using BAL.Repository;
using DAL.DataContext;
using DAL.DataModels;
using DAL.ViewModel;
using DAL.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using System.Net.NetworkInformation;
using System.Runtime.CompilerServices;
using IHostingEnvironment = Microsoft.AspNetCore.Hosting.IHostingEnvironment;

namespace HelloDoc.Controllers
{
    public class RequestController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IPatient_Request _request;
        private readonly IFamily_Request _Family_Request;
        private readonly IConcierge_Request _concierge;
        private readonly IBusiness_Request _business;
        private readonly IAddFile _file;
        private readonly IHostingEnvironment _environment;
       


        //-----------------------Add Context---------------------------------

        public RequestController(ApplicationDbContext context,IPatient_Request patient_Request,IFamily_Request Family_Req,
            IConcierge_Request concierge,IBusiness_Request business_Request,IAddFile file,IHostingEnvironment hostingEnvironment)
        {
            _context = context;
            _request = patient_Request;
            _Family_Request = Family_Req;
            _concierge = concierge; 
            _business = business_Request;
            _file = file;
            _environment = hostingEnvironment;
        }

        //-----------------------Add Context-------------------------------------

        //----------------Patient Request----------------------------

        public IActionResult Patient_Request()

        {
            return View();
        }

        //verify email
        [HttpPost]
        public IActionResult CheckEmail(string email)
        {
            var user = _context.Users.FirstOrDefault(u => u.Email == email);
            return Json(new { exists = user != null });
        }

        [HttpPost]
        public IActionResult Patient_Request(Patient patient)
        {
            if (ModelState.IsValid)
            {
              _request.AddPatient(patient);
                if (patient.Filedata != null)
                {
                    string path = Path.Combine(this._environment.WebRootPath, "Files");
                    var uniquefilesavetoken = new Guid().ToString();

                    string fileName = Path.GetFileName(patient.Filedata.FileName);
                    fileName = $"{fileName}_{uniquefilesavetoken}";
                    _file.AddFile(patient.Filedata, fileName, path);
                     

                    var Request = _request.GetUserByEmail(patient.Email);
                    _request.RequestWiseFile(fileName, Request.RequestId);
                    return View();
                }
            }
            return View();  
        }
        //----------------Patient Request----------------------------


        //--------------------Family/Friend----------------------------------------
        public IActionResult Family_Friend_Request()

        {
            return View();
        }

        [HttpPost]
        public IActionResult Family_Friend_Request(Other_Request other_Reqs)

        {

            if(ModelState.IsValid)
            { 
                 _Family_Request.AddData(other_Reqs);
                if (other_Reqs.Filedata != null)
                {
                    string path = Path.Combine(this._environment.WebRootPath, "Files");
                    var uniquefilesavetoken = new Guid().ToString();

                    string fileName = Path.GetFileName(other_Reqs.Filedata.FileName);
                    fileName = $"{fileName}_{uniquefilesavetoken}";
                    _file.AddFile(other_Reqs.Filedata, path, fileName);
                    var Request = _request.GetUserByEmail(other_Reqs.Email_P);
                    _request.RequestWiseFile(fileName, Request.RequestId);
               
                   }
                }
            return View();
        }
        //--------------------Family/Friend----------------------------------------

        //--------------------Concierge---------------------------------------

        public IActionResult Concierge_Request()

        {
            return View();
        }

        [HttpPost]
        public IActionResult Concierge_Request(Other_Request other_Reqs)

        {
            _concierge.AddData(other_Reqs);
            return View();
        }
        //--------------------Concierge---------------------------------------

        //--------------------Business Request---------------------------------------

        public IActionResult Business_Request()

        {
            return View();
        }

        [HttpPost]
        public IActionResult Business_Request(Other_Request other_Reqs)
        {
            _business.addbusinessdata(other_Reqs);
            return View();
        }

        
        //--------------------Business Request---------------------------------------
    }
}
