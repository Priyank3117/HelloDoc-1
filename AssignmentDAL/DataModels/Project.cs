using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace AssignmentDAL.DataModels;

[Table("Project")]
public partial class Project
{
    [Key]
    [Column("ProjectID")]
    public int ProjectId { get; set; }

    [StringLength(50)]
    public string ProjectName { get; set; } = null!;

    [StringLength(50)]
    public string Assignee { get; set; } = null!;

    public int DomainId { get; set; }

    [StringLength(50)]
    public string? Description { get; set; }

    [Column(TypeName = "timestamp without time zone")]
    public DateTime DueDate { get; set; }

    [StringLength(50)]
    public string Domain { get; set; } = null!;

    [StringLength(50)]
    public string? City { get; set; }

    [ForeignKey("DomainId")]
    [InverseProperty("Projects")]
    public virtual Domain DomainNavigation { get; set; } = null!;
}
