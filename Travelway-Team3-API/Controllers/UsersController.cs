using System.Web.Http;
using Travelway_Team3_API.Models;

namespace Travelway_Team3_API.Controllers
{
    public class UsersController : ApiController
    {
        public class UserInputModel
        {
            public string Email { get; internal set; }
            public string FirstName { get; internal set; }
            public string LastName { get; internal set; }
        }

        [Route("api/users"), HttpPost]
        public IHttpActionResult CreateUser(UserInputModel user)
        {
            var newUser = new User(user.Email, user.FirstName, user.LastName);
            TripAppModel.Instance.Users.Add(newUser);
            return Created("/api/user/" + user.Email, newUser);
        }
    }
}
