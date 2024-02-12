using BAL.Interface;
using DAL.DataContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL.Repository
{
    public class Business_Requestrepo : IBusiness_Request
    {
        private readonly ApplicationDbContext _context;

        public Business_Requestrepo(ApplicationDbContext context)
        {
            _context = context;
        }
        public void addbusinessdata()
        {
            
        }
    }
}
