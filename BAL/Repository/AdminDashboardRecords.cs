﻿using BAL.Interface;
using DAL.DataContext;
using DAL.ViewModel;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL.Repository
{     
    public class AdminDashboardRecords : IAdminDashboardRecords
    {
        private readonly ApplicationDbContext _context;
        public AdminDashboardRecords(ApplicationDbContext context)  
        { 
            _context = context;
        }

        public List<BlockHistory> BlockedPatientRecords(string email, string name, string phone, DateTime date)
        {
            var list = (from br in _context.BlockRequests
                        join r in _context.Requests on br.RequestId equals r.RequestId.ToString()
                        join rc in _context.RequestClients on r.RequestId equals rc.RequestId
                        select new BlockHistory
                        {
                            BlockedRequestID = br.BlockRequestId,
                            RequestId = r.RequestId,
                            PatientName = rc.FirstName + " " + rc.LastName,
                            CreatedDate = br.CreatedDate,
                            PhoneNumber = br.PhoneNumber,
                            Email = br.Email,
                            Notes = "Notes",
                            IsActive = br.IsActive[0]
                        }).Where(item =>
       (string.IsNullOrEmpty(email) || item.Email.Contains(email)) &&
       (string.IsNullOrEmpty(name) || item.PatientName.ToLower().Contains(name.ToLower()) &&
        (string.IsNullOrEmpty(phone) || item.PatientName.Contains(phone)))).ToList();

            return list;
        }

        public List<PatientHistory> ExploreRecords(int userid)
        {
            var records = (from requestClient in _context.RequestClients
                           join encounterForm in _context.EncounterForms
                           on requestClient.RequestId equals encounterForm.RequestId
                           into Records
                           from allPatient in Records.DefaultIfEmpty()
                           where requestClient.Request.UserId == userid
                           select new PatientHistory
                           {
                               ClientName = requestClient.Request.FirstName,
                               CreatedDate = requestClient.Request.CreatedDate,
                               ConfirmationNumber = requestClient.Request.ConfirmationNumber,
                               ProvideName = requestClient.Request.Physician.FirstName,
                               Status = requestClient.Request.Status,
                               IsFinalize = allPatient.IsFinalize,
                               RequestId = requestClient.Request.RequestId,
                               RequestClientId = requestClient.RequestClientId
                           }).ToList();
            return records;
        }

        public List<SearchRecords> SearchRecords(int[] status, string patientName, string providername, string PhoneNum, string email, string requesttype, int pagesize, int currentpage)
        {

            var record = (from request in _context.Requests
                          join requestclient in _context.RequestClients
                          on request.RequestId equals requestclient.RequestId
                          join physician in _context.Physicians
                          on request.PhysicianId equals physician.PhysicianId into physicians
                          from allphysician in physicians.DefaultIfEmpty()
                          select new
                          {
                              Request = request,
                              RequestClient = requestclient,
                              Physician = allphysician,
                              // RequestNote = rn
                          }).ToList();

            var searchRecords = record.Select(item => new SearchRecords
            {
                PatientName = $"{item.RequestClient.FirstName} {item.RequestClient.LastName}",
                Requestor = $"{item.Request.FirstName} {item.Request.LastName}",
                // DateOfService = GetDateofService(item.Request.Requestid),
                //ServiceDate = GetDateofService(item.Request.Requestid)?.ToString("MMMM dd, yyyy") ?? "",
                //DateofClose = GetCloseDate(item.Request.Requestid)?.ToString("MMMM dd, yyyy") ?? "",
                //CloseDate = GetCloseDate(item.Request.Requestid),
                Email = item.RequestClient.Email,
                PhoneNumber = item.RequestClient.PhoneNumber,
                Address = item.RequestClient.Location,
                Zip = item.RequestClient.ZipCode,
                RequestStatus = item.Request.Status,
                PhysicianName = item.Physician != null ? $"{item.Physician.FirstName} {item.Physician.LastName}" : "",
                //PhysicianNote = item.RequestNote?.Physiciannotes,
                //CancelledByProvidor = GetPatientCancellationNotes(item.Request.Requestid),
                PatientNote = item.RequestClient.Notes,
                RequestTypeId = item.Request.RequestTypeId,
                //AdminNotes = item.RequestNote?.Adminnotes,
                RequestId = item.Request.RequestId,
                IsDelted = item.Request.IsDeleted[0]
            }).Where(item =>
       (string.IsNullOrEmpty(email) || item.Email.Contains(email)) &&
       (string.IsNullOrEmpty(PhoneNum) || item.PhoneNumber.Contains(PhoneNum)) &&
       (string.IsNullOrEmpty(patientName) || item.PatientName.ToLower().Contains(patientName.ToLower())) &&
       (string.IsNullOrEmpty(providername) || item.PhysicianName.ToLower().Contains(providername.ToLower())) &&
       (status.Length == 0 || status.Contains(item.RequestStatus)) && item.IsDelted == false &&
       (requesttype == "0" || item.RequestTypeId == int.Parse(requesttype))).ToList();

            return searchRecords;
        }

       
    }
}
