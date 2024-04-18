using DAL.ViewModel;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL.Interface
{
	public interface IAccountsAccess
	{
		public void CreateProviderAccountPost(CreateProviderAccount CreateProviderAccount, string[] regions);
		public void CreateAdminAccountPost(AdminProfile profile, string[] regions);

		public void ResetPhysicianPassword(string Password, int physicianid);
		//accesses
		public List<UserAccess> GetUserAccessData(int role);
		public void CreateAccess(int[] rolemenu, string rolename, int accounttype);

		public void EditAccess(int id, int[] rolemenu, string rolename, int accounttype);

		public void DeleteAccess(int id);

		public void SaveSignatureImage(IFormFile signatureImage, int id);

		public void MailingBillingInformationProvider(int physicianid, string MobileNo, string Address1, string Address2, string City, int State, string Zipcode);

		public void NotificationManagement(bool isChecked, string id);
		public void PhysicianInformation(int id, string MobileNo, string[] Region, string SynchronizationEmail, string NPINumber, string MedicalLicense);
	}
}
