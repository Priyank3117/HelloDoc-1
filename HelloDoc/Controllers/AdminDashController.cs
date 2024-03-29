
using BAL.Interface;
using DAL.DataContext;
using DAL.ViewModel;
using Microsoft.AspNetCore.Mvc;
using System.Collections;
using IHostingEnvironment = Microsoft.AspNetCore.Hosting.IHostingEnvironment;
using System.Net.Mail;
using static BAL.Repository.Authorizationrepo;
using Rotativa.AspNetCore;
using Microsoft.AspNetCore.Identity;
using DAL.DataModels;
using AspNetCoreHero.ToastNotification.Abstractions;
using BAL.Repository;
using DAL.ViewModels;
using System.ComponentModel;






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
        private readonly INotyfService _notyf;
        private readonly IUploadProvider _uploadProvider;
        private readonly IAdminAction _adminAction;


        public AdminDashController(ApplicationDbContext context, IAdminDashBoard adminDashboard, IHostingEnvironment environment, IAddFile files, IPatient_Request patient, IEmailService emailService,
            IPasswordHasher<AdminProfile> passwordHasher, INotyfService notyf,IUploadProvider uploadProvider, IAdminAction adminAction)
        {
            _context = context;
            _AdminDashboard = adminDashboard;
            _environment = environment;
            _files = files;
            _patient = patient;
            _emailService = emailService;
            _passwordHasher = passwordHasher;
            _notyf = notyf;
            _uploadProvider = uploadProvider;
            _adminAction = adminAction;
        }
        public IActionResult AdminDash()
        {
            var email = HttpContext.Session.GetString("Email");
            if (email != null)
            {
                ViewBag.username = _context.AspNetUsers.First(u => u.Email == email).UserName;
            }
            var DashData = _AdminDashboard.GetList();
         
            var dashboardData = _AdminDashboard.GetCount();

            // Set ViewBag properties
            ViewBag.NewCount = dashboardData.NewCount;
            ViewBag.PendingCount = dashboardData.PendingCount;
            ViewBag.ActiveCount = dashboardData.ActiveCount;
            ViewBag.Conclude = dashboardData.Conclude;
            ViewBag.ToClosed = dashboardData.ToClosed;
            ViewBag.Unpaid = dashboardData.Unpaid;

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
            var viewCase = _adminAction.ViewCase(id, status);
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
            if (_adminAction.CancelCase(Requestid, Reason, Notes))
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
            _adminAction.AssignCase(req, Description, phyid);
            return Ok();
        }

        public IActionResult TransferCase(int transferid, string Descriptionoftra, string phyidtra)
        {
            _adminAction.TransferCase(transferid, Descriptionoftra, phyidtra);
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
            _adminAction.BlockCase(blocknameid, blocknotes);
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

            _adminAction.SendOrder(sendOrder);
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
            _adminAction.ClearCase(clearcaseid);
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

          var result = _adminAction.EncounterForm(id);
           return View(result);
        }

        [HttpPost]
        public  IActionResult EncounterForm(int id,Encounter  enc)
        {
            _adminAction.EncounterPost(id, enc);
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
           var closecase = _adminAction.CloseCase(requestid);
           return View(closecase);
        }



        [HttpPost]
        public IActionResult CloseCase(CloseCase closeCase, int id)
        {
            _adminAction.CloseCasePost(closeCase, id);
            return RedirectToAction("CloseCase", new { requestid = id });
        }

        public IActionResult CloseInstance(int reqid)
        {
            if (_adminAction.CloseInstance(reqid))
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
            var EncounterForm = _adminAction.EncounterForm(requeid);

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
                _notyf.Success("The Data Saved Successfully");
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
                _notyf.Success("The Data Saved Successfully");
            }
          
            return RedirectToAction("AdminProfile");  
        }

        public IActionResult AccountInformation([FromForm] string Password)
        {
            var Email = HttpContext.Session.GetString("Email");

            if (Email != null && Password != null)
            {
               var hashPassword = _passwordHasher.HashPassword(null, Password);
                _AdminDashboard.AccountInformation(hashPassword, Email);
                _notyf.Success("PasswordChanged Successfully");
               return RedirectToAction("Patient_login", "Login");
            }
            else
            {
                _notyf.Error("Please Enter the Password");
                _notyf.Warning("Password is Required");
                return RedirectToAction("AdminProfile");
            }
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
                    _notyf.Success("Email Sent Successfully");
                }   
            }

            return RedirectToAction("AdminDash");
        }

        public IActionResult CreateRequest()
        {
           CreateRequest createRequest = new CreateRequest();
            createRequest.Region = _context.Regions.ToList();
            return View(createRequest);
        }

        [HttpPost]
        public IActionResult CreateRequest(CreateRequest createRequest, string SelectedStateId)
        {
            var Email = HttpContext.Session.GetString("Email");
            var subject = "Creat Patient Request";
            var formLink = Url.ActionLink("Patient_Request", "Request", protocol: HttpContext.Request.Scheme);
            if (ModelState.IsValid)
            {
               _AdminDashboard.AddCreateRequest(createRequest, Email, SelectedStateId);
                if (formLink != null)
                {
                    //send email on createRequest.Email which is enter by admin
                    _emailService.SendEmail("patelpriyank3112002@gmail.com", subject,
                     $"<a href='{formLink}'>Click here </a> for Request");
                    _notyf.Success("Email Sent Successfully");
                }
                return RedirectToAction("CreateRequest");
            }
          
            createRequest.Region = _context.Regions.ToList();
            return View(createRequest);
       }

        public IActionResult Provider()
        {
            Provider provider = new Provider();
            provider.regions = _context.Regions.ToList();
            return View(provider);
        }

        public IActionResult ProvidersData(string region)
        {
            var result = _AdminDashboard.providers(region);
            return PartialView("_ProviderTable", result);
        }

        public IActionResult PhysicianProfile(int id)
        {
            var physicanProfile = _AdminDashboard.PhysicianProfile(id);
            return View(physicanProfile);
        }

        public IActionResult ResetPhysicianPassword(string Password, int physicianid)
        {

            Physician? physician = _context.Physicians.FirstOrDefault(item => item.PhysicianId == physicianid);
            AspNetUser? account = _context.AspNetUsers.FirstOrDefault(item => item.Email == physician.Email);

          
            if (account != null && Password != null)
            {
                string passwordhash = _passwordHasher.HashPassword(null,Password);
                account.PasswordHash = passwordhash;
                _context.AspNetUsers.Update(account);
                _context.SaveChanges();
                _notyf.Success("Password Changed Successfully");
            }
            else
            {
                _notyf.Error("Please Enter the Password");
            }

            return RedirectToAction("PhysicianProfile", "AdminDash", new { id = physicianid });
        }

        public IActionResult PhysicianInformation(int id, string MobileNo, string[] Region, string SynchronizationEmail, string NPINumber, string MedicalLicense)
        {
            Physician? physician = _context.Physicians.FirstOrDefault(item => item.PhysicianId == id);

            AspNetUser? account = _context.AspNetUsers.FirstOrDefault(item => item.Email == physician.Email);
            if (physician != null)
            {
                physician.Mobile = MobileNo;
                physician.Npinumber = NPINumber;
                physician.MedicalLicense = MedicalLicense;
                physician.SyncEmailAddress = SynchronizationEmail;
                _context.Physicians.Update(physician);
                _context.SaveChanges();


                List<PhysicianRegion> region = _context.PhysicianRegions.
                    Where(item => item.PhysicianId == physician.PhysicianId).ToList();

                _context.PhysicianRegions.RemoveRange(region);
                _context.SaveChanges();

                foreach (var item in Region)
                {
                    PhysicianRegion physicianRegion = new PhysicianRegion();
                    physicianRegion.PhysicianId= id;
                    physicianRegion.RegionId = int.Parse(item);
                    _context.Add(physicianRegion);
                    _context.SaveChanges();
                }

                _notyf.Success("Data Saved Successfully");
                
            }
            else
            {
                _notyf.Error("Data Can not be added");
            }
            return RedirectToAction("PhysicianProfile", "AdminDash", new{id = id });

        }

        public IActionResult MailingBillingInformationProvider(int physicianid, string MobileNo, string Address1, string Address2, string City, int State, string Zipcode)
        {
          
                Physician? physician = _context.Physicians.FirstOrDefault(item => item.PhysicianId == physicianid);
                if (physician != null)
                {
                    physician.Address1 = Address1;
                    physician.Address2 = Address2;
                    physician.City = City;
                    physician.Mobile = MobileNo;
                    physician.RegionId = State;
                    physician.Zip = Zipcode;
                    _context.Physicians.Update(physician);
                    _context.SaveChanges();
                  _notyf.Success("Data Saved Successfully");
               }
                else
                {
                  _notyf.Error("Data Can not be added");

                }
                return RedirectToAction("PhysicianProfile", "AdminDash", new { id = physicianid });
            }
        [HttpPost]
        public IActionResult SaveSignatureImage(IFormFile signatureImage, int id)
        {
            
                if (signatureImage != null && signatureImage.Length > 0)
                {
                    string fileName = _uploadProvider.UploadSignature(signatureImage, id);
                    var physician = _context.Physicians.FirstOrDefault(item => item.PhysicianId == id);
                    physician.Signature = fileName;
                    _context.Physicians.Update(physician);
                    _context.SaveChanges();
                    _notyf.Success("Signature Saved Successfully");
                    return Ok();
                }
                else
                {
                    _notyf.Error("signature can not be saved");
                    return BadRequest();
                }
      
           
        }

        public IActionResult Providerprofile(int id, string businessName, string businessWebsite, IFormFile signatureFile, IFormFile photoFile)
        {
            try
            {
                _AdminDashboard.UpdateProviderProfile(id, businessName, businessWebsite, signatureFile, photoFile);
                _notyf.Success("Data Added Successfully");
            }
            catch (InvalidOperationException ex)
            {
                _notyf.Error("Error While Saving the data");
                Console.WriteLine(ex.Message);
            }

            return RedirectToAction("PhysicianProfile", "AdminDash", new { id = id });
        }
        public IActionResult NotificationManagement(bool isChecked, string id)
        {
            var physicianNotification = _context.PhysicianNotifications.Where(u => u.PhysicianId == int.Parse(id)).FirstOrDefault();
            if (physicianNotification != null)
            {
                if (isChecked == true)
                {
                    physicianNotification.IsNotificationStopped = new BitArray(new[] { true });
                }
                else
                {
                    physicianNotification.IsNotificationStopped = new BitArray(new[] { false });
                }

                _context.PhysicianNotifications.Update(physicianNotification);
                _context.SaveChanges();
                return RedirectToAction("Provider");
            }
            return RedirectToAction("Provider");
        }

        [HttpPost]
        public IActionResult UploadDocumetns(string fileName, IFormFile File, int physicianid)
        {
           
            if (_AdminDashboard.UploadDocumetnsProvider(fileName,File,physicianid))
            {
                _notyf.Success("Document Saved Successfully");
                return Ok();
            }
            else
            {
                return BadRequest("No Doc File received.");
            }
        }

        public IActionResult CreateProviderAccount()
        {
             CreateProviderAccount createProviderAccount = new CreateProviderAccount();
            createProviderAccount.regions = _context.Regions.ToList();
            createProviderAccount.roles = _context.Roles.ToList();
            return View(createProviderAccount);

        }


        [HttpPost]
        public IActionResult CreateProviderAccount(CreateProviderAccount CreateProviderAccount,string[] regions)
        {
            if (ModelState.IsValid)
            {              
                _AdminDashboard.CreateProviderAccountPost(CreateProviderAccount, regions);
                _notyf.Success("Physician Added Successfully");
                return RedirectToAction("CreateProviderAccount");
            }

            else
            {
                CreateProviderAccount.regions = _context.Regions.ToList();
                CreateProviderAccount.roles = _context.Roles.ToList();
                return View("CreateProviderAccount", CreateProviderAccount);
            }
        }

        public IActionResult SendEmailSMS(string id,string Message,string radioForprovider)
        {

            if(id != null)
            {
                var physicianEmail = _context.Physicians.FirstOrDefault(s => s.PhysicianId == int.Parse(id)).Email;
            }
            ///do for value 3 and 2 
            if(radioForprovider == "1")
            {
                _emailService.SendEmail("Patelpriyank3112002@gmail.com", "For Contact", Message);
                _notyf.Success("Email sent successully");

            }
           else
            {
                _notyf.Error("Email can not be sent");
            }
            return RedirectToAction("AdminDash");
        }

        public IActionResult UserAccess()
        {   
            return View();
        }

        public IActionResult UserAccessData(int role)
         {


            var result = (from aspuser in _context.AspNetUsers
                          join aspnetuserrole in _context.AspNetUserRoles
                          on aspuser.AspNetUserId equals aspnetuserrole.UserId
                          join aspnetrole in _context.AspNetRoles
                          on aspnetuserrole.RoleId equals aspnetrole.AspNetRoleId
                          join phy in _context.Physicians
                          on aspuser.AspNetUserId equals phy.AspNetUserId into phyusers
                          from totaluser in phyusers.DefaultIfEmpty()
                          join admin in _context.Admins
                          on aspuser.AspNetUserId equals admin.AspNetUserId into admins
                          from totaladmins in admins.DefaultIfEmpty()
                          where ((role == 0 || aspnetuserrole.RoleId == role.ToString()) && aspnetuserrole.RoleId != "2")
                          select (role == 1 ? new UserAccess()
                          {
                              AccountType = aspnetrole.Name,
                              AccountPOC = aspuser.UserName,
                              phonenum = totaladmins.Mobile,
                              status = totaladmins.AdminId,
                              roleid = role,
                              AccountTypeid = role,
                              useraccessid = totaladmins.AdminId,
                          } : new UserAccess()
                          {
                              AccountType = aspnetrole.Name,
                              AccountPOC = aspuser.UserName,
                              phonenum = totaluser.Mobile,
                              status = totaluser.Status,
                              roleid = role,
                              AccountTypeid = role,
                              useraccessid = totaluser.PhysicianId,
                          }

                          )).ToList();
            return PartialView("_UserAccessPartial", result);
        }
    }
}
