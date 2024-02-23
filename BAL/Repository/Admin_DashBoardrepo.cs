using BAL.Interface;
using DAL.DataContext;
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
        

       
        public Admin_DashBoard GetList()
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
                                status = req.Status

                            });

                   return (Admin_DashBoard)DashData;
        }

        public IQueryable<Admin_DashBoard> GetRequestData()
        {
            var DashData = (from req in _context.Requests
                            join reqclient in _context.RequestClients
                             on req.RequestId equals reqclient.RequestId

                            select new Admin_DashBoard()
                            {
                                Name = reqclient.FirstName.ToLower(),
                                Requestor = req.FirstName,
                                BirthDate = (new DateTime((int)reqclient.IntYear, int.Parse(reqclient.StrMonth), (int)reqclient.IntDate)).ToString("MMM dd,yyyy"),
                                RequestedDate = req.CreatedDate,
                                PhoneNumber = req.PhoneNumber,
                                requesttypeid = req.RequestTypeId,
                                PhoneNumber_P = reqclient.PhoneNumber,
                                regionid = reqclient.RegionId,
                                Address = reqclient.Street + " " + reqclient.City + " " + reqclient.State + " " + reqclient.ZipCode,
                                status = req.Status

                            });

            return DashData;
        }
    }
}
