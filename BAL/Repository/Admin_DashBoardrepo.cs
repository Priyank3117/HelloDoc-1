using BAL.Interface;
using DAL.DataContext;
using DAL.DataModels;
using DAL.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL.Repository
{
    public class Admin_DashBoardrepo : IAdmin_DashBoard
    {

        private readonly ApplicationDbContext _context;

        public Admin_DashBoardrepo(ApplicationDbContext context)
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
                                PhoneNumber = req.PhoneNumber,
                                requesttypeid = req.RequestTypeId,
                                PhoneNumber_P = reqclient.PhoneNumber,
                                regionid = reqclient.RegionId,
                                Address = reqclient.Street + " " + reqclient.City + " " + reqclient.State + " " + reqclient.ZipCode,
                                status = req.Status,
                                requestid = reqclient.RequestId,
                                cases = _context.CaseTags.ToList()


                            }) ;

            return DashData;
        }

        public List<Admin_DashBoard> GetRequestData(string SearchValue, string Filterselect, string selectvalue, string partialName, int[] currentstatus)
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
    }
}



//join region in _context.Regions on reqclient.RegionId equals region.RegionId