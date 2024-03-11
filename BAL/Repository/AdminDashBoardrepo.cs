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


                            });

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
                                requestid = reqclient.RequestId


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
                                requestid = reqclient.RequestId

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
    }
}



//join region in _context.Regions on reqclient.RegionId equals region.RegionId