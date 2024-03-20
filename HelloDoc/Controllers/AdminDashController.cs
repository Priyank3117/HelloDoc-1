
using BAL.Interface;
using DAL.DataContext;
using DAL.ViewModel;
using DAL.DataModels;
using Microsoft.AspNetCore.Mvc;
using System.Collections;
using IHostingEnvironment = Microsoft.AspNetCore.Hosting.IHostingEnvironment;
using System.Net.Mail;
using static BAL.Repository.Authorizationrepo;
using Rotativa.AspNetCore;
using DAL.ViewModels;
using Microsoft.AspNetCore.Identity;





namespace HelloDoc.Controllers
{

    [CustomAuthorize("Admin")]
    public class AdminDashController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IAdminDashBoard _AdminDashboard;
        private readonly IHostingEnvironment _environment;
        private readonly IAddFile _files;
        private readonly IPatient_Request _patient;
        private readonly IEmailService _emailService;
        private readonly IPasswordHasher<AdminProfile> _passwordHasher;


        public AdminDashController(ApplicationDbContext context, IAdminDashBoard adminDashboard, IHostingEnvironment environment, IAddFile files, IPatient_Request patient, IEmailService emailService,
            IPasswordHasher<AdminProfile> passwordHasher)
        {
            _context = context;
            _AdminDashboard = adminDashboard;
            _environment = environment;
            _files = files;
            _patient = patient;
            _emailService = emailService;
            _passwordHasher = passwordHasher;
        }
        public IActionResult AdminDash()
        {
            var email = HttpContext.Session.GetString("Email");
            ViewBag.username = _context.AspNetUsers.First(u => u.Email == email).UserName;
            var DashData = _AdminDashboard.GetList();
            var newcount = (_context.Requests.Where(item => item.Status == 1)).Count();
            var pendingcount = (_context.Requests.Where(item => item.Status == 2)).Count();
            var activecount = (_context.Requests.Where(item => item.Status == 4 || item.Status == 5)).Count();
            var conclude = (_context.Requests.Where(item => item.Status == 6)).Count();
            var toclosed = (_context.Requests.Where(item => item.Status == 3 || item.Status == 7 || item.Status == 8)).Count();
            var unpaid = (_context.Requests.Where(item => item.Status == 9)).Count();
            ViewBag.NewCount = newcount;
            ViewBag.PendingCount = pendingcount;
            ViewBag.activecount = activecount;
            ViewBag.conclude = conclude;
            ViewBag.toclosed = toclosed;
            ViewBag.unpaid = unpaid;
            return View(DashData.ToList());
        }


        public IActionResult SearchPatient(string SearchValue, string Filterselect,
            string selectvalue, string partialName, int[] currentstatus, int currentpage, int pagesize)
        {
            
            var FilterData = _AdminDashboard.GetRequestData(SearchValue, Filterselect, selectvalue,
            partialName, currentstatus).ToList();
           
            int totalItems = FilterData.Count();
            int totalPages = (int)Math.Ceiling((double)totalItems / pagesize);
            if (SearchValue != null || selectvalue != null || Filterselect!=null)
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

        public IActionResult ViewCase(int id, int status)
        {
            var viewCase = _AdminDashboard.ViewCase(id, status);
            return View(viewCase);
        }

        public ActionResult ViewNotes(int id)
        {

            //if admin add notes in transfer request that will added in the requeststatus log
            //tables notes it will known as the transfer notes
            var result = _AdminDashboard.GetViewNotes(id).ToList();
            return View(result);
        }
        public ActionResult CancelCase(int Requestid, string Reason, string Notes)
        {
            if (_AdminDashboard.CancelCase(Requestid, Reason, Notes))
            {
                return RedirectToAction("AdminDash");
            }
            return Ok();
        }

        public IActionResult GetPhysician(string regionid)
        {
            var result = (from physician in _context.Physicians
                          join
                           region in _context.PhysicianRegions on
                           physician.PhysicianId equals region.PhysicianId into phy
                          select physician).Where(s => s.RegionId == int.Parse(regionid)).ToList();
            return Json(result);
        }


        public IActionResult AssignCase(int req, string Description, string phyid)
        {
            _AdminDashboard.AssignCase(req, Description, phyid);
            return Ok();
        }

        public IActionResult TransferCase(int transferid, string Descriptionoftra, string phyidtra)
        {
            _AdminDashboard.TransferCase(transferid, Descriptionoftra, phyidtra);
            return Ok();
        }
        public IActionResult GetPhysicianForTransfer(string regionid)
        {
            var result = (from physician in _context.Physicians
                          join
                           region in _context.PhysicianRegions on
                           physician.PhysicianId equals region.PhysicianId into phy
                          select physician).Where(s => s.RegionId == int.Parse(regionid)).ToList();
            return Json(result);
        }

        public IActionResult BlockCase(int blocknameid, string blocknotes)
        {
            _AdminDashboard.BlockCase(blocknameid, blocknotes);
            return Ok();
        }

        public IActionResult ViewUpload(int id)
        {

            bool[] bitValues = { true };
            BitArray bits = new BitArray(bitValues);
            var reque = _context.RequestWiseFiles.Where(u => u.RequestId == id && u.IsDeleted != bits).ToList();

            var result = new ViewDoc
            {
                requestwisefile = reque,
                requestid = id,
                //confirmationnum = _context.Requests.FirstOrDefault(s => s.RequestId == requestid).ConfirmationNumber,
            };

            return View(result);
        }


        [HttpPost]
        public IActionResult uploadfile(int reqid)
        {
            var file = Request.Form.Files["file"];
            var uniquefilesavetoken = Guid.NewGuid().ToString();

            string fileName = Path.GetFileName(file.FileName);
            fileName = $"{uniquefilesavetoken}_{fileName}";
            string path = Path.Combine(_environment.WebRootPath, "Files");
            _files.AddFile(file, path, fileName);

            _patient.RequestWiseFile(fileName, reqid);
            return RedirectToAction("ViewUpload", new { id = reqid });

        }


        public IActionResult DeleteFile(int reqid, string name)
        {

            string path = Path.Combine(_environment.WebRootPath, "Files", name);
            // _files.RemoveFile(path);

            RequestWiseFile reqFile = _context.RequestWiseFiles.Where(x => x.FileName == name).FirstOrDefault();
            if (reqFile != null)
            {
                bool[] bitValues = { true };
                BitArray bits = new BitArray(bitValues);
                reqFile.IsDeleted = bits;
                _context.Update(reqFile);
                _context.SaveChanges();
            }
            return RedirectToAction("ViewUpload", new { id = reqid });
        }
        //---------------------------DeleteSelectedFiles----------------------

        [HttpPost]
        public IActionResult DeleteSelectedFiles(List<string> filenames)
        {

            try
            {
                foreach (var filename in filenames)
                {
                    var file = _context.RequestWiseFiles.FirstOrDefault(item => item.FileName == filename);

                    if (file != null)
                    {
                        file.IsDeleted = new BitArray(new[] { true });
                        _context.SaveChanges();
                    }
                }

                return Ok(new { message = "Files delete successfully" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = $"Error deleting files: {ex.Message}" });
            }
        }
        //---------------------------DeleteSelectedFiles----------------------


        [HttpPost]
        public IActionResult SendFiles(List<string> filenames, int id)
        {

            try
            {

                List<Attachment> files = new List<Attachment>();

                if (filenames != null)
                {
                    foreach (var filename in filenames)
                    {
                        string path = Path.Combine(_environment.WebRootPath, "Files", filename);
                        var attach = new Attachment(path);
                        files.Add(attach);
                    }
                    var req = _context.Requests.FirstOrDefault(s => s.RequestId == id);

                    var subject = "Uploaded Documents";
                    var body = "Docs";

                    _emailService.SendEmail("patelpriyank3112002@gmail.com", subject, body, files);
                }
                return Ok(new { message = "Files Send successfully" });

            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = $"Error Sending  files: {ex.Message}" });
            }
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

        public IActionResult SendOrder(int id)
        {
            var Profession = _context.HealthProfessionalTypes.ToList();

            SendOrder sendOrder = new SendOrder();

            sendOrder.ProfessionName = Profession;
            sendOrder.requestid = id;
            return View(sendOrder);
        }

        [HttpPost]
        public IActionResult SendOrder(SendOrder sendOrder)
        {

            _AdminDashboard.SendOrder(sendOrder);
            return RedirectToAction("SendOrder", new { id = sendOrder.requestid });
        }

        public IActionResult GetBusinessName(string professionId)
        {
            var result = _context.HealthProfessionals.Where(r => r.Profession == int.Parse(professionId)).ToList();
            return Json(result);
        }

        public IActionResult GetBusinessData(string vendorId)
        {
            var result = _context.HealthProfessionals.Where(r => r.VendorId == int.Parse(vendorId)).FirstOrDefault();
            return Json(result);

        }

        public IActionResult ClearCase(int clearcaseid)
        {
            _AdminDashboard.ClearCase(clearcaseid);
            return Ok();
        }

        [HttpPost]
        public IActionResult SendAgreement(int sendagreementid)
        {
            var agreementLink = Url.Action("ReviewAgreement", "Request", new { requestid = sendagreementid }, protocol: HttpContext.Request.Scheme);
            var subject = "Acceptance of the agreement";

            if (agreementLink != null)
            {
                _emailService.SendEmail("patelpriyank3112002@gmail.com", subject,
                    $"<a href='{agreementLink}'>Click here </a> for further procedure");
                return Ok();
            }

            return BadRequest();
        }

        public IActionResult EncounterForm(int id)
        {

          var result = _AdminDashboard.EncounterForm(id);
           return View(result);
        }

        [HttpPost]
        public  IActionResult EncounterForm(int id,Encounter  enc)
        {
           _AdminDashboard.EncounterPost(id, enc);
            return RedirectToAction("EncounterForm", new {id = id });
        }

        public IActionResult Finalize(int id)
        {
            var finalize = _context.EncounterForms.FirstOrDefault(s => s.RequestId == id);

            if(finalize != null)
            {
                finalize.IsFinalize = true;
                _context.Update(finalize);
                _context.SaveChanges();
            }
            

            return RedirectToAction("AdminDash");
        }


        public IActionResult CloseCase(int requestid)
        {
           var closecase = _AdminDashboard.CloseCase(requestid);
           return View(closecase);
        }



        [HttpPost]
        public IActionResult CloseCase(CloseCase closeCase, int id)
        {
            _AdminDashboard.CloseCasePost(closeCase, id);
            return RedirectToAction("CloseCase", new { requestid = id });
        }

        public IActionResult CloseInstance(int reqid)
        {
            if (_AdminDashboard.CloseInstance(reqid))
            {
                return RedirectToAction("AdminDash");
            }
           else
            {
                return RedirectToAction("CloseCase", new { requestid = reqid });
            }
        }

        public IActionResult GeneratePDF(int requeid)
        {
            var EncounterForm = _AdminDashboard.EncounterForm(requeid);

            if (EncounterForm == null)
            {
                return NotFound();
            }

            return new ViewAsPdf("EncounterFormDetails", EncounterForm)
            {
                FileName = "Encounter_Form.pdf"
            };
        }

        public IActionResult AdminProfile() 
        {
            var Email = HttpContext.Session.GetString("Email"); 
            var adminProfile= _AdminDashboard.GetAdminData(Email);
           
            return View(adminProfile);     
        }

        public IActionResult AdministratorInformation(AdminProfile adminProfile,List<string> states)

        {
           
            var Email = HttpContext.Session.GetString("Email");
            if (Email != null)
            {
                _AdminDashboard.AdministratorInformation(adminProfile, Email,states);
            }
            HttpContext.Session.SetString("Email", adminProfile.Email);
            return RedirectToAction("AdminProfile");  
        } 
        
        
        public IActionResult MailingBillingInformation(AdminProfile adminProfile)
        {
            var Email = HttpContext.Session.GetString("Email");
            if (Email != null)
            {
                _AdminDashboard.MailingBillingInformation(adminProfile, Email);
            }
          
            return RedirectToAction("AdminProfile");  
        }

        public IActionResult AccountInformation([FromForm] string Password)
        {
            var Email = HttpContext.Session.GetString("Email");
            var hashPassword = _passwordHasher.HashPassword(null, Password);

            if (Email != null)
            {
                _AdminDashboard.AccountInformation(hashPassword, Email);
            }
            return RedirectToAction("Patient_login", "Login");
        }

        public IActionResult SendLinkForm(string sendLinkFirstname, string sendLinkLastname, string sendLinkEmail)
        {
            var mail = sendLinkEmail;      
            var subject = "Creat Patient Request";
            var formLink = Url.ActionLink("Patient_Request", "Request",  protocol: HttpContext.Request.Scheme);


            if (ModelState.IsValid)
            {

                if (formLink != null)
                {
                    _emailService.SendEmail("patelpriyank3112002@gmail.com", subject,
                        $"<a href='{formLink}'>Click here </a> for Request");
                }   
            }

            return RedirectToAction("AdminDash");
        }

        public IActionResult CreateRequest()
        {
            Patient patient = new Patient();
            patient.Region = _context.Regions.ToList();
            return View(patient);
            }

    }
}
