using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using TravelWayAdmin_Team3.DummyData;
using TravelWayAdmin_Team3.Models;

namespace TravelWayAdmin_Team3.Controllers
{
    public class EventController : Controller
    {
        private readonly IList<EventViewModel> _events = DummyDataEvents.Events;

        public ActionResult Overview()
        {
            return View(_events);
        }

        public ActionResult Create()
        {
            return View(new EventViewModel());
        }

        [HttpPost]
        public ActionResult Create(EventViewModel eventViewModel)
        {
            if (!ModelState.IsValid) return View(eventViewModel);

            _events.Add(eventViewModel);

            return RedirectToAction("Overview");
        }

        public ActionResult Delete(Guid id)
        {
            _events.Remove(_events.First(x => x.Id == id));
            return RedirectToAction("Overview");
        }
    }
}