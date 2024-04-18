using BAL.Interface;
using DAL.DataContext;
using DAL.ViewModel;
using DAL.ViewModels;
using Microsoft.AspNetCore.Mvc;
using System.Web.Helpers;
using static BAL.Repository.Authorizationrepo;
using IHostingEnvironment = Microsoft.AspNetCore.Hosting.IHostingEnvironment;

namespace HelloDoc.Controllers
{

   
    [CustomAuthorize(new string[] { "Patient" })]
    public class DashBoardController : Controller
    {

		#region variable
        private readonly IHostingEnvironment _environment;
        private readonly IAddFile _files;
        private readonly IPatient_Request _patient;
        private readonly IDashBoard _dashBoard;

        public DashBoardController(IHostingEnvironment environment , IAddFile files,IPatient_Request patient,IDashBoard dashBoard)
        {
            _environment = environment;
            _files = files;
            _patient = patient;
            _dashBoard = dashBoard;
        }

		#endregion

		#region Index,viewdoc,uploadfile,patientprofile
		public IActionResult Index()
                {
            
            var Email = HttpContext.Session.GetString("Email");
            var mail = _dashBoard.GetUser(Email);
   
            if (mail == null)
            {
                return NotFound();
            }
            else
            {
                ViewBag.username = mail.FirstName + " " + mail.LastName;
            }

            var result = _dashBoard.GetPatientData(Email);
            return View(result);

        }

        public IActionResult viewDocs(int requestid)
        {
            var Email = HttpContext.Session.GetString("Email");
            var mail = _dashBoard.GetUser(Email);
            var reque = _dashBoard.GetRequestWiseFiles(requestid);

			if (mail == null)
            {
                return NotFound();
            }
            else
            {
                ViewBag.username = mail.FirstName + " " +mail.LastName;
            }
            var result = new ViewDoc
            {
                requestwisefile = reque,
                requestid = requestid,
                confirmationnum = _dashBoard.ConfirmationNumber(requestid)
            };
            return View(result);
        }



        [HttpPost]
        public IActionResult uploadfile(int reqid)
        {
            var file = Request.Form.Files["file"];
            var uniquefilesavetoken = new Guid().ToString();

            string fileName = Path.GetFileName(file.FileName);
            fileName = $"{fileName}_{uniquefilesavetoken}";
            string path = Path.Combine(_environment.WebRootPath, "Files");
            _files.AddFile(file, path, fileName);

            _patient.RequestWiseFile(fileName, reqid);
            return RedirectToAction("viewDocs", new { requestid = reqid} );

        }

       
       

        public  IActionResult  Patient_Profile()
        {
            var Email = HttpContext.Session.GetString("Email");
            var mail = _dashBoard.GetUser(Email);

			if (mail == null)
            {
                return NotFound();
            }
            else
            {
                ViewBag.username = mail.FirstName + " " + mail.LastName;
            }

            var email = HttpContext.Session.GetString("Email");
            var user = _dashBoard.GetUser(email);
			var Patient_Profile = new Patient_Profile();
            Patient_Profile.FirstName = user.FirstName;
            Patient_Profile.Email = user.Email;
            Patient_Profile.LastName = user.LastName;
            Patient_Profile.PhoneNumber = user.Mobile;
           
            Patient_Profile.Street = user.Street;
            Patient_Profile.City = user.City;
            Patient_Profile.State = user.State;
            Patient_Profile. ZipCode = user.ZipCode;

        
             
            return View(Patient_Profile);
        }

        [HttpPost]
        public  IActionResult  Patient_Profile(Patient_Profile patient_Profile)
        {

            var email = HttpContext.Session.GetString("Email");
			if (ModelState.IsValid)
            {
                _dashBoard.Patient_Profile(patient_Profile, email);
                return RedirectToAction("Patient_Profile");
            }
            else
            {
                return View(patient_Profile);
            }

          
                
        }
		#endregion
	}
}





      
       
        
