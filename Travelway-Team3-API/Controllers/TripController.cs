using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Travelway_Team3_API.Controllers
{
    public class TripController : ApiController
    {
        [Route("api/foo"), HttpGet]
        public IHttpActionResult Foo()
        {
            return Ok("foo");
        }
    }
}
