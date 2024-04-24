using AssignmentBAL.Interface;
using AssignmentDAL.DataContext;
using AssignmentDAL.DataModels;
using AssignmentDAL.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssignmentBAL.Repository
{
    public class Projects : IProjects
    {

        private readonly ApplicationDbContext _context;

        public Projects(ApplicationDbContext context)
        {
            _context = context;
           
        }

        public void AddProject(ProjectViewModel projectViewModel)
        {
            Project project = new Project();
            project.ProjectName = projectViewModel.taskName;
            project.Assignee = projectViewModel.assignee;
            project.DomainId = int.Parse(projectViewModel.domainValue);
            project.Description = projectViewModel.description;
            project.DueDate = projectViewModel.dueDate;
            project.Domain = _context.Domains.FirstOrDefault(s => s.DomainId == int.Parse(projectViewModel.domainValue)).Name;
            project.City = projectViewModel.city;
            _context.Projects.Add(project); 
            _context.SaveChanges();

        }

        public void DeleteProject(string id)
        {
            if (id != null)
            {
                var project = _context.Projects.FirstOrDefault(s => s.ProjectId == int.Parse(id));
                _context.Remove(project);
                _context.SaveChanges();
                
            }
         
        }

        public List<Domain> DomainList()
        {
            List<Domain> result = _context.Domains.ToList();
            return result;
        }

        public ProjectViewModel GetProject(string id)
        {
            if(id != null)
            {
                var project = _context.Projects.FirstOrDefault(s => s.ProjectId == int.Parse(id));

                ProjectViewModel projectViewModel = new ProjectViewModel();
                projectViewModel.taskName = project.ProjectName;
                projectViewModel.assignee =  project.Assignee;
                projectViewModel.domainValue = project.Domain;
                projectViewModel.dueDate = project.DueDate;
                projectViewModel.description = project.Description;
                projectViewModel.city = project.City;

                return projectViewModel;
            }
            else
            {
                ProjectViewModel projectViewModel = new ProjectViewModel();
                return projectViewModel;
            }
        }

        public List<Project> ProjectList()
        {
            List<Project> result = _context.Projects.ToList();  
            return result;
        }
    }
}
