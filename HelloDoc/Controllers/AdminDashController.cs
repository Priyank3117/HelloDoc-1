
using BAL.Interface;
using DAL.DataContext;
using DAL.ViewModel;
using DAL.DataModels;
using Microsoft.AspNetCore.Mvc;
using System.Collections;
using IHostingEnvironment = Microsoft.AspNetCore.Hosting.IHostingEnvironment;
using System.Net.Mail;
using static BAL.Repository.Authorizationrepo;




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


        public AdminDashController(ApplicationDbContext context, IAdminDashBoard adminDashboard, IHostingEnvironment environment, IAddFile files, IPatient_Request patient, IEmailService emailService)
        {
            _context = context;
            _AdminDashboard = adminDashboard;
            _environment = environment;
            _files = files;
            _patient = patient;
            _emailService = emailService;
        }
        public IActionResult AdminDash()
        {
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
            string selectvalue, string partialName, int[] currentstatus)
        {

            var FilterData = _AdminDashboard.GetRequestData(SearchValue, Filterselect, selectvalue,
                partialName, currentstatus).ToList();

            return PartialView(partialName, FilterData);

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
            var user = _context.Requests.FirstOrDefault(h => h.RequestId == req);

            if (user != null)
            {
                user.Status = 2;
                user.ModifiedDate = DateTime.Now;
                user.PhysicianId = int.Parse(phyid);

                _context.Update(user);
                _context.SaveChanges();

                RequestStatusLog requeststatuslog = new RequestStatusLog();

                requeststatuslog.RequestId = req;
                requeststatuslog.Notes = Description;
                requeststatuslog.CreatedDate = DateTime.Now;
                requeststatuslog.Status = 2;

                _context.Add(requeststatuslog);
                _context.SaveChanges();

            }

            return Ok();
        }

        public IActionResult TransferCase(int transferid, string Descriptionoftra, string phyidtra)
        {
            var user = _context.Requests.FirstOrDefault(h => h.RequestId == transferid);

            if (user != null)
            {
                user.Status = 2;
                user.ModifiedDate = DateTime.Now;
                user.PhysicianId = int.Parse(phyidtra);

                _context.Update(user);
                _context.SaveChanges();

                RequestStatusLog requeststatuslog = new RequestStatusLog();

                requeststatuslog.RequestId = transferid;
                requeststatuslog.Notes = Descriptionoftra;
                requeststatuslog.CreatedDate = DateTime.Now;
                requeststatuslog.Status = 2;

                _context.Add(requeststatuslog);
                _context.SaveChanges();

            }

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
            var user = _context.Requests.FirstOrDefault(h => h.RequestId == blocknameid);

            if (user != null)
            {
                user.Status = 11;


                _context.Update(user);
                _context.SaveChanges();

                RequestStatusLog requeststatuslog = new RequestStatusLog();

                requeststatuslog.RequestId = blocknameid;
                requeststatuslog.Notes = blocknotes ?? "--";
                requeststatuslog.CreatedDate = DateTime.Now;
                requeststatuslog.Status = 11;

                _context.Add(requeststatuslog);
                _context.SaveChanges();

                BlockRequest blockRequest = new BlockRequest();

                blockRequest.RequestId = blocknameid.ToString();
                blockRequest.CreatedDate = DateTime.Now;
                blockRequest.Email = user.Email;
                blockRequest.PhoneNumber = user.PhoneNumber;
                blockRequest.Reason = blocknotes ?? "--";

            }

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

            OrderDetail orderDetail = new OrderDetail();

            orderDetail.RequestId = sendOrder.requestid;
            orderDetail.VendorId = sendOrder.vendorId;
            orderDetail.FaxNumber = sendOrder.FaxNum;
            orderDetail.Email = sendOrder.Email;
            orderDetail.BusinessContact = sendOrder.BusinessContact;
            orderDetail.Prescription = sendOrder.Disciription;
            orderDetail.CreatedDate = DateTime.Now;

            _context.Add(orderDetail);
            _context.SaveChanges();
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
          var request = _context.Requests.FirstOrDefault(s => s.RequestId == clearcaseid);

            if(request != null)
            {
                request.Status = 10;

                _context.Update(request);
                _context.SaveChanges();

                RequestStatusLog requeststatuslog = new RequestStatusLog();

                requeststatuslog.RequestId = clearcaseid;
                requeststatuslog.CreatedDate = DateTime.Now;
                requeststatuslog.Status = 10;

                _context.Add(requeststatuslog);
                _context.SaveChanges();

            }
            return Ok();

        }


    }
}
