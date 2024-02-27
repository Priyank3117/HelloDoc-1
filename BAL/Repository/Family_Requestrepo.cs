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
    public class Family_Requestrepo : IFamily_Request
    {

        private readonly ApplicationDbContext _context;

        public Family_Requestrepo(ApplicationDbContext context)
        {
            _context = context;
        }

        public void AddData(Other_Request req)
        {
            //other data will be added to the request
            Request request = new Request();

            request.Email = req.EmailOther;
            request.PhoneNumber = req.PhoneNumberother;
            request.FirstName = req.FirstNameOther;
            request.LastName = req.LastNameOther;
            request.RelationName = req.Relation;
            request.CreatedDate = DateTime.Now;
            request.RequestTypeId = 2;

            _context.Requests.Add(request);
            _context.SaveChanges();

            //patient data will be added to the request client
            RequestClient requestClient = new RequestClient();

            requestClient.RequestId = request.RequestId;
            requestClient.Email = req.Email_P;
            requestClient.FirstName = req.FirstName_P;
            requestClient.LastName = req.LastName_P;
            requestClient.PhoneNumber = req.PhoneNumber_P;
            requestClient.Street = req.Street;
            requestClient.City = req.City;
            requestClient.State = req.State;
            requestClient.ZipCode = req.Zipcode;
            requestClient.StrMonth = req.BirthDate_P.Month.ToString();
            requestClient.IntYear = req.BirthDate_P.Year;
            requestClient.IntDate = req.BirthDate_P.Day;

            _context.RequestClients.Add(requestClient);
            _context.SaveChanges();
            
           
        }
    }
}
