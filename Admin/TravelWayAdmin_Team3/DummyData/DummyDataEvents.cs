using System;
using System.Collections;
using System.Collections.Generic;
using TravelWayAdmin_Team3.Models;

namespace TravelWayAdmin_Team3.DummyData
{
    public class DummyDataEvents
    {
        public static IList<EventViewModel> Events = new List<EventViewModel>
        {
            new EventViewModel
            {
                Id = Guid.NewGuid(),
                DateTime = DateTime.Now,
                Name = "Meetup in Kastrup Airport",
                Description = "Be at check in desk 24 in Terminal 2 at the specified event time for a depature meetup.",
                Location = new LocationViewModel { Name = "Kastrup Airport"},
                Users = DummyDataUsers.Users
            },
            new EventViewModel
            {
                Id = Guid.NewGuid(),
                DateTime = DateTime.Now.AddDays(14),
                Name = "Travel to Madrid Airport",
                Description = "We meet at 10:00 in front of the hotel where a bus will transfer us to the airport.",
                Location = new LocationViewModel { Name = "Grand Hotel Madrid"},
                Users = DummyDataUsers.Users
            }
        };
    }
}