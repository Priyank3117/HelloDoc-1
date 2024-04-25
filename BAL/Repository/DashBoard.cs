using BAL.Interface;
using DAL.DataContext;
using DAL.DataModels;
using DAL.ViewModel;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL.Repository
{
	public class DashBoard : IDashBoard
	{
		private readonly ApplicationDbContext _context;
		public DashBoard(ApplicationDbContext context) 
		{

			_context = context;
		}
		public User GetUser(string Email)
		{
			var user=_context.Users.FirstOrDefault(u => u.Email == Email);
			return user;
		}

		public List<Patient_Dash> GetPatientData(string Email)
		{
			var result = (from req in _context.Requests
						 join reqclient in _context.RequestClients on req.RequestId equals reqclient.RequestId
						 join requestfile in _context.RequestWiseFiles on req.RequestId equals requestfile.RequestId
						 into reqs
						 where reqclient.Email == Email
						 from requestfile in reqs.DefaultIfEmpty()

						 select new Patient_Dash
						 {
							 CurrentStatus = req.Status,
							 CreatedDate = req.CreatedDate,	
							 FilePath = requestfile.FileName != null ? requestfile.FileName : null,
							 requestid = req.RequestId,
							 count = _context.RequestWiseFiles.Count(u => u.RequestId == req.RequestId),
						 }).ToList();
			return result;
		}

		public void Patient_Profile(Patient_Profile patient_Profile, string email)
		{
			var user = GetUser(email);
			user.FirstName = patient_Profile.FirstName;
			user.LastName = patient_Profile.LastName;
			user.Mobile = patient_Profile.PhoneNumber;
			user.Street = patient_Profile.Street;
			user.City = patient_Profile.City;
			user.State = patient_Profile.State;
			user.IntDate = patient_Profile.BirthDate.Value.Day;
			user.IntYear = patient_Profile.BirthDate.Value.Year;
			user.StrMonth = (patient_Profile.BirthDate.Value.Month).ToString();
			user.ZipCode = patient_Profile.ZipCode;

			_context.Update(user);
			_context.SaveChanges();
		}

		public List<RequestWiseFile> GetRequestWiseFiles(int requestid)
		{
			var req=_context.RequestWiseFiles.Where(u => u.RequestId == requestid).ToList();
			return req;
		}

		public string ConfirmationNumber(int requestid)
		{
			var confirm = _context.Requests.FirstOrDefault(s => s.RequestId == requestid).ConfirmationNumber;
			return confirm;
		}

		public void Agree(int id)
		{
			var request = _context.Requests.FirstOrDefault(s => s.RequestId == id);

			if (request != null)
			{
				request.Status = 4;
				request.ModifiedDate = DateTime.Now;

				_context.Update(request);
				_context.SaveChanges();

				RequestStatusLog requestStatusLog = new RequestStatusLog();
				requestStatusLog.RequestId = id;
				requestStatusLog.CreatedDate = DateTime.Now;
				requestStatusLog.Status = 4;
				_context.Add(requestStatusLog);
				_context.SaveChanges();

			}
		}

		public bool CancelAgreement(string Notes, int id)
		{
			var req = _context.Requests.FirstOrDefault(s => s.RequestId == id);
			if (req != null)
			{
				req.Status = 7;
				req.ModifiedDate = DateTime.Now;
				_context.Update(req);
				_context.SaveChanges();

				RequestStatusLog requestStatusLog = new RequestStatusLog();
				requestStatusLog.Notes = Notes;
				requestStatusLog.RequestId = id;
				requestStatusLog.CreatedDate = DateTime.Now;
				requestStatusLog.Status = 7;
				_context.Add(requestStatusLog);
				_context.SaveChanges();

				return true;

			}
			else
			{ return false; }
		}
	}
}
