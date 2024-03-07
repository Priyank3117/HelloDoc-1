using BAL.Interface;
using DAL.DataContext;
using DAL.ViewModel;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HelloDoc.Controllers
{
   
    public class LoginController : Controller
    {


        private readonly ApplicationDbContext _context;
     
        private readonly IEmailService _emailService;
        private readonly IPasswordHasher<Patient_login> _passwordHasher;
        private readonly IJwtService _jwtService;
        public LoginController(ApplicationDbContext context, IEmailService emailService,IPasswordHasher<Patient_login> passwordHasher, IJwtService jwtService)
        {
            _context = context;
            _emailService = emailService;
            _passwordHasher = passwordHasher;
            _jwtService = jwtService;   
        }
        public IActionResult Patient_login()

        {
            return View();
        }

       

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Patient_login(Patient_login patient)
            {
           
            var Email = _context.AspNetUsers.FirstOrDefault(m => m.Email == patient.Email);
            var result = _passwordHasher.VerifyHashedPassword(null, Email.PasswordHash, patient.PasswordHash);
            bool verifiedpassword = result == PasswordVerificationResult.Success;
            var user = _context.AspNetUserRoles.FirstOrDefault(i => i.UserId == Email.AspNetUserId);
            var role = _context.AspNetRoles.FirstOrDefault(k => k.AspNetRoleId == user.RoleId).Name.Trim();


            if (ModelState.IsValid)
            {

                if (Email != null && verifiedpassword)
                {

                    HttpContext.Session.SetString("Email",patient.Email);
                    HttpContext.Session.SetString("Role", role);
                    var jwt = _jwtService.Generatetoken(patient.Email, role);
                    Response.Cookies.Append("jwt", jwt);
                     if(role == "Patient")
                    {
                        return RedirectToAction("Index", "DashBoard");
                    }
                    else if(role == "Admin")
                    {
                        return RedirectToAction("AdminDash", "AdminDash");
                    }
                } 
            }
            return View(patient);
        }

        public IActionResult Logout() 
            { 
            HttpContext.Session.Clear();
            Response.Cookies.Delete("jwt");
            return RedirectToAction("Patient_login");
        }

        public IActionResult Patient_ResetPassword()

        {
            return View();
        }


        //--------------------------------------    
        [HttpPost]
           public IActionResult Patient_ResetPassword(Patient_ResetPassword patient_ResetPassword)

        {
            var mail = patient_ResetPassword.Email;

            if (ModelState.IsValid) {
                _emailService.SendEmail(mail, "hello123", "hello");
            }


            return View();
        }



        //--------------------------------------
    }

    
}
