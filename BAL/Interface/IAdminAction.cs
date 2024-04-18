using DAL.DataModels;
using DAL.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL.Interface
{
    public interface IAdminAction
    {
        public void AssignCase(int req, string Description, string phyid);
        public void BlockCase(int blocknameid, string blocknotes);
        public bool CancelCase(int Requestid, string Reason, string Notes);
        public void ClearCase(int clearcaseid);
        public CloseCase CloseCase(int requestid);
        public void CloseCasePost(CloseCase closeCase, int id);
        public bool CloseInstance(int reqid);

        public void DeleteFile(string name);
        public Encounter EncounterForm(int id);
        public void EncounterPost(int id, Encounter enc);
        public IQueryable<Admin_DashBoard> GetRequests(int[] status);
        public void SendOrder(SendOrder sendOrder);
        public void TransferCase(int transferid, string Descriptionoftra, string phyidtra);
        public ViewCase ViewCase(int id, int status);


        //actions to get Data using ids
        public Request GetByRequestId(int id);
        public List<HealthProfessional> GetHealthProfessionalByProfessionId(string ProfessionId);
         public HealthProfessional GetHealthProfessionalByVendorId(string VendorId);

        public List<Region> GetRegionsList();

        public List<Menu> GetMenusByRole(int role);
        public List<RoleMenu> GetRoleMenusByRoleId(int roleid);

        public Role GetRoleByRoleId(int roleid);    
        public List<Role> GetRolesList();

        public List<HealthProfessionalType> GetHealthProfessionalTypeList();
        

        public HealthProfessional GetVendor(int id);

        //actions of scheduings
        #region Scheduling methods
        public List<Scheduling> GetEvents(int region);

        public void CreateShift(Scheduling model,string email,int physicianId);

        public List<Physician> GetPhysicianShiftList(int region);

        public List<ShiftDetailModel> GetShifts(int region);

        public void ApprovedSelectedShift(string[] checkedValues);
        public void DeleteSelectedShift(string[] checkedValues);

        public ShiftDetail ShiftDetail(int shiftDetailId);

        public void ChangeShift(int shiftDetailId, DateTime startDate, TimeOnly startTime, TimeOnly endTime, int region);

        public void ReturnShift(int shiftDetailId, int region);

		public void DeleteShift(int shiftDetailId, int region);


		public List<Physician> OnDuty(string region);
        public List<Physician> OffDuty(string region);
        #endregion

        //Partner 
        #region Partner

        public List<BusinessModel> GetBusinessInfo(string Profession, string searchValue);

        public void AddBusiness(AddBusiness addBusiness);

        public AddBusiness EditBusinessData(int id);

        public void EditBusinessPost(AddBusiness addBusiness, int id);

        public void DeleteBusinessData(int vendorid);
		#endregion
	}
}
