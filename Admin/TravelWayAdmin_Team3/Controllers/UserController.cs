using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using TravelWayAdmin_Team3.DummyData;
using TravelWayAdmin_Team3.Models;

namespace TravelWayAdmin_Team3.Controllers
{
    public class UserController : Controller
    {
        private IList<UserViewModel> _users = DummyDataUsers.Users;

        public ActionResult Overview()
        {
            return View(_users);
        }

        public ActionResult Create()
        {
            return View(new UserViewModel());
        }

        [HttpPost]
        public ActionResult Create(UserViewModel user)
        {
            if (!ModelState.IsValid) return View(user);

            _users.Add(user);

            return RedirectToAction("Overview");
        }

        public ActionResult Delete(string email)
        {
            _users.Remove(_users.First(x => x.Email == email));
            return RedirectToAction("Overview");
        }

        public ActionResult Edit(UserViewModel user)
        {
            return View("Overview");
        }
    }
}