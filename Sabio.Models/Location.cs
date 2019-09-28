using System;
using System.Collections.Generic;
using System.Text;

namespace Sabio.Models
{
    public class Location
    {
        public int Id { get; set; }
        public float Latitude { get; set; }
        public float Longittude { get; set; }
        public int Zipcode { get; set; }
        public string Address { get; set; }
    }
}
