using AspNetCoreHero.ToastNotification.Abstractions;
using BAL.Interface;
using DAL.DataContext;
using DAL.DataModels;
using DAL.ViewModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using System.Collections;

namespace BAL.Repository
{
	public class AccountsAccess:IAccountsAccess
	{
		private readonly ApplicationDbContext _context;
		private readonly IPasswordHasher<AdminProfile> _passwordHasher;
		private readonly IUploadProvider _uploadprovider;
		private readonly INotyfService _notyf;


		public AccountsAccess(ApplicationDbContext context,
			IUploadProvider uploadprovider, IPasswordHasher<AdminProfile> passwordHasher,INotyfService notyf)
		{
			_context = context;
			_uploadprovider = uploadprovider;
			_passwordHasher = passwordHasher;
			_notyf = notyf;
		}

		public void CreateAccess(int[] rolemenu, string rolename, int accounttype)
		{
			Role role = new Role();
			role.Name = rolename;
			role.AccountType = (short)accounttype;
			role.CreatedBy = "admin";
			role.CreatedDate = DateTime.Now;
			role.IsDeleted = new BitArray(new[] { false });
			_context.Roles.Add(role);
			_context.SaveChanges();

			foreach (var menu in rolemenu)
			{
				RoleMenu rolemenu1 = new RoleMenu();
				rolemenu1.MenuId = menu;
				rolemenu1.RoleId = role.RoleId;
				_context.RoleMenus.Add(rolemenu1);
				_context.SaveChanges();
			}
		}

		public void CreateAdminAccountPost(AdminProfile profile, string[] regions)
		{
			AspNetUser aspnetUser = new AspNetUser();

			Guid id = Guid.NewGuid();
			aspnetUser.AspNetUserId = id.ToString();

			aspnetUser.UserName = profile.UserName;
			aspnetUser.Email = profile.Email;
			aspnetUser.PasswordHash = _passwordHasher.HashPassword(null, profile.Password);
			aspnetUser.PhoneNumber = profile.PhoneNumAspNetUsers;
			aspnetUser.CreatedDate = DateTime.Now;

			_context.AspNetUsers.Add(aspnetUser);
			_context.SaveChanges();

			Admin admin = new Admin();
			admin.AspNetUserId = aspnetUser.AspNetUserId;
			admin.FirstName = profile.FirstName;
			admin.LastName = profile.LastName;
			admin.Email = profile.Email;
			admin.Mobile = profile.PhoneNumAspNetUsers;
			admin.Address1 = profile.Address1;
			admin.Address2 = profile.Address2;
			admin.RegionId = profile.state;
			admin.City = profile.City;
			admin.Zip = profile.zip;
			admin.CreatedDate = DateTime.Now;
			admin.Status = 1;
			admin.CreatedBy = aspnetUser.AspNetUserId;
			admin.ModifiedBy = aspnetUser.AspNetUserId;


			_context.Admins.Add(admin);
			_context.SaveChanges();

			AspNetUserRole aspnetUserRole = new AspNetUserRole();
			aspnetUserRole.UserId = admin.AspNetUserId;
			aspnetUserRole.RoleId = "1";
			_context.AspNetUserRoles.Add(aspnetUserRole);
			_context.SaveChanges();


			if (regions != null)
			{
				foreach (var item in regions)
				{
					AdminRegion adminRegion = new AdminRegion();
					adminRegion.AdminId = admin.AdminId;
					adminRegion.RegionId = int.Parse(item);
					_context.Add(adminRegion);
					_context.SaveChanges();
				}
			}
		}

		public void CreateProviderAccountPost(CreateProviderAccount CreateProviderAccount, string[] regions)
		{
			AspNetUser aspnetUser = new AspNetUser();

			Guid id = Guid.NewGuid();
			aspnetUser.AspNetUserId = id.ToString();

			aspnetUser.UserName = CreateProviderAccount.Username;
			aspnetUser.Email = CreateProviderAccount.Email;
			aspnetUser.PasswordHash = _passwordHasher.HashPassword(null, CreateProviderAccount.Password);
			aspnetUser.PhoneNumber = CreateProviderAccount.Phone;
			aspnetUser.CreatedDate = DateTime.Now;

			_context.AspNetUsers.Add(aspnetUser);
			_context.SaveChanges();

			Physician physician = new Physician();
			physician.AspNetUserId = aspnetUser.AspNetUserId;
			physician.RoleId = 1;
			physician.FirstName = CreateProviderAccount.Firstname;
			physician.LastName = CreateProviderAccount.Lastname;
			physician.Email = CreateProviderAccount.Email;
			physician.Mobile = CreateProviderAccount.Phone;
			physician.MedicalLicense = CreateProviderAccount.MedLicense;
			physician.Npinumber = CreateProviderAccount.NPINum;
			physician.Address1 = CreateProviderAccount.Address1;
			physician.Address2 = CreateProviderAccount.Address2;
			physician.RegionId = int.Parse(CreateProviderAccount.State);
			physician.Zip = CreateProviderAccount.Zip;
			physician.BusinessName = CreateProviderAccount.BusinessName;
			physician.CreatedDate = DateTime.Now;
			physician.Status = 1;
			physician.BusinessWebsite = CreateProviderAccount.BusinessWebsite;
			_context.Physicians.Add(physician);
			_context.SaveChanges();

			AspNetUserRole aspnetUserRole = new AspNetUserRole();
			aspnetUserRole.UserId = physician.AspNetUserId;
			aspnetUserRole.RoleId = "3";
			_context.AspNetUserRoles.Add(aspnetUserRole);
			_context.SaveChanges();

			if (CreateProviderAccount.Photo != null)
			{
				_uploadprovider.UploadPhoto(CreateProviderAccount.Photo, physician.PhysicianId);
				physician.Photo = CreateProviderAccount.Photo.FileName;

			}
			if (CreateProviderAccount.ICA != null)
			{
				var docfile = _uploadprovider.UploadDocFile(CreateProviderAccount.ICA, physician.PhysicianId, "ICA");
				physician.IsAgreementDoc = new BitArray(new[] { true });
			}
			else
			{
				physician.IsAgreementDoc = new BitArray(new[] { false });
			}
			if (CreateProviderAccount.BackgroundCheck != null)
			{
				var docfile = _uploadprovider.UploadDocFile(CreateProviderAccount.BackgroundCheck, physician.PhysicianId, "Background");
				physician.IsBackgroundDoc = new BitArray(new[] { true });
			}
			else
			{
				physician.IsBackgroundDoc = new BitArray(new[] { false });
			}
			if (CreateProviderAccount.HIPAA != null)
			{
				var docfile = _uploadprovider.UploadDocFile(CreateProviderAccount.HIPAA, physician.PhysicianId, "Hippa");
				physician.IsTrainingDoc = new BitArray(new[] { true });
			}
			else
			{
				physician.IsTrainingDoc = new BitArray(new[] { false });
			}
			if (CreateProviderAccount.NonDisclosure != null)
			{
				var docfile = _uploadprovider.UploadDocFile(CreateProviderAccount.NonDisclosure, physician.PhysicianId, "NonDiscoluser");
				physician.IsNonDisclosureDoc = new BitArray(new[] { true });
			}
			else
			{
				physician.IsNonDisclosureDoc = new BitArray(new[] { false });
			}
			if (CreateProviderAccount.License != null)
			{
				var docfile = _uploadprovider.UploadDocFile(CreateProviderAccount.License, physician.PhysicianId, "License");
				physician.IsLicenseDoc = new BitArray(new[] { true });
			}
			else
			{
				physician.IsLicenseDoc = new BitArray(new[] { false });
			}
			_context.Physicians.Update(physician);
			_context.SaveChanges();

			PhysicianNotification physicianNotification = new PhysicianNotification();
			physicianNotification.PhysicianId = physician.PhysicianId;
			physicianNotification.IsNotificationStopped = new BitArray(new[] { true });
			_context.PhysicianNotifications.Add(physicianNotification);
			_context.SaveChanges();


			if (regions != null)
			{
				foreach (var item in regions)
				{
					PhysicianRegion physicianRegion = new PhysicianRegion();
					physicianRegion.PhysicianId = physician.PhysicianId;
					physicianRegion.RegionId = int.Parse(item);
					_context.Add(physicianRegion);
					_context.SaveChanges();
				}
			}
		}

		public void DeleteAccess(int id)
		{
			Role? role = _context.Roles.Where(item => item.RoleId == id).FirstOrDefault();
			if (role != null)
			{
				role.IsDeleted = new BitArray(new[] { true });
				_context.Roles.Update(role);
				_context.SaveChanges();
				_notyf.Success("Your Role Has Been Deleted");
			}
			else
			{
				_notyf.Success("Your Role Has Been Not Deleted");
			}
		}

		public void EditAccess(int id, int[] rolemenu, string rolename, int accounttype)
		{
			var role = _context.Roles.FirstOrDefault(item => item.RoleId == id);
			var menulist = _context.RoleMenus.Where(item => item.RoleId == id).ToList();
			role.Name = rolename;
			role.AccountType = (short)accounttype;
			_context.Roles.Update(role);
			_context.SaveChanges();
			_context.RoleMenus.RemoveRange(menulist);
			_context.SaveChanges();
			foreach (var item in rolemenu)
			{
				RoleMenu rolemenu1 = new RoleMenu();
				rolemenu1.MenuId = item;
				rolemenu1.RoleId = id;
				_context.RoleMenus.Add(rolemenu1);
			}
			_context.SaveChanges();
		}

		public List<UserAccess> GetUserAccessData(int role)
		{
			var result = (from aspnetuser in _context.AspNetUsers
						  join aspnetuserrole in _context.AspNetUserRoles
						  on aspnetuser.AspNetUserId equals aspnetuserrole.UserId
						  join aspnetrole in _context.AspNetRoles
						  on aspnetuserrole.RoleId equals aspnetrole.AspNetRoleId
						  join admin in _context.Admins
						  on aspnetuser.AspNetUserId equals admin.AspNetUserId into admins
						  from totaladmins in admins.DefaultIfEmpty()
						  join phy in _context.Physicians
						  on aspnetuser.AspNetUserId equals phy.AspNetUserId into phyusers
						  from totaluser in phyusers.DefaultIfEmpty()
						  
						  where ((role == 0 || aspnetuserrole.RoleId == role.ToString()) && aspnetuserrole.RoleId != "2")
						  select (aspnetuserrole.RoleId == "1" ? new UserAccess()
						  {
							  AccountType = aspnetrole.Name,
							  AccountPOC = aspnetuser.UserName,
							  phonenum = totaladmins.Mobile,
							  status = totaladmins.AdminId,
							  roleid = role,
					
                              Email = aspnetuser.Email,
							  AccountTypeid = int.Parse(aspnetuserrole.RoleId),
							  useraccessid = totaladmins.AdminId,
						  } : new UserAccess()
						  {
							  AccountType = aspnetrole.Name,
							  AccountPOC = aspnetuser.UserName,
							  phonenum = totaluser.Mobile,
							  status = totaluser.Status,
							  roleid = role,
                              AccountTypeid = int.Parse(aspnetuserrole.RoleId),
                              Email = totaluser.Email,
                              useraccessid = totaluser.PhysicianId
						  }

						  )).ToList();

			return result;
		}

		public void MailingBillingInformationProvider(int physicianid, string MobileNo, string Address1, string Address2, string City, int State, string Zipcode)
		{
			Physician? physician = _context.Physicians.FirstOrDefault(item => item.PhysicianId == physicianid);
			if (physician != null)
			{
				physician.Address1 = Address1;
				physician.Address2 = Address2;
				physician.City = City;
				physician.Mobile = MobileNo;
				physician.RegionId = State;
				physician.Zip = Zipcode;
				_context.Physicians.Update(physician);
				_context.SaveChanges();
				_notyf.Success("Data Saved Successfully");
			}
			else
			{
				_notyf.Error("Data Can not be added");

			}
		}

		public void NotificationManagement(bool isChecked, string id)
		{
			var physicianNotification = _context.PhysicianNotifications.Where(u => u.PhysicianId == int.Parse(id)).FirstOrDefault();
			if (physicianNotification != null)
			{
				physicianNotification.IsNotificationStopped = new BitArray(new[] { isChecked });

				_context.PhysicianNotifications.Update(physicianNotification);
				_context.SaveChanges();
			}
		}

		public void PhysicianInformation(int id, string MobileNo, string[] Region, string SynchronizationEmail, string NPINumber, string MedicalLicense)
		{
			Physician? physician = _context.Physicians.FirstOrDefault(item => item.PhysicianId == id);

			AspNetUser? account = _context.AspNetUsers.FirstOrDefault(item => item.Email == physician.Email);
			if (physician != null)
			{
				physician.Mobile = MobileNo;
				physician.Npinumber = NPINumber;
				physician.MedicalLicense = MedicalLicense;
				physician.SyncEmailAddress = SynchronizationEmail;
				_context.Physicians.Update(physician);
				_context.SaveChanges();


				List<PhysicianRegion> region = _context.PhysicianRegions.
					Where(item => item.PhysicianId == physician.PhysicianId).ToList();

				_context.PhysicianRegions.RemoveRange(region);
				_context.SaveChanges();

				foreach (var item in Region)
				{
					PhysicianRegion physicianRegion = new PhysicianRegion();
					physicianRegion.PhysicianId = id;
					physicianRegion.RegionId = int.Parse(item);
					_context.Add(physicianRegion);
					_context.SaveChanges();
				}

				_notyf.Success("Data Saved Successfully");

			}
			else
			{
				_notyf.Error("Data Can not be added");
			}
		}

		public void ResetPhysicianPassword(string Password, int physicianid)
		{
			Physician? physician = _context.Physicians.FirstOrDefault(item => item.PhysicianId == physicianid);
			AspNetUser? account = _context.AspNetUsers.FirstOrDefault(item => item.Email == physician.Email);
			if (account != null && Password != null)
			{
				string passwordhash = _passwordHasher.HashPassword(null, Password);
				account.PasswordHash = passwordhash;
				_context.AspNetUsers.Update(account);
				_context.SaveChanges();
				_notyf.Success("Password Changed Successfully");
			}
			else
			{
				_notyf.Error("Please Enter the Password");
			}

		}

		public void SaveSignatureImage(IFormFile signatureImage, int id)
		{
			string fileName = _uploadprovider.UploadSignature(signatureImage, id);
			var physician = _context.Physicians.FirstOrDefault(item => item.PhysicianId == id);
			physician.Signature = fileName;
			_context.Physicians.Update(physician);
			_context.SaveChanges();
		}
	}
}
