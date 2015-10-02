using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Travelway_Team3_API.Controllers
{
    public class SAPController : ApiController
    {
        [Route("api/sap/trips"), HttpGet]
        [Route("api/sap/travellers"), HttpGet]
        [Route("api/sap/travellers"), HttpPut]
        [Route("api/sap/travellers"), HttpPost]
    }
}
