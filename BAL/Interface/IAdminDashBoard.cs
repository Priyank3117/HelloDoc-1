using DAL.DataModels;
using DAL.ViewModel;
using DAL.ViewModels;
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

        public int CountByStatus(int[] status);

        public IQueryable<Admin_DashBoard> GetList();

        public IQueryable<ViewNotes> GetViewNotes(int id);

        public ViewCase ViewCase(int id, int status);

        public bool CancelCase(int Requestid, string Reason, string Notes);

        public void AssignCase(int req, string Description, string phyid);

        public void TransferCase(int transferid, string Descriptionoftra, string phyidtra);

        public void BlockCase(int blocknameid, string blocknotes);

        public void ClearCase(int clearcaseid);

        public void SendOrder(SendOrder sendOrder);

        public CloseCase CloseCase(int requestid);

        public void CloseCasePost(CloseCase closeCase, int id);

        public Encounter EncounterForm(int id);

        public void EncounterPost(int id, Encounter enc);

        public bool CloseInstance(int reqid);

        public AdminProfile GetAdminData(string Email);

        public void AdministratorInformation(AdminProfile adminProfile,string Email, List<string> states);   
        public void MailingBillingInformation(AdminProfile adminProfile,string Email);

        public void AccountInformation(string password,string Email);

        public void AddCreateRequest(Patient patient, string Email, string SelectedStateId);
    }
}
