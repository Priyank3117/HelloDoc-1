using BAL.Interface;
using DAL.DataContext;
using DAL.DataModels;
using DAL.ViewModels;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL.Repository
{
    public class Patient_Requestrepo : IPatient_Request
    {
        private readonly ApplicationDbContext _context;

        public Patient_Requestrepo(ApplicationDbContext context)
        {
                   _context = context;
        }

        public void AddPatient(Patient patient)
        {
            AspNetUser aspnetUser = new AspNetUser();
            User user = new User();
            Request request = new Request();

            //Status shows that user is Exists or not
            var status = _context.Users.FirstOrDefault(User => User.Email == patient.Email);

            RequestClient request_c = new RequestClient();
            var username = aspnetUser.UserName = patient.FirstName + ' ' + patient.LastName;


            if (patient != null && status == null && patient.PasswordHash == patient.Confirmpassword)
            {
                Guid id = Guid.NewGuid();
                aspnetUser.AspNetUserId = id.ToString(); ;
                aspnetUser.UserName = username;
                aspnetUser.Email = patient.Email;
                aspnetUser.PasswordHash = patient.PasswordHash;
                aspnetUser.PhoneNumber = patient.PhoneNumber;
                aspnetUser.CreatedDate = DateTime.Now;

                _context.AspNetUsers.Add(aspnetUser);
                _context.SaveChanges();

                user.AspNetUserId = aspnetUser.AspNetUserId;
                user.FirstName = patient.FirstName;
                user.LastName = patient.LastName;
                user.Email = patient.Email;
                user.Mobile = patient.PhoneNumber;
                user.CreatedDate = DateTime.Now;
                user.Street = patient.Street;
                user.City = patient.City;
                user.State = patient.State;
                user.ZipCode = patient.ZipCode;
                user.CreatedBy = patient.FirstName;
                user.CreatedDate = DateTime.Now;


                _context.Users.Add(user);
                _context.SaveChanges();

                request.UserId = user.UserId;
                request.FirstName = patient.FirstName;
                request.LastName = patient.LastName;
                request.Email = patient.Email;
                request.PhoneNumber = patient.PhoneNumber;
                request.CreatedDate = DateTime.Now;

                _context.Requests.Add(request);
                _context.SaveChanges();


                request_c.RequestId = request.RequestId;
                request_c.FirstName = patient.FirstName;
                request_c.LastName = patient.LastName;
                request_c.Email = patient.Email;
                request_c.PhoneNumber = patient.PhoneNumber;
                request_c.Street = patient.Street;
                request_c.City = patient.City;
                request_c.State = patient.State;
                request_c.ZipCode = patient.ZipCode;




                _context.RequestClients.Add(request_c);
                _context.SaveChanges();

            }
            else if (patient.PasswordHash == patient.Confirmpassword)
            {

                request.UserId = status.UserId;
                request.FirstName = patient.FirstName;
                request.LastName = patient.LastName;
                request.Email = patient.Email;
                request.PhoneNumber = patient.PhoneNumber;
                request.CreatedDate = DateTime.Now;

                _context.Requests.Add(request);
                _context.SaveChanges();


                request_c.RequestId = request.RequestId;
                request_c.FirstName = patient.FirstName;
                request_c.LastName = patient.LastName;
                request_c.Email = patient.Email;
                request_c.PhoneNumber = patient.PhoneNumber;
                request_c.Street = patient.Street;
                request_c.City = patient.City;
                request_c.State = patient.State;
                request_c.ZipCode = patient.ZipCode;




                _context.RequestClients.Add(request_c);
                _context.SaveChanges();

            }
        }
    }
}
