

using System.Net.Mail;

namespace BAL.Interface
{
    public interface IEmailService
    {
        public void SendEmail(string email, string subject, string message, List<Attachment> attachments = null);
    }
}
