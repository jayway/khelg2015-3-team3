using System.Collections.Generic;
using TravelWayAdmin_Team3.Models;

namespace TravelWayAdmin_Team3.DummyData
{
    public class DummyDataUsers
    {
        public static IList<UserViewModel> Users = new List<UserViewModel>
        {
            new UserViewModel
            {
                FirstName = "Joakim",
                LastName = "Hogart",
                Email = "joakim.hogars@jayway.com"
            },
            new UserViewModel
            {
                FirstName = "Christoffer",
                LastName = "Jerrebro",
                Email = "christoffer.jerrebro@jayway.com"
            },
            new UserViewModel
            {
                FirstName = "Tomas",
                LastName = "Lyckan",
                Email = "thomas.lyckan@jayway.com"
            },
            new UserViewModel
            {
                FirstName = "Elizabeth",
                LastName = "Andrews",
                Email = "elizabeth.andrews@jayway.com"
            },new UserViewModel
            {
                FirstName = "Fredrik",
                LastName = "Nannestad",
                Email = "fredrik.nannestad@jayway.com"
            },
            new UserViewModel
            {
                FirstName = "Frida",
                LastName = "Bredberg",
                Email = "frida.bredberg@jayway.com"
            },
            new UserViewModel
            {
                FirstName = "Erik",
                LastName = "Rydgrend",
                Email = "erik.rydgren@jayway.com"
            },
            new UserViewModel
            {
                FirstName = "Gustav",
                LastName = "Nilklint",
                Email = "grustav.nilklint@jayway.com"
            }
        };
    }
}