﻿using BAL.Interface;
using DAL.DataContext;
using DAL.ViewModel;

namespace BAL.Repository
{

    public class ProviderDashBoard : IProviderDashBoard
    {

        private readonly ApplicationDbContext _context;

        public ProviderDashBoard(ApplicationDbContext context)
            {
            _context = context;
        }
        public GetCount GetCount(int phyId)
        {
            var newcount = (_context.Requests.Where(item => item.Status == 1 && item.PhysicianId == phyId)).Count();
            var pendingcount = (_context.Requests.Where(item => item.Status == 2 && item.PhysicianId == phyId)).Count();
            var activecount = (_context.Requests.Where(item => (item.Status == 4 || item.Status == 5) && item.PhysicianId == phyId)).Count();
            var conclude = (_context.Requests.Where(item => item.Status == 6)).Count();
            var toclosed = (_context.Requests.Where(item => item.Status == 3 || item.Status == 7 || item.Status == 8)).Count();
            var unpaid = (_context.Requests.Where(item => item.Status == 9)).Count();

            return new GetCount
            {
                NewCount = newcount,
                PendingCount = pendingcount,
                ActiveCount = activecount,
                Conclude = conclude,
              
            };
        }
    }
}
