﻿using DAL.DataModels;
using DAL.ViewModel;
using Microsoft.AspNetCore.Http;

namespace BAL.Interface
{
    public interface IAdminDashBoard
    {


       
        public Admin GetAdminByEmail(string email);

        public AspNetUser GetAspNetUserByEmail(string email);

        public List<Admin_DashBoard> GetRequestData(string SearchValue, string Filterselect, 
            string selectvalue, string partialName, int[] currentstatus);

        public List<Admin_DashBoard> GetRequestDataPhy(string SearchValue, string Filterselect,
           string selectvalue, string partialName, int[] currentstatus, int phyId);
        public IQueryable<Admin_DashBoard> getregionwise();

        public int CountByStatus(int[] status);

        public IQueryable<Admin_DashBoard> GetList();

        public ViewNotes GetViewNotes(int id);

       

        public AdminProfile GetAdminData(string Email);

        public void AdministratorInformation(AdminProfile adminProfile,string Email, List<string> states);   
        public void MailingBillingInformation(AdminProfile adminProfile,string Email);

        public void AccountInformation(string password,string Email);

        public void AddCreateRequest(CreateRequest createRequest, string Email, string SelectedStateId,bool isAdmin);

        public GetCount GetCount();

        public List<Provider> providers(string Region);
        public PhysicianProfile PhysicianProfile(int id);

       
        public void UpdateProviderProfile(int id, string businessName, string businessWebsite, IFormFile signatureFile, IFormFile photoFile);

        public bool UploadDocumetnsProvider(string fileName, IFormFile File, int physicianid);
      
        public List<Physician> GetPhysiciansByRegionId(string regionId);
        public List<Physician> GetPhysiciansByRegionIdForTransfer(string regionId,string reqid);


		public List<RequestWiseFile> GetRequestWiseFilesWithoutDelete(int id);

        public List<PhysicianLocation> GetLocationsList();
        public string GetPhyEmail(string id);
        public string GetAdminEmailById(int id);
        public List<PayRate> GetPayrates(int physicianId);
        public bool UpdatePayrate(int payrateId, decimal payrateValue, string? email);

        public void CreatePayrate(decimal payrateValue, string? email, int physicianId, int payrateCategoryId);

    }
}
