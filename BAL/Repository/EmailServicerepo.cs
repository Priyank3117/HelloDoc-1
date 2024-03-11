using BAL.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace BAL.Repository
{
    public class EmailServicerepo : IEmailService
    {
        public void SendEmail(string email, string subject, string message, List<Attachment> attachments = null)
        {

            SmtpClient smtpClient = new("smtp.office365.com")
            {
                Port = 587,
                Credentials = new NetworkCredential("tatva.dotnet.priyankpatel@outlook.com", "Priyank@94095"),
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false
            };

            // Create the MailMessage object
            MailMessage mail = new MailMessage("tatva.dotnet.priyankpatel@outlook.com", email, subject, message);
            mail.IsBodyHtml = true;
            attachments?.ForEach(attachment => mail.Attachments.Add(attachment));

            try
            {
           
                smtpClient.Send(mail);
                Console.WriteLine("Email sent successfully!");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error sending email: {ex.Message}");
            }
        }
    }
    
}

