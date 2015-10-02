using System;
using System.Collections.Generic;
using System.Web.Http;
using System.Web.Http.Description;

namespace Travelway_Team3_API.Controllers
{
    [RoutePrefix("api/sap")]
    public class SAPController : ApiController
    {
        /// <summary>
        /// Get information about all trips
        /// </summary>
        /// <remarks>This is some longer text about the method.</remarks>
        /// <returns>The information about everything</returns>
        [Route("trips"), HttpGet]
        [ResponseType(typeof(List<Trip>))]
        public IHttpActionResult GetTrips()
        {
            return Ok(new List<TripSummary>());
        }
        [Route("trips/{id}"), HttpGet]
        [ResponseType(typeof(Trip))]
        public IHttpActionResult GetTrip(int id)
        {
            return Ok(new Trip());
        }

        [Route("trips/{id}/events"), HttpGet]
        [ResponseType(typeof(IList<Event>))]
        public IHttpActionResult GetEventsForTrip(int id)
        {
            return Ok(new List<Event>());
        }

        [Route("trips/{id}/events"), HttpPost]
        public IHttpActionResult CreateEvent(Event @event)
        {
            return Ok(new List<Event>());
        }

        [Route("trips/{id}/travellers"), HttpGet]
        [ResponseType(typeof(List<Traveller>))]
        public IHttpActionResult GetTravellersForTrip(int tripid)
        {
            return Ok(new List<Traveller>());
        }

        [Route("travellers/{email}"), HttpGet]
        [ResponseType(typeof(Traveller))]
        public IHttpActionResult GetTraveller(string email)
        {
            return Ok(new Traveller());
        }
        [Route("travellers"), HttpPut]
        [ResponseType(typeof(Traveller))]
        public IHttpActionResult AddTraveller(Traveller travller)
        {
            return Created("foo", new Traveller());
        }
        [Route("travellers"), HttpPost]
        [ResponseType(typeof(Traveller))]
        public IHttpActionResult UpdateTravellerInfo(Traveller traveller, string email)
        {
            return Ok(new Traveller());
        }
    }

    public class Traveller
    {
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string Title { get; set; }
        public string PassportNumber { get; set; }
        public Gender Gender { get; set; }
    }

    public class TripSummary
    {
        public int Id { get; set;}
        public string Company { get; set; }
        public string Name { get; set; }
    }

    public class Trip
    {
        /// <summary>
        /// All events, travel plans, hotel bookings etc for the trip.
        /// </summary>
        public ICollection<Event> Events{ get; set; }
        /// <summary>
        /// Personal information about all participants.
        /// </summary>
        public ICollection<Traveller> Travellers { get; set; }
    }

    public class Event
    {
        public DateTime Start { get; set; }
        public DateTime End { get; set; }
        public Location Location { get; set; }

    }

    public class Location
    {
        public string Name { get; set; }
        public double Longitude { get; set; }
        public double Latitude { get; set; }
    }

    public enum Gender
    {
        Unknown,
        Male,
        Female
    }
}
