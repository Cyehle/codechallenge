using System;
using System.Collections.Generic;
using System.Text;

namespace Sabio.Models
{
    public class Advertisement
    {
        public int Id { get; set; }
        public string shortTitle { get; set; }
        public string title { get; set; }
        public string shortDescription { get; set; }
        public string content { get; set; }
        public int createdBy { get; set; }
        public string Slug { get; set; }
        public int entityTypeId { get; set; }
        public int statusId { get; set; }
        public DateTime dateCreated { get; set; }
        public DateTime dateModified { get; set; }
    }
}
