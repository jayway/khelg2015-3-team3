using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using TravelWayAdmin_Team3.DummyData;
using TravelWayAdmin_Team3.Models;

namespace TravelWayAdmin_Team3.Controllers
{
    public class TravelController : Controller
    {
        private readonly IList<TravelViewModel> _travels = DummyDataTravel.Travels;

        public ActionResult Overview()
        {
            return View(_travels);
        }

        public ActionResult Create()
        {
            return View(new TravelViewModel());
        }

        [HttpPost]
        public ActionResult Create(TravelViewModel travel)
        {
            if (!ModelState.IsValid) return View(travel);

            _travels.Add(travel);

            return RedirectToAction("Overview");
        }

        public ActionResult Delete(Guid id)
        {
            var travel = _travels.First(x => x.Id == id);
            _travels.Remove(travel);
            return RedirectToAction("Overview");
        }
    }
}