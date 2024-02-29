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
        public List<Admin_DashBoard> GetRequestData(string SearchValue, string Filterselect, string selectvalue, string partialName, int[] currentstatus);  
        public IQueryable<Admin_DashBoard> getregionwise();

        public IQueryable<Admin_DashBoard> GetList();

        public IQueryable<ViewNotes> GetViewNotes(int id);

       
    }
}
