using BAL.Interface;
using DAL.DataContext;
using DAL.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL.Repository
{
    public class Admin_DashBoardrepo : IAdmin_DashBoard
    {

        private readonly ApplicationDbContext _context;

        public Admin_DashBoardrepo(ApplicationDbContext context)
        {
            _context = context;
        }
        

        public List<Admin_DashBoard> GetDashList(Admin_DashBoard admin_DashBoard)
        {
            throw new NotImplementedException();
        }
    }
}
