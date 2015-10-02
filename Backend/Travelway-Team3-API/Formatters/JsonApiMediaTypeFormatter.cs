using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Formatting;
using System.Net.Http.Headers;
using System.Text;
using System.Web;

namespace Travelway_Team3_API.Formatters
{
    public class JsonApiMediaTypeFormatter : JsonMediaTypeFormatter
    {
        public JsonApiMediaTypeFormatter()
        {
            SupportedMediaTypes.Clear();
            SupportedMediaTypes.Add(JsonApiMediaTypes.ApplicationVndApiJson);

            var utf8Encoding = SupportedEncodings.Single(enc => enc is UTF8Encoding);
            SupportedEncodings.Clear();
            SupportedEncodings.Add(utf8Encoding);

            SerializerSettings.Converters.Add(new StringEnumConverter { CamelCaseText = true });
            SerializerSettings.ContractResolver = new CamelCasePropertyNamesContractResolver();
            SerializerSettings.NullValueHandling = NullValueHandling.Ignore;
        }

        public override void SetDefaultContentHeaders(Type type, HttpContentHeaders headers, MediaTypeHeaderValue mediaType)
        {
            base.SetDefaultContentHeaders(type, headers, mediaType);

            // Remove charset parameter. It must not be sent according to Json Api (http://jsonapi.org/format/#content-negotiation-servers)
            headers.ContentType.CharSet = null;
        }
    }
    public static class JsonApiMediaTypes
    {
        private static readonly MediaTypeHeaderValue DefaultApplicationVndApiJsonMediaType = new MediaTypeHeaderValue("application/json");

        /// <summary>
        /// Gets a <see cref="MediaTypeHeaderValue"/> instance representing <c>application/vnd.api+json</c>.
        /// </summary>
        /// <value>
        /// A new <see cref="MediaTypeHeaderValue"/> instance representing <c>application/vnd.api+json</c>.
        /// </value>
        public static MediaTypeHeaderValue ApplicationVndApiJson
        {
            get
            {
                var clone = ((ICloneable)DefaultApplicationVndApiJsonMediaType).Clone();
                return (MediaTypeHeaderValue)clone;
            }
        }
    }
}