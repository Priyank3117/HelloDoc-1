using Microsoft.VisualBasic;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssignmentDAL.ViewModel
{
    public class ProjectViewModel
    {

        [Required]
        public string taskName { get; set;}

        [Required]
        public string assignee { get; set;}

        public string? projectId {  get; set;}

        public string? description { get; set;}

        [Required]
        public   DateTime   dueDate   {get; set;}

        [Required]
        public string domainValue { get; set; }
        public string? city {get; set;}
    }
}
