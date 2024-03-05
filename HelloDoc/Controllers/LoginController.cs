﻿using BAL.Interface;
using DAL.DataContext;
using DAL.ViewModel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HelloDoc.Controllers
{
   
    public class LoginController : Controller
    {
        private readonly ApplicationDbContext _context;
     
        private readonly IEmailService _emailService;
        public LoginController(ApplicationDbContext context, IEmailService emailService)
        {
            _context = context;
            _emailService = emailService;
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
            var pwd = _context.AspNetUsers.FirstOrDefault(m => m.PasswordHash == patient.PasswordHash);



            if (ModelState.IsValid)
            {

                if (Email != null && Email.PasswordHash == patient.PasswordHash )
                {
                    HttpContext.Session.SetString("Email",patient.Email);
                    return RedirectToAction("Index", "DashBoard");

                } 
            }
            return View(patient);
        }

        public IActionResult Logout() 
        { 
            HttpContext.Session.Remove("Email");
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
