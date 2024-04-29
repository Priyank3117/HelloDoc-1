using AspNetCoreHero.ToastNotification.Abstractions;
using BAL.Interface;
using DAL.DataContext;
using DAL.DataModels;
using DAL.ViewModel;
using Humanizer;
using Microsoft.AspNetCore.Http;
using System.Collections;
using System.Data;
using System.Linq;

namespace BAL.Repository
{
	public class AdminAction : IAdminAction
	{

		private readonly ApplicationDbContext _context;
		private readonly IAdminDashBoard _adminDashBoard;
		private readonly INotyfService _notyf;
		public AdminAction(ApplicationDbContext context, IAdminDashBoard adminDashBoard, INotyfService notyfService)
		{
			_context = context;
			_adminDashBoard = adminDashBoard;
			_notyf = notyfService;
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


		public ViewCase ViewCase(int id, int status)
		{

			var patientdata = _adminDashBoard.getregionwise().Where(s => s.reqclientid == id).FirstOrDefault();
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




		public void AssignCase(int req, string Description, string phyid)
		{
			var user = _context.Requests.FirstOrDefault(h => h.RequestId == req);

			if (user != null && phyid != null)
			{

				user.ModifiedDate = DateTime.Now;
				user.PhysicianId = int.Parse(phyid);

				_context.Update(user);
				_context.SaveChanges();

				RequestStatusLog requeststatuslog = new RequestStatusLog();

				requeststatuslog.RequestId = req;
				requeststatuslog.Notes = Description;
				requeststatuslog.CreatedDate = DateTime.Now;


				_context.Add(requeststatuslog);
				_context.SaveChanges();

			}
			_notyf.Error("Please Select the Physician before submit");
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
				blockRequest.IsActive = new System.Collections.BitArray(new[] { true });

				_context.Add(blockRequest);
				_context.SaveChanges();
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

		#region Encounterform
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
							  Email = reqclient.Email,
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
		#endregion Encounterform

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
		public void DeleteFile(string name)
		{
			RequestWiseFile reqFile = _context.RequestWiseFiles.Where(x => x.FileName == name).FirstOrDefault();
			if (reqFile != null)
			{
				bool[] bitValues = { true };
				BitArray bits = new BitArray(bitValues);
				reqFile.IsDeleted = bits;
				_context.Update(reqFile);
				_context.SaveChanges();
			}
		}
		public IQueryable<Admin_DashBoard> GetRequests(int[] status)
		{

			var result = (from req in _context.Requests
						  join reqclient in _context.RequestClients
						  on req.RequestId equals reqclient.RequestId
						  orderby req.CreatedDate
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
						  }).Where(item => status.Any(s => item.status == s));


			return result;
		}

		public List<Scheduling> GetEvents(int region)
		{
			var eventswithoutdelet = (from s in _context.Shifts
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
									  }).Where(item => region == 0 || item.Regionid == region).ToList();
			var events = eventswithoutdelet.Where(item => !item.ShiftDeleted).ToList();
			return events;
		}



		#region GetusingId
		public Request GetByRequestId(int id)
		{
			var requestTableObj = _context.Requests.FirstOrDefault(s => s.RequestId == id);
			return requestTableObj;
		}

		public List<HealthProfessional> GetHealthProfessionalByProfessionId(string professionId)
		{
			var data = _context.HealthProfessionals.Where(r => r.Profession == int.Parse(professionId)).ToList();
			return data;
		}

		public HealthProfessional GetHealthProfessionalByVendorId(string vendorId)
		{
			var data = _context.HealthProfessionals.Where(r => r.VendorId == int.Parse(vendorId)).FirstOrDefault();
			return data;
		}

		public List<Region> GetRegionsList()
		{
			var regions = _context.Regions.ToList();
			return regions;
		}

		public List<Role> GetRolesList()
		{
			var roles = _context.Roles.ToList();
			return roles;
		}

		public List<Menu> GetMenusByRole(int role)
		{
			var menus = _context.Menus.Where(item => role == 0 || item.AccountType == role).ToList();
			return menus;
		}

		public List<RoleMenu> GetRoleMenusByRoleId(int roleid)
		{
			var rolemenu = _context.RoleMenus.Where(item => item.RoleId == roleid).ToList();
			return rolemenu;
		}

		public Role GetRoleByRoleId(int roleid)
		{
			var role = _context.Roles.Where(item => item.RoleId == roleid).FirstOrDefault();
			return role;
		}

        #endregion

        #region Creatshift


        public void CreateShift(Scheduling model, string email, int physicianId)
        {

            try
            {

                var timeSpan = model.Endtime - model.Starttime;


                bool timeSpanGreaterThanOneHour = timeSpan.TotalHours > 1 && timeSpan.TotalHours < 8;

                if (timeSpanGreaterThanOneHour)
                {
                    var admin = _context.Admins.FirstOrDefault(s => s.Email == email);


                    bool shiftExists = _context.ShiftDetails.Any(sd => sd.IsDeleted == new BitArray(new[] { false }) && sd.Shift.PhysicianId == (physicianId != 0 ? physicianId : model.Physicianid) &&
                    sd.ShiftDate.Date == model.Startdate.ToDateTime(TimeOnly.FromDateTime(DateTime.Now)).Date &&
                    (sd.StartTime < model.Endtime &&
                    sd.EndTime > model.Starttime));


                    if (!shiftExists)
                    {
                        Shift shift = new Shift();
                        shift.PhysicianId = physicianId != 0 ? physicianId : model.Physicianid;
                        shift.StartDate = model.Startdate;
                        shift.IsRepeat = new BitArray(new[] { model.Isrepeat });
                        shift.RepeatUpto = model.Repeatupto;
                        shift.CreatedDate = DateTime.Now;
                        shift.CreatedBy = physicianId != 0 ? _context.Physicians.FirstOrDefault(s => s.PhysicianId == physicianId).AspNetUserId : admin.AspNetUserId;
                        _context.Shifts.Add(shift);
                        _context.SaveChanges();

                        ShiftDetail sd = new ShiftDetail();
                        sd.ShiftId = shift.ShiftId;
                        sd.ShiftDate = new DateTime(model.Startdate.Year, model.Startdate.Month, model.Startdate.Day);
                        sd.StartTime = model.Starttime;
                        sd.EndTime = model.Endtime;
                        sd.RegionId = model.Regionid;
                        sd.Status = model.Status;
                        sd.IsDeleted = new BitArray(new[] { false });


                        _context.ShiftDetails.Add(sd);
                        _context.SaveChanges();

                        ShiftDetailRegion sr = new ShiftDetailRegion();
                        sr.ShiftDetailId = sd.ShiftDetailId;
                        sr.RegionId = (int)model.Regionid;
                        sr.IsDeleted = new BitArray(new[] { false });
                        _context.ShiftDetailRegions.Add(sr);
                        _context.SaveChanges();

                        if (shift.IsRepeat[0])
                        {
                            var stringArray = model.checkWeekday.Split(",");
                            foreach (var weekday in stringArray)
                            {

                                DateTime startDateForWeekday = model.Startdate.ToDateTime(TimeOnly.FromDateTime(DateTime.Now)).AddDays((7 + int.Parse(weekday) - (int)model.Startdate.DayOfWeek) % 7);


                                if (startDateForWeekday < model.Startdate.ToDateTime(TimeOnly.FromDateTime(DateTime.Now)))
                                {
                                    startDateForWeekday = startDateForWeekday.AddDays(7); // Add 7 days to move it to the next occurrence
                                }

                                // Iterate over Refill times
                                for (int i = 1; i <= shift.RepeatUpto; i++)
                                {
                                    bool shiftDetailsExists = _context.ShiftDetails.Any(sd => sd.IsDeleted == new BitArray(new[] { false }) && sd.Shift.PhysicianId == model.Physicianid &&
                                    sd.ShiftDate.Date == startDateForWeekday.Date &&
                                  (sd.StartTime < model.Endtime &&
                                    sd.EndTime > model.Starttime));
                                    // Create a new ShiftDetail instance for each occurrence

                                    if (!shiftDetailsExists)
                                    {
                                        ShiftDetail shiftDetail = new ShiftDetail
                                        {
                                            ShiftId = shift.ShiftId,
                                            ShiftDate = startDateForWeekday.AddDays(i * 7), // Add i  7 days to get the next occurrence
                                            RegionId = (int)model.Regionid,
                                            StartTime = model.Starttime,
                                            EndTime = model.Endtime,
                                            Status = 0,
                                            IsDeleted = new BitArray(new[] { false })
                                        };

                                        // Add the ShiftDetail to the database context
                                        _context.Add(shiftDetail);
                                        _context.SaveChanges();
                                    }
                                    else
                                    {

                                        _notyf.Error($"A shift already exists at {startDateForWeekday.ToString("dddd, MMMM d, yyyy")} from {model.Starttime.ToString("h:mm tt")} to {model.Endtime.ToString("h:mm tt")}");
                                    }

                                }
                            }
                        }
                    }
                    else
                    {
                        _notyf.Error($"A shift already exists from {model.Startdate.ToString("dddd, MMMM d, yyyy")} from {model.Starttime.ToString("h:mm tt")} to {model.Endtime.ToString("h:mm tt")}");
                    }
                }
                else
                {
                    _notyf.Error("Shift must be greater than 1 hour and less than 8 hours");
                }
            }
            catch
            {
                _notyf.Error("Error While Making Shift Please Try Again");

            }
        }
        public List<Physician> GetPhysicianShiftList(int region)
		{
			var physicians = (from physicianRegion in _context.PhysicianRegions
							  where region == 0 || physicianRegion.RegionId == region
							  select physicianRegion.Physician)
							 .ToList();

			return physicians;

		}

		List<Region> IAdminAction.GetRegionsList()
		{
		  var regions = _context.Regions.ToList();
			return regions;
		}

		public List<ShiftDetailModel> GetShifts(int region)
		{
			var result = (from shiftDetail in _context.ShiftDetails
						  where ((shiftDetail.RegionId == region || region == 0) &&
							 shiftDetail.Status != 0 && shiftDetail.IsDeleted != new BitArray(new[] { true }))
						  select new ShiftDetailModel
						  {
							  physicianName = shiftDetail.Shift.Physician.FirstName,
							  ShiftDetailId = shiftDetail.ShiftDetailId,
							  day = shiftDetail.ShiftDate.ToString("MMM dd, yyyy"),
							  starttime = shiftDetail.StartTime,
							  endtime = shiftDetail.EndTime,
							  Regioname = _context.Regions.FirstOrDefault(s => s.RegionId == shiftDetail.RegionId).Name,

						  }).ToList();
			return result;
		}

		public void ApprovedSelectedShift(string[] checkedValues)
		{
			foreach (var item in checkedValues)
			{
				if (item != "0")
				{
					var status = _context.ShiftDetails.FirstOrDefault(s => s.ShiftDetailId == int.Parse(item));
					status.Status = 0;
					_context.ShiftDetails.Update(status);
				}
			}

			_context.SaveChanges();
		}

		public void DeleteSelectedShift(string[] checkedValues)
		{
			foreach (var item in checkedValues)
			{
				if (item != "0")
				{
					var shiftToDelete = _context.ShiftDetails.FirstOrDefault(s => s.ShiftDetailId == int.Parse(item));
					shiftToDelete.IsDeleted = new BitArray(new[] { true });
					_context.ShiftDetails.Update(shiftToDelete);
				}
			}

			_context.SaveChanges();
		}

		public List<Physician> OnDuty(string region)
		{
			DateTime today = DateTime.Today;
			BitArray trueBitArray = new BitArray(new[] { true });
			var onDuty = (from physician in _context.Physicians
						  join shift in _context.Shifts on physician.PhysicianId equals shift.PhysicianId into shiftJoin
						  from shiftRecord in shiftJoin.DefaultIfEmpty()
						  join shiftDetail in _context.ShiftDetails on shiftRecord.ShiftId equals shiftDetail.ShiftId into shiftDetailJoin
						  from shiftDetailRecord in shiftDetailJoin.DefaultIfEmpty()
						  where shiftDetailRecord.IsDeleted != trueBitArray && shiftDetailRecord.ShiftDate.Date == today.Date
															&& shiftDetailRecord.StartTime <= TimeOnly.FromDateTime(DateTime.Now)
															&& shiftDetailRecord.EndTime >= TimeOnly.FromDateTime(DateTime.Now)
						  select physician).Where(x => region == "0" || x.RegionId == int.Parse(region)).Distinct().ToList();
			return onDuty;
		}

		public List<Physician> OffDuty(string region)
		{
			var offDuty = _context.Physicians.Where(x => region == "0" || x.RegionId == int.Parse(region)).ToList().Except(OnDuty(region)).ToList();
			return offDuty;
		}

		public List<BusinessModel> GetBusinessInfo(string Profession, string searchValue)
		{
			var data = (from profession in _context.HealthProfessionalTypes
						join business in _context.HealthProfessionals
						on profession.HealthProfessionalId equals business.Profession
						where business.IsDeleted != new BitArray(new[] {true})
						select new BusinessModel
						{
							profession = profession.ProfessionName,
							BusinessName = business.VendorName,
							Email = business.Email ?? "--",
							FaxNumber = business.FaxNumber ?? "--",
							PhoneNum = business.PhoneNumber ?? "--",
							BusinessContact = business.BusinessContact ?? "--",
							ProfessionId = business.Profession.ToString(),
							vendorid = business.VendorId
						}).Where(s => (Profession == "0" || s.ProfessionId == Profession) &&
							(string.IsNullOrEmpty(searchValue) || s.BusinessName.Contains(searchValue))).ToList();
			return data;
		}

		public void AddBusiness(AddBusiness addBusiness)
		{
			HealthProfessional healthProfessional = new HealthProfessional();
			healthProfessional.VendorName = addBusiness.BusinessName;
			healthProfessional.Profession = int.Parse(addBusiness.Profession);
			healthProfessional.BusinessContact = addBusiness.BusinessContact;
			healthProfessional.FaxNumber = addBusiness.FaxNumber;
			healthProfessional.Address = addBusiness.city + addBusiness.street;
			healthProfessional.City = addBusiness.city;
			healthProfessional.State = _context.Regions.FirstOrDefault(s => s.RegionId == int.Parse(addBusiness.state)).Name;
			healthProfessional.RegionId = int.Parse(addBusiness.state);
			healthProfessional.CreatedDate = DateTime.Now;
			healthProfessional.PhoneNumber = addBusiness.PhoneNum;
			healthProfessional.Email = addBusiness.Email;
			_context.HealthProfessionals.Add(healthProfessional);
			_context.SaveChanges();
		}

		public List<HealthProfessionalType> GetHealthProfessionalTypeList()
		{
			var list = _context.HealthProfessionalTypes.ToList();
			return list;
		}

		public AddBusiness EditBusinessData(int id)
		{
			var vendor = _context.HealthProfessionals.FirstOrDefault(s => s.VendorId == id);
			AddBusiness businessModel = new AddBusiness();
			businessModel.Profession = vendor.Profession.ToString();
			businessModel.BusinessName = vendor.VendorName;
			businessModel.BusinessContact = vendor.BusinessContact;
			businessModel.FaxNumber = vendor.FaxNumber;
			businessModel.PhoneNum = vendor.PhoneNumber;
			businessModel.state = _context.Regions.FirstOrDefault(s => s.Name == vendor.State).RegionId.ToString();
			businessModel.city = vendor.City;
			businessModel.Email = vendor.Email;
			businessModel.street = vendor.City;
			businessModel.vendorid = id;
			return businessModel;
		}

		public HealthProfessional GetVendor(int id)
		{
			var vendor = _context.HealthProfessionals.FirstOrDefault(s => s.VendorId == id);
			return vendor;
		}

		public void EditBusinessPost(AddBusiness addBusiness, int id)
		{
			var healthProfessional = _context.HealthProfessionals.FirstOrDefault(s => s.VendorId == id);
			healthProfessional.VendorName = addBusiness.BusinessName;
			healthProfessional.Profession = int.Parse(addBusiness.Profession);
			healthProfessional.BusinessContact = addBusiness.BusinessContact;
			healthProfessional.FaxNumber = addBusiness.FaxNumber;
			healthProfessional.Address = addBusiness.city + addBusiness.street;
			healthProfessional.City = addBusiness.city;
			healthProfessional.State = _context.Regions.FirstOrDefault(s => s.RegionId == int.Parse(addBusiness.state)).Name;
			healthProfessional.RegionId = int.Parse(addBusiness.state);
			healthProfessional.CreatedDate = DateTime.Now;
			healthProfessional.PhoneNumber = addBusiness.PhoneNum;
			healthProfessional.Email = addBusiness.Email;
			_context.HealthProfessionals.Update(healthProfessional);
			_context.SaveChanges();
		}

		public void DeleteBusinessData(int vendorid)
		{
			var vendor = _context.HealthProfessionals.FirstOrDefault(s => s.VendorId == vendorid);

			if (vendor != null)
			{
				vendor.IsDeleted = new BitArray(new[] { true });
				_context.Update(vendor);
				_context.SaveChanges();
				_notyf.Success("Deleted Successsfully");
			}
			else
			{
			_notyf.Error("Not deleted try again");

			}
		}

		public ShiftDetail ShiftDetail(int shiftDetailId)
		{
			var shiftdetails = _context.ShiftDetails.Find(shiftDetailId);
			return shiftdetails;
		}

		public void ChangeShift(int shiftDetailId, DateTime startDate, TimeOnly startTime, TimeOnly endTime, int region)
		{
			ShiftDetail shiftdetail = _context.ShiftDetails.Find(shiftDetailId);
			shiftdetail.ShiftDate = startDate;
			shiftdetail.StartTime = startTime;
			shiftdetail.EndTime = endTime;

			// Update the database
			_context.ShiftDetails.Update(shiftdetail);
			_context.SaveChanges();
		}
		public void ReturnShift(int shiftDetailId, int region)
		{
			ShiftDetail shiftdetail = _context.ShiftDetails.Find(shiftDetailId);
			shiftdetail.Status = (short)((shiftdetail.Status == 0) ? 1 : 0);
			_context.ShiftDetails.Update(shiftdetail);
			_context.SaveChanges();
		}

		public void DeleteShift(int shiftDetailId, int region)
		{
			ShiftDetail shiftdetail = _context.ShiftDetails.Find(shiftDetailId);
			shiftdetail.IsDeleted = new BitArray(new[] { true });
			_context.ShiftDetails.Update(shiftdetail);
			_context.SaveChanges();
		}


		#endregion Creatshift


	}
}
