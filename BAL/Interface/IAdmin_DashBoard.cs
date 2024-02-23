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
        public IQueryable<Admin_DashBoard> GetRequestData();

        public Admin_DashBoard GetList();
    }
}
