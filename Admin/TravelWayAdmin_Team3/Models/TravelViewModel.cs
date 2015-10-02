using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Web.Configuration;

namespace TravelWayAdmin_Team3.Models
{
    public class TravelViewModel
    {
        public Guid Id { get; set; }
        public DateTime Start { get; set; }
        public DateTime End { get; set; }

        [DisplayName("Seller")]
        public string SellerName { get; set; }

        [DisplayName("Customer")]
        public string CustomerName { get; set; }

        public IEnumerable<UserViewModel> Users { get; set; }
        public IEnumerable<EventViewModel> Events { get; set; }
    }
}