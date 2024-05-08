using BAL.Interface;
using DAL.DataContext;
using DAL.DataModels;
using DAL.ViewModel;
using DAL.ViewModels;
using Microsoft.AspNetCore.Mvc;
using System.Collections;
using IHostingEnvironment = Microsoft.AspNetCore.Hosting.IHostingEnvironment;
using static BAL.Repository.Authorizationrepo;
using Microsoft.CodeAnalysis.Elfie.Serialization;
using AspNetCoreHero.ToastNotification.Abstractions;
using Rotativa.AspNetCore;

using System.Collections.Generic;


namespace HelloDoc.Controllers
{
    [   CustomAuthorize(new string[] { "Physician" }, "2")]
    public class ProviderDashBoardController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IProviderDashBoard _providerDashBoard;
        private readonly IHostingEnvironment _environment;
        private readonly IAdminDashBoard _AdminDashBoard;
        private readonly IAdminAction _adminAction;
        private readonly IEmailService _emailService;
        private readonly IAddFile _files;
        private readonly IPatient_Request _patient;
        private readonly INotyfService _notyf;
        private readonly IInvoicing _Invoicing;

        public ProviderDashBoardController(ApplicationDbContext context,IProviderDashBoard providerDashBoard,
            IAdminDashBoard adminDashBoard,IAdminAction adminAction,IEmailService emailService, IHostingEnvironment hostEnvironment, IAddFile files, 
            IPatient_Request patient,INotyfService notyf ,IInvoicing invoicing) { 
           

           _context = context;
            _providerDashBoard = providerDashBoard;
            _AdminDashBoard = adminDashBoard;
            _adminAction = adminAction;
            _emailService = emailService;
            _environment = hostEnvironment;
            _patient = patient;
            _files = files;
            _notyf = notyf;
            _Invoicing = invoicing;
        }
     
        public IActionResult ProviderDashBoard()
        {
            var email = HttpContext.Session.GetString("Email");
            int phyId = 0;
            if (email != null)
            {
                TempData["username"] = _context.AspNetUsers.First(u => u.Email == email).UserName;
                phyId = _context.Physicians.First(u => u.Email == email).PhysicianId;
            }
            var DashData = _AdminDashBoard.GetList();

            var dashboardData = _providerDashBoard.GetCount(phyId);

            // Set ViewBag properties
            ViewBag.NewCount = dashboardData.NewCount;
            ViewBag.PendingCount = dashboardData.PendingCount;
            ViewBag.ActiveCount = dashboardData.ActiveCount;
            ViewBag.Conclude = dashboardData.Conclude;
            ViewBag.ToClosed = dashboardData.ToClosed;
            ViewBag.Unpaid = dashboardData.Unpaid;

            return View("DashBoard/ProviderDashBoard",DashData.ToList());
       
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

        public IActionResult SearchPatient(string SearchValue, string Filterselect,
           string selectvalue, string partialName, int[] currentstatus, int currentpage, int pagesize)
        {
            var email = HttpContext.Session.GetString("Email");
            int phyId = 0;
            if (email != null)
            {
                 phyId = _context.Physicians.First(u => u.Email == email).PhysicianId;
            }

            var FilterData = _AdminDashBoard.GetRequestDataPhy(SearchValue, Filterselect, selectvalue,
            partialName, currentstatus, phyId).ToList();

            int totalItems = FilterData.Count();
            int totalPages = (int)Math.Ceiling((double)totalItems / pagesize);
            if (SearchValue != null || selectvalue != null || Filterselect != null)
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

        public IActionResult Accept(int id)
        {
            var user = _context.Requests.FirstOrDefault(h => h.RequestId == id);

            if (user != null)
            {
                user.Status = 2;
                user.ModifiedDate = DateTime.Now;
             
                _context.Update(user);
                _context.SaveChanges();

                RequestStatusLog requeststatuslog = new RequestStatusLog();

                requeststatuslog.RequestId = id;
                requeststatuslog.Status = 2;
                requeststatuslog.CreatedDate = DateTime.Now;


                _context.Add(requeststatuslog);
                _context.SaveChanges();

            }

            return RedirectToAction("ProviderDashBoard");
        }


        public IActionResult TransferCase(int transferid, string Descriptionoftra)
        {
            var user = _context.Requests.FirstOrDefault(h => h.RequestId == transferid);

            if (user != null)
            {
                user.Status = 1;
                user.PhysicianId = null;
                user.ModifiedDate = DateTime.Now;
                _context.Update(user);
                _context.SaveChanges();

                RequestStatusLog requeststatuslog = new RequestStatusLog();
                requeststatuslog.RequestId = transferid;
                requeststatuslog.Notes = Descriptionoftra;
                requeststatuslog.CreatedDate = DateTime.Now;
                requeststatuslog.Status = 1;
                _context.Add(requeststatuslog);
                _context.SaveChanges();

            }

            return Ok();
        }


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

       public IActionResult HouseCall(int requestid)
        {
            var  user = _context.Requests.FirstOrDefault(s => s.RequestId == requestid);

            if (user != null)
            {
                user.Status = 5;
                _context.Update(user) ;
                _context.SaveChanges();
            }
            return RedirectToAction("ProviderDashBoard");
        }
        
        public IActionResult Consult(int requestid)
        {
            var  user = _context.Requests.FirstOrDefault(s => s.RequestId == requestid);

            if (user != null)
            {
                user.Status = 6;
                _context.Update(user);
                _context.SaveChanges();
            }
            return RedirectToAction("ProviderDashBoard");
        }

        public IActionResult HouseCalled(int id)
        {
            var user = _context.Requests.FirstOrDefault(s => s.RequestId == id);

            if (user != null)
            {
                user.Status = 6;
                _context.Update(user);
                _context.SaveChanges();
            }
            return RedirectToAction("ProviderDashBoard");
        }

        public IActionResult ConcludeCare(int id)
        {

            bool[] bitValues = { true };
            BitArray bits = new BitArray(bitValues);
            var reque = _context.RequestWiseFiles.Where(u => u.RequestId == id && u.IsDeleted != bits).ToList();
            ViewBag.username = _context.RequestClients.FirstOrDefault(s => s.RequestId == id).FirstName;
              var result = new ViewDoc
            {
                requestwisefile = reque,
                requestid = id,

                //confirmationnum = _context.Requests.FirstOrDefault(s => s.RequestId == requestid).ConfirmationNumber,
            };

            return View("DashBoard/ConcludeCare",result);
           
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
            return RedirectToAction("ConcludeCare", new { id = reqid });

        }

        public IActionResult ConcludeCareSubmit(int id)
        {
            var isFinalize = _context.EncounterForms.Where(s => s.RequestId == id).Select(s => s.IsFinalize).FirstOrDefault();

            if(isFinalize)
            {
                var Notes = Request.Form["ProviderNote"];
                var physicianId = HttpContext.Session.GetInt32("PhysicianId");

                var request = _context.Requests.FirstOrDefault(u => u.RequestId == id);
                request.Status = 8;
                request.ModifiedDate = DateTime.Now;
                _context.Requests.Update(request);
                _context.SaveChanges();

                RequestStatusLog log = new RequestStatusLog()
                {
                    RequestId = id,
                    Status = request.Status,
                    PhysicianId = physicianId,
                    CreatedDate = DateTime.Now,


                };
                _context.RequestStatusLogs.Add(log);
                _context.SaveChanges();

                RequestNote note = _context.RequestNotes.FirstOrDefault(u => u.RequestId == id);
                note.PhysicianNotes = Notes;
                _context.RequestNotes.Update(note);
                _context.SaveChanges();
                _notyf.Success("Request closed Successfully");
              return RedirectToAction("ProviderDashBoard");
            }
            else
            {
                _notyf.Error("Request is not Finalize");
                return RedirectToAction("ProviderDashBoard");
            }
           

        }

        public IActionResult Scheduling()
        {
            var physicianId = HttpContext.Session.GetInt32("PhysicianId");
            var region = (from regions in _context.Regions 
                         join physicianRegion in _context.PhysicianRegions
                         on regions.RegionId equals physicianRegion.RegionId
                         where physicianRegion.PhysicianId == physicianId 
                         select regions).ToList();
            ViewBag.regions = region;
            return View("Scheduling/Scheduling");
        }

        public IActionResult GetPhysicianShift()
        {
            var physicianId = HttpContext.Session.GetInt32("PhysicianId");
            var physicians = (from physician in _context.Physicians
                              where physician.PhysicianId == physicianId
                              select physician)
                             .FirstOrDefault();
            return Json(physicians);
        }

        public IActionResult GetEvents()
        {
            var physicianId = HttpContext.Session.GetInt32("PhysicianId");

            var events = (from s in _context.Shifts
                          join pd in _context.Physicians on s.PhysicianId equals pd.PhysicianId
                          join sd in _context.ShiftDetails on s.ShiftId equals sd.ShiftId into shiftGroup
                          from sd in shiftGroup.DefaultIfEmpty()


                          select new Scheduling
                          {
							  Shiftid = sd.ShiftDetailId,
							  Status = sd.Status,
							  Starttime = sd.StartTime,
							  Endtime = sd.EndTime,
							  Physicianid = pd.PhysicianId,
							  PhysicianName = pd.FirstName + ' ' + pd.LastName,
							  Shiftdate = sd.ShiftDate,
							  ShiftDetailId = sd.ShiftDetailId,
							  Regionid = sd.RegionId,
							  ShiftDeleted = sd.IsDeleted[0]

						  }).ToList();
            events = events.Where(item => item.Physicianid == physicianId && !item.ShiftDeleted).ToList();

            var mappedEvents = events.Select(e => new
            {
                id = e.Shiftid,
                resourceId = e.Physicianid,
                title = e.PhysicianName,
                start = new DateTime(e.Shiftdate.Value.Year, e.Shiftdate.Value.Month, e.Shiftdate.Value.Day, e.Starttime.Hour, e.Starttime.Minute, e.Starttime.Second),
                end = new DateTime(e.Shiftdate.Value.Year, e.Shiftdate.Value.Month, e.Shiftdate.Value.Day, e.Endtime.Hour, e.Endtime.Minute, e.Endtime.Second),
                ShiftDetailId = e.ShiftDetailId,
                region = _context.Regions.Where(i => i.RegionId == e.Regionid),
                status = e.Status
            }).ToList();

            return Json(mappedEvents);
        }

        public IActionResult Finalize(int id)
        {
            var finalize = _context.EncounterForms.FirstOrDefault(s => s.RequestId == id);

            if (finalize != null)
            {
                finalize.IsFinalize = true;
                _context.Update(finalize);
                _context.SaveChanges();
            }
            else
            {
                _notyf.Error("Save the form before finalize");
            }

            return RedirectToAction("ProviderDashBoard");
        }
        public IActionResult GeneratePDF(int requeid)
        {
            var EncounterForm = _adminAction.EncounterForm(requeid);

            if (EncounterForm == null)
            {
                return NotFound();
            }

            return new ViewAsPdf("DashBoard/EncounterFormDetails", EncounterForm)
            {
                FileName = "Encounter_Form.pdf"
            };
        }

        public IActionResult ProviderInvoice()
        {
            ViewBag.Physicians = _adminAction.GetPhysicianList();
           
            return View("DashBoard/ProviderInvoice");
        }

        
          public IActionResult OpenSheet(string date)
        {
            var timeSheet = new TimeSheet();
            timeSheet.startdate = DateOnly.Parse(date);
            var physicianId = HttpContext.Session.GetInt32("PhysicianId");
            timeSheet.physicianId = physicianId;

            bool isSheetExist = _Invoicing.isTimeSheetExist(timeSheet.startdate);

            if (!isSheetExist)
            {
                _Invoicing.AddNewSheet(timeSheet.startdate, physicianId.ToString());
            }

            timeSheet.enddate = DateOnly.FromDateTime( timeSheet.startdate.Day == 1 ? 
                new DateTime(timeSheet.startdate.Year, timeSheet.startdate.Month, 15) :
                new DateTime(timeSheet.startdate.Year, timeSheet.startdate.Month, 1).AddMonths(1).AddDays(-1));

            var result = _Invoicing.getTimesheetdetails(physicianId.ToString(), date);
            timeSheet.timesheetdata = result;

            return PartialView("DashBoard/_TimeSheetPartial", timeSheet);
        }

        public IActionResult SubmitTimeSheet(TimeSheet timeSheet)
        {

            var physicianId = HttpContext.Session.GetInt32("PhysicianId");
            var modifier = HttpContext.Session.GetString("aspnetuserid");

            foreach (var i in timeSheet.timesheetdata)
            {

                TimesheetDetail? timeSheetDetail = _Invoicing.GetTimeSheetDetailOccurance(timeSheet.physicianId, i.date);
                timeSheetDetail.TotalHours = i.totalHours;
                timeSheetDetail.IsWeekend = i.isWeekend;
                timeSheetDetail.NumberOfHouseCall = i.HouseCallNo;
                timeSheetDetail.NumberOfPhoneCall = i.PhoneCallNo;
                timeSheetDetail.ModifiedDate = DateTime.Now;
                timeSheetDetail.ModifiedBy = modifier;

                _context.TimesheetDetails.Update(timeSheetDetail);
                _context.SaveChanges();
            }
            return RedirectToAction("ProviderInvoice");
        }

        //public IActionResult GetTimeSheetData(DateOnly date)
        //{
           
        //}

    }
}
