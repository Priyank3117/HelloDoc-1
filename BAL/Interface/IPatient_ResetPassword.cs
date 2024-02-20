using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL.Interface
{
    public interface IPatient_ResetPassword
    {
        public void SendEmail(string to,string subject, string body);
    }
}
