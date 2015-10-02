using System.Collections.Generic;

namespace Travelway_Team3_API.Models
{
    public class TripAppModel
    {
        private static TripAppModel _modelInstance;
        private TripAppModel() {
            Users = new List<User>();
        }
        public static TripAppModel Instance => _modelInstance ?? (_modelInstance = new TripAppModel());

        public ICollection<User> Users { get; private set; }
    }

    public class User
    {
        public User(string email, string firstName, string lastName)
        {
            Email = email;
            FirstName = firstName;
            LastName = lastName;
        }
        
        public int Id { get; set; }
        public string Email { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
    }
}
