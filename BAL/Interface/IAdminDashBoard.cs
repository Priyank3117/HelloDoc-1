﻿using DAL.ViewModel;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL.Interface
{
    public interface IAdminDashBoard
    {
        public List<Admin_DashBoard> GetRequestData(string SearchValue, string Filterselect, 
            string selectvalue, string partialName, int[] currentstatus);  
        public IQueryable<Admin_DashBoard> getregionwise();

        public IQueryable<Admin_DashBoard> GetList();

        public IQueryable<ViewNotes> GetViewNotes(int id);

        public ViewCase ViewCase(int id, int status);

        public bool CancelCase(int Requestid, string Reason, string Notes);



    }
}
