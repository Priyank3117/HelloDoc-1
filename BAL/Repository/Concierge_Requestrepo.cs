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
    public class Concierge_Requestrepo : IOther_Request
    {
        private readonly ApplicationDbContext _context;

        public Concierge_Requestrepo(ApplicationDbContext context)
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

            _context.Requests.Add(request);
            _context.SaveChanges();
        }
    }
}
