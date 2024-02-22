using DAL.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL.Interface
{
    public interface IAdmin_DashBoard
    {
        public List<Admin_DashBoard> GetDashList(Admin_DashBoard admin_DashBoard);
    }
}
