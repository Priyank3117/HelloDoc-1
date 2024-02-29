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
    public class Business_Requestrepo : IBusiness_Request
    {
        private readonly ApplicationDbContext _context;

        public Business_Requestrepo(ApplicationDbContext context)
        {
            _context = context;
        }
        public void addbusinessdata(Other_Request req)
        {
            var request = new Request();
            var requestClient = new RequestClient();
            var Business = new Business();

            request.FirstName = req.FirstNameOther;
            request.LastName = req.LastNameOther;
            request.PhoneNumber = req.PhoneNumberother;
            request.Email = req.EmailOther;
            request.CreatedDate = DateTime.Now;
            request.RequestTypeId = 4;

            _context.Requests.Add(request);
            _context.SaveChanges();

            var users = _context.Users.FirstOrDefault(x => x.Email == request.Email);

            requestClient.RequestId = request.RequestId;
            requestClient.FirstName = req.FirstName_P;
            requestClient.LastName = req.LastName_P;
            requestClient.Email = req.Email_P;
            requestClient.PhoneNumber = req.PhoneNumber_P;
            requestClient.StrMonth = req.BirthDate_P.Month.ToString();
            requestClient.IntYear = req.BirthDate_P.Year;
            requestClient.IntDate = req.BirthDate_P.Day;
            requestClient.Street = req.Street;
            requestClient.City = req.City;
            requestClient.State = req.State;
            requestClient.ZipCode = req.Zipcode;

            if (users != null)
            {
                requestClient.RegionId = users.RegionId;
            }
            _context.RequestClients.Add(requestClient);
            _context.SaveChanges();

            var region = _context.Regions.FirstOrDefault(x => x.RegionId == requestClient.RegionId);
            var count = _context.Requests.Where(x => x.CreatedDate.Date == request.CreatedDate.Date).Count();

            if (region != null)
            {
                var confirmationnum = region.Abbreviation.ToUpper() + request.CreatedDate.ToString("ddMMyy") +
                    requestClient.LastName.Substring(0, 2).ToUpper() + requestClient.FirstName.Substring(0, 2).ToUpper() + count.ToString("D4");
                request.ConfirmationNumber = confirmationnum;
            }
            else
            {
                var confirmationnum = "AB" + request.CreatedDate.ToString("ddMMyy") +
                    requestClient.LastName.Substring(0, 2).ToUpper() + requestClient.FirstName.Substring(0, 2).ToUpper() + count.ToString("D4");
                request.ConfirmationNumber = confirmationnum;
            }


            _context.Update(request);
            _context.SaveChanges();



            Business.Name = req.BusinessName;
            Business.Address1 = req.Street + req.City;
            Business.Address2 = req.State + req.Zipcode;
            Business.CreatedDate = DateTime.Now;


            _context.Businesses.Add(Business);
            _context.SaveChanges();


            RequestBusiness requestBusiness = new()
            {
                RequestId = request.RequestId,
                BusinessId = Business.BusinessId,
            };

            _context.RequestBusinesses.Add(requestBusiness);
            _context.SaveChanges();
        }

       
    }
}
