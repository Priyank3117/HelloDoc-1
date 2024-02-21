using BAL.Interface;
using DAL.DataContext;
using DAL.ViewModel;
using Microsoft.AspNetCore.Mvc;

namespace HelloDoc.Controllers
{
    public class Admin_DashController : Controller
    {


        private readonly ApplicationDbContext _context;
      

        public Admin_DashController(ApplicationDbContext context)
        {
            _context = context;

        }
        public IActionResult Admin_Dash()
        {
             var DashData = (from req in _context.Requests join reqclient in _context.RequestClients
                            on req.RequestId equals reqclient.RequestId

                            select new Admin_DashBoard()
                            {
                                  Name = reqclient.FirstName,
                                  Requestor = req.FirstName,
                                   BirthDate =(new DateTime((int)reqclient.IntYear,int.Parse(reqclient.StrMonth),(int)reqclient.IntDate)).ToString("MMM dd,yyyy"),
                                  RequestedDate = req.CreatedDate,
                                  PhoneNumber = req.PhoneNumber,
                                  requesttypeid = req.RequestTypeId,
                                  Address = reqclient.Street + " " + reqclient.City
                                  
                            }).ToList();

            return View(DashData);
        }  
       public IActionResult AdminDash(string partialName)
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
                                Address = reqclient.Street + " " + reqclient.City

                            }).ToList();

            return PartialView(partialName,DashData);

        }
    }
}
