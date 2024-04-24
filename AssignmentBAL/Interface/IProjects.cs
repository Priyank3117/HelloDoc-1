using AssignmentDAL.DataModels;
using AssignmentDAL.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssignmentBAL.Interface
{
    public interface IProjects
    {
        public List<Domain> DomainList();

        public List<Project> ProjectList();

        public void AddProject(ProjectViewModel projectViewModel);

        public ProjectViewModel GetProject(string id);

        public void DeleteProject(string id);
    }
}
