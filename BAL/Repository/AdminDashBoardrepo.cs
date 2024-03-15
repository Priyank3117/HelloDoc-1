using BAL.Interface;
using DAL.DataContext;
using DAL.DataModels;
using DAL.ViewModel;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL.Repository
{
    public class AdminDashBoardrepo : IAdminDashBoard
    {

        private readonly ApplicationDbContext _context;

        public AdminDashBoardrepo(ApplicationDbContext context)
        {
            _context = context;
        }

    
        public IQueryable<Admin_DashBoard> GetList()
        {



            var DashData = (from req in _context.Requests
                            join reqclient in _context.RequestClients
                           on req.RequestId equals reqclient.RequestId


                            select new Admin_DashBoard()
                            {
                                Name = reqclient.FirstName,
                                Requestor = req.FirstName,
                                BirthDate = (new DateTime((int)reqclient.IntYear, int.Parse(reqclient.StrMonth), (int)reqclient.IntDate)).ToString("MMM dd,yyyy"),
                                RequestedDate = req.CreatedDate,
                                Email = reqclient.Email,
                                PhoneNumber = req.PhoneNumber,
                                requesttypeid = req.RequestTypeId,
                                PhoneNumber_P = reqclient.PhoneNumber,
                                regionid = reqclient.RegionId,
                                Address = reqclient.Street + " " + reqclient.City + " " + reqclient.State + " " + reqclient.ZipCode,
                                status = req.Status,
                                requestid = reqclient.RequestId,
                                cases = _context.CaseTags.ToList(),
                                region = _context.Regions.ToList(),
                                Isfinalise = _context.EncounterForms.FirstOrDefault(s => s.RequestId == req.RequestId).IsFinalize
                            }); ;

            return DashData;
        }

        public List<Admin_DashBoard> GetRequestData(string SearchValue, string Filterselect,
            string selectvalue, string partialName, int[] currentstatus)
        {
            var DashData = (from req in _context.Requests
                            join reqclient in _context.RequestClients
                             on req.RequestId equals reqclient.RequestId 


                            select new Admin_DashBoard()
                            {
                                Name = reqclient.FirstName.ToLower(),
                                LastName = reqclient.LastName,
                                Requestor = req.FirstName,
                                BirthDate = (new DateTime((int)reqclient.IntYear, int.Parse(reqclient.StrMonth), (int)reqclient.IntDate)).ToString("MMM dd,yyyy"),
                                RequestedDate = req.CreatedDate,
                                PhoneNumber = req.PhoneNumber,
                                requesttypeid = req.RequestTypeId,
                                PhoneNumber_P = reqclient.PhoneNumber,
                                regionid = reqclient.RegionId,
                                Address = reqclient.Street + " " + reqclient.City + " " + reqclient.State + " " + reqclient.ZipCode,
                                status = req.Status,
                                reqclientid = reqclient.RequestClientId,
                                Email = reqclient.Email,
                                Notes = reqclient.Notes,
                                confirmationnum = req.ConfirmationNumber,
                                requestid = reqclient.RequestId,
                                Isfinalise = _context.EncounterForms.FirstOrDefault(s => s.RequestId == req.RequestId).IsFinalize


                            }).Where(item => (string.IsNullOrEmpty(SearchValue) || item.Name.Contains(SearchValue)) &&
                              (string.IsNullOrEmpty(Filterselect) || item.requesttypeid == int.Parse(Filterselect)) &&
                              (string.IsNullOrEmpty(selectvalue) || item.regionid == int.Parse(selectvalue)) &&
                               currentstatus.Any(status => item.status == status)).ToList();

            return DashData;

        }

        public IQueryable<Admin_DashBoard> getregionwise()
        {
            var DashData = (from req in _context.Requests
                            join reqclient in _context.RequestClients
                             on req.RequestId equals reqclient.RequestId
                            join region in _context.Regions on reqclient.RegionId equals region.RegionId

                            select new Admin_DashBoard()
                            {
                                Name = reqclient.FirstName.ToLower(),
                                LastName = reqclient.LastName,
                                Requestor = req.FirstName,
                                BirthDate = (new DateTime((int)reqclient.IntYear, int.Parse(reqclient.StrMonth), (int)reqclient.IntDate)).ToString("MMM dd,yyyy"),
                                RequestedDate = req.CreatedDate,
                                PhoneNumber = req.PhoneNumber,
                                requesttypeid = req.RequestTypeId,
                                PhoneNumber_P = reqclient.PhoneNumber,
                                regionid = reqclient.RegionId,
                                Address = reqclient.Street + " " + reqclient.City + " " + reqclient.State + " " + reqclient.ZipCode,
                                status = req.Status,
                                reqclientid = reqclient.RequestClientId,
                                Email = reqclient.Email,
                                Notes = reqclient.Notes,
                                regionname = region.Name,
                                confirmationnum = req.ConfirmationNumber,
                                requestid = reqclient.RequestId,
                                Isfinalise = _context.EncounterForms.FirstOrDefault(s => s.RequestId == req.RequestId).IsFinalize

                            });

            return DashData;
        }

        public IQueryable<ViewNotes> GetViewNotes(int id)
        {
            var result = (from reqnote in _context.RequestNotes
                          join
                          reqstatuslog in _context.RequestStatusLogs
                          on reqnote.RequestId equals reqstatuslog.RequestId
                          into grp
                          where reqnote.RequestId == id
                          from reqstatuslog in grp.DefaultIfEmpty()
                          select new ViewNotes
                          {
                              AdminNotes = reqnote.AdminNotes,
                              PhysicianNotes = reqnote.PhysicianNotes,
                              TransferNotes = reqstatuslog.Notes ?? "-----"

                          });

            return result;
        }

        public ViewCase ViewCase(int id, int status)
        {
            var patientdata = getregionwise().Where(s => s.reqclientid == id).FirstOrDefault();
            ViewCase viewCase = new ViewCase();
            viewCase.FirstName = patientdata.Name;
            viewCase.LastName = patientdata.LastName;
            viewCase.DateOfBirth = DateTime.Parse(patientdata.BirthDate);
            viewCase.Phone = patientdata.PhoneNumber_P;
            viewCase.Email = patientdata.Email;
            viewCase.Notes = patientdata.Notes;
            viewCase.region = patientdata.regionname;
            viewCase.address = patientdata.Address;
            viewCase.ConfirmationNumber = patientdata.confirmationnum;
            viewCase.status = status;
            viewCase.requestid = patientdata.requestid;
            viewCase.cases = _context.CaseTags.ToList();

            return viewCase;
        }

        public bool CancelCase(int Requestid, string Reason, string Notes)
        {
            var user = _context.Requests.FirstOrDefault(h => h.RequestId == Requestid);


            if (user != null)
            {
                user.Status = 3;
                user.CaseTag = Reason;


                RequestStatusLog requeststatuslog = new RequestStatusLog();

                requeststatuslog.RequestId = Requestid;
                requeststatuslog.Notes = Notes;
                requeststatuslog.CreatedDate = DateTime.Now;
                requeststatuslog.Status = 3;

                _context.Add(requeststatuslog);
                _context.SaveChanges();

                _context.Update(user);
                _context.SaveChanges();

                return true;
            }

            else
            { return false; }

        }

        public void AssignCase(int req, string Description, string phyid)
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
        }

        public void TransferCase(int transferid, string Descriptionoftra, string phyidtra)
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
        }

        public void BlockCase(int blocknameid, string blocknotes)
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
        }

        public void ClearCase(int clearcaseid)
        {
            var request = _context.Requests.FirstOrDefault(s => s.RequestId == clearcaseid);

            if (request != null)
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
        }

        public void SendOrder(SendOrder sendOrder)
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
        }

        public CloseCase CloseCase(int requestid)
        {
            var requestClient = _context.RequestClients.FirstOrDefault(s => s.RequestId == requestid);
            var docData = _context.RequestWiseFiles.Where(s => s.RequestId == requestid).ToList();
            var Confirmationnum = _context.Requests.FirstOrDefault(s => s.RequestId == requestid).ConfirmationNumber;

            CloseCase closeCase = new CloseCase();
            if (docData != null && requestClient != null)
            {
                closeCase.FirstName = requestClient.FirstName;
                closeCase.LastName = requestClient.LastName;
                closeCase.Email = requestClient.Email;
                closeCase.Phonenum = requestClient.PhoneNumber;
                closeCase.DateOfBirth = (new DateOnly((int)requestClient.IntYear, int.Parse(requestClient.StrMonth), (int)requestClient.IntDate));
                closeCase.Files = docData;
                closeCase.ConfirmationNum = Confirmationnum;
                closeCase.requestid = requestid;
            }

            return closeCase;
        }

        public void CloseCasePost(CloseCase closeCase, int id)
        {
            var reqclient = _context.RequestClients.FirstOrDefault(s => s.RequestId == id);

            if (reqclient != null)
            {
                reqclient.PhoneNumber = closeCase.Phonenum;
                reqclient.FirstName = closeCase.FirstName;
                reqclient.LastName = closeCase.LastName;
                reqclient.IntDate = closeCase.DateOfBirth.Day;
                reqclient.IntYear = closeCase.DateOfBirth.Year;
                reqclient.StrMonth = closeCase.DateOfBirth.Month.ToString();

                _context.Update(reqclient);
                _context.SaveChanges();


            }
        }

        public Encounter EncounterForm(int id)
        {
            var result = (from req in _context.Requests
                          join
                       reqclient in _context.RequestClients on
                       req.RequestId equals reqclient.RequestId
                            join enc in _context.EncounterForms on req.RequestId equals enc.RequestId
                          into reqs
                          from enc in reqs.DefaultIfEmpty()
                          where req.RequestId == id
                          select new Encounter()    
                          {
                              FirstName = reqclient.FirstName,
                              LastName = reqclient.LastName,
                              Location = reqclient.Street + " " + reqclient.City,
                              BirthDate = new DateTime((int)reqclient.IntYear, int.Parse(reqclient.StrMonth), (int)reqclient.IntDate),
                              ServiceDate = DateTime.Now,
                              IllnessOrInjury = enc.HistoryOfPresentIllnessOrInjury,
                              MedicalHistory = enc.MedicalHistory,
                              Medications = enc.Medications,
                              Allergies = enc.Allergies,
                              Temprature = enc.Temp,
                              HR = enc.Hr,
                              RR = enc.Rr,
                              SytolicBp = enc.BloodPressureSystolic,
                              DistolicBp = enc.BloodPressureDiastolic,
                              O2 = enc.O2,
                              Pain = enc.Pain,
                              Heent = enc.Heent,
                              Cv = enc.Cv,
                              Chest = enc.Chest,
                              ABD = enc.Abd,
                              Extr = enc.Extremeties,
                              Skin = enc.Skin,
                              Neuro = enc.Neuro,
                              Other = enc.Other,
                              Dignosis = enc.Diagnosis,
                              TreatmentPlan = enc.TreatmentPlan,
                              MedicationDispensed = enc.MedicationsDispensed,
                              Procedures = enc.Procedures,
                              Followup = enc.FollowUp,
                              requestid = id

                          }).FirstOrDefault();

            return result;
            
        }

        public void EncounterPost(int id, Encounter enc)
        {
            var availabledata = _context.EncounterForms.FirstOrDefault(s => s.RequestId == id);

            if (availabledata != null)
            {
                //update the data already present
                availabledata.HistoryOfPresentIllnessOrInjury = enc.IllnessOrInjury;
                availabledata.MedicalHistory = enc.MedicalHistory;
                availabledata.Medications = enc.Medications;
                availabledata.Allergies = enc.Allergies;
                availabledata.Temp = enc.Temprature;
                availabledata.Hr = enc.HR;
                availabledata.Rr = enc.RR;
                availabledata.BloodPressureSystolic = enc.SytolicBp;
                availabledata.BloodPressureDiastolic = enc.DistolicBp;
                availabledata.O2 = enc.O2;
                availabledata.Pain = enc.Pain;
                availabledata.Heent = enc.Heent;
                availabledata.Cv = enc.Cv;
                availabledata.Chest = enc.Chest;
                availabledata.Abd = enc.ABD;
                availabledata.Extremeties = enc.Extr;
                availabledata.Skin = enc.Skin;
                availabledata.Neuro = enc.Neuro;
                availabledata.Other = enc.Other;
                availabledata.Diagnosis = enc.Dignosis;
                availabledata.TreatmentPlan = enc.TreatmentPlan;
                availabledata.MedicationsDispensed = enc.MedicationDispensed;
                availabledata.Procedures = enc.Procedures;
                availabledata.FollowUp = enc.Followup;
                availabledata.IsFinalize = false;

                _context.Update(availabledata);
                _context.SaveChanges();
            }
            else
            {

                //add the data not present
                EncounterForm encounterForm = new EncounterForm();
                encounterForm.HistoryOfPresentIllnessOrInjury = enc.IllnessOrInjury;
                encounterForm.MedicalHistory = enc.MedicalHistory;
                encounterForm.Medications = enc.Medications;
                encounterForm.Allergies = enc.Allergies;
                encounterForm.Temp = enc.Temprature;
                encounterForm.Hr = enc.HR;
                encounterForm.Rr = enc.RR;
                encounterForm.BloodPressureSystolic = enc.SytolicBp;
                encounterForm.BloodPressureDiastolic = enc.DistolicBp;
                encounterForm.O2 = enc.O2;
                encounterForm.Pain = enc.Pain;
                encounterForm.Heent = enc.Heent;
                encounterForm.Cv = enc.Cv;
                encounterForm.Chest = enc.Chest;
                encounterForm.Abd = enc.ABD;
                encounterForm.Extremeties = enc.Extr;
                encounterForm.Skin = enc.Skin;
                encounterForm.Neuro = enc.Neuro;
                encounterForm.Other = enc.Other;
                encounterForm.Diagnosis = enc.Dignosis;
                encounterForm.TreatmentPlan = enc.TreatmentPlan;
                encounterForm.MedicationsDispensed = enc.MedicationDispensed;
                encounterForm.Procedures = enc.Procedures;
                encounterForm.FollowUp = enc.Followup;
                encounterForm.IsFinalize = false;
                encounterForm.RequestId = id;

                _context.Add(encounterForm);
                _context.SaveChanges();
            }
        }

        public bool CloseInstance(int reqid)
        {
            var request = _context.Requests.FirstOrDefault(s => s.RequestId == reqid);

            if (request != null)
            {
                request.Status = 9;
                request.ModifiedDate = DateTime.Now;
                _context.Update(request);
                _context.SaveChanges();


                RequestStatusLog requestStatusLog = new RequestStatusLog();
                requestStatusLog.RequestId = reqid;
                requestStatusLog.Status = 9;
                requestStatusLog.CreatedDate = DateTime.Now;

                _context.Add(requestStatusLog);
                _context.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}



//join region in _context.Regions on reqclient.RegionId equals region.RegionId