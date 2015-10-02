using System;
using System.Collections.Generic;
using TravelWayAdmin_Team3.Models;

namespace TravelWayAdmin_Team3.DummyData
{
    public class DummyDataTravel
    {
        public static IList<TravelViewModel> Travels = new List<TravelViewModel>
        {
            new TravelViewModel
            {
                Start = DateTime.Now,
                End = DateTime.Now.AddDays(14),
                CustomerName = "Jayway",
                SellerName = "Fatima"
            },
            new TravelViewModel
            {
                Start = DateTime.Now.AddMonths(2),
                End = DateTime.Now.AddMonths(2).AddDays(14),
                CustomerName = "Some other company",
                SellerName = "Fatima"
            }
        };
    }
}