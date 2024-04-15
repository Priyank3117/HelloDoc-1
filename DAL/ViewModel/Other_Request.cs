

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using DAL.DataModels;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;

namespace DAL.ViewModel
{
    public class Other_Request
    {
        [Key]
        [StringLength(256)]
        [Required(ErrorMessage = "Please Enter First Name")]
        public string? FirstNameOther { get; set; } = null!;

        [StringLength(256)]
        [Required(ErrorMessage = "Please Enter Last Name")]
        public string? LastNameOther { get; set; } = null!;

        [Column(TypeName = "character varying")]
        [RegularExpression(@"^(?:(\+?91|0)?[ ]?([\-\s]?[6-9]\d{9})|(\+?91|0)?[ ]?(\d{5})[ ]?(\d{5}))$", ErrorMessage = "Enter a valid Phone number")]
        public string? PhoneNumberother { get; set; } 

        public string? State_c { get; set; }


        [StringLength(256)]
        [Required(ErrorMessage = "Please Enter  Email")]
        [DataType(DataType.EmailAddress, ErrorMessage = "Enter email in correct format (mailto:example@email.com)")]
        public string? EmailOther { get; set; } = null!;

        public List<Region>? regions { get; set; }

        [StringLength(256)]
        public string? Relation { get; set; }

        [StringLength(256)]
        public string? BusinessName { get; set; }

        [StringLength(256)]
        public string? HotelName { get; set; }


        [StringLength(256)]
        [Required(ErrorMessage = "Please Enter FirstName Of Patient")]
        public string FirstName_P { get; set; } = null!;

        [StringLength(256)]
        [Required(ErrorMessage = "Please Enter LastName Of Patient")]
        public string LastName_P { get; set; } = null!;

        [StringLength(256)]
        [Required]
        [DataType(DataType.EmailAddress, ErrorMessage = "Enter email in correct format (mailto:example@email.com)")]
        [DisplayName("Email")]
        public string Email_P { get; set; } = null!;
        [Column(TypeName = "character varying")]
        [RegularExpression(@"^(?:(\+?91|0)?[ ]?([\-\s]?[6-9]\d{9})|(\+?91|0)?[ ]?(\d{5})[ ]?(\d{5}))$", ErrorMessage = "Enter a valid Phone number")]
        public string? PhoneNumber_P { get; set; }

       
        public DateTime BirthDate_P { get; set; }

        [Required(ErrorMessage = "Please Enter Street")]
        public string? Street { get; set; } = null!;

        [Required(ErrorMessage = "Please Enter City")]
        public string? City { get; set; } = null!;

        [Required(ErrorMessage = "Please Enter State")]
        public string? State { get; set; } = null!;

       
        [RegularExpression(@"^\d{5}$", ErrorMessage = "Zip code must be 5 digits")]
        public string? Zipcode { get; set; } = null!;

        public IFormFile? Filedata { get; set; }

    }

}