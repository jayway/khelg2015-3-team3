using System;
using System.Collections.Generic;

namespace TravelWayAdmin_Team3.Models
{
    public class EventViewModel
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public DateTime DateTime { get; set; }
        public string ImagePath { get; set; }
        public LocationViewModel Location { get; set; }
        public IEnumerable<UserViewModel> Users { get; set; }
    }
}