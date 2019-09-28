using System;
using System.Collections.Generic;
using System.Text;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Sabio.Models.Requests
{
    public class AdvertAddRequest
    {
        [Required]
        [StringLength(200, MinimumLength = 2)]
        public string shortTitle { get; set; }

            [Required]
            [StringLength(200, MinimumLength = 2)]
            public string title { get; set; }

        [Required]
        [StringLength(200, MinimumLength = 2)]
        public string shortDescription { get; set; }

        [Required]
        [StringLength(200, MinimumLength = 2)]
        public string Description { get; set; }

            [StringLength(255)]
            public string content { get; set; }

        [Required]
        [Range(1, Int32.MaxValue)]
        public int createdBy { get; set; }


            [StringLength(255)]
            public string slug { get; set; }

        [Required]
        [Range(1, Int32.MaxValue)]
        public int entityTypeId { get; set; }

        [Required]
        [Range(1, Int32.MaxValue)]
        public int statusId { get; set; }

            public DateTime dateCreated { get; set; }

            public DateTime dateModified { get; set; }

        public float latitude { get; set; }

        public float longitude { get; set; }

        public int zipcode { get; set; }

        public string address { get; set; }






    }
    }

