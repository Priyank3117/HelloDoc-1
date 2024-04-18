using DAL.DataModels;
using DAL.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL.Interface
{
	public interface IDashBoard
	{
		public User GetUser(string Email);

		public List<Patient_Dash> GetPatientData(string Email);

		public void Patient_Profile(Patient_Profile patient_Profile,string email);

		public List<RequestWiseFile> GetRequestWiseFiles(int requestid);

		public string ConfirmationNumber(int requestid);

		public void Agree(int id);
		public bool CancelAgreement(string Notes, int id);
	}
}
