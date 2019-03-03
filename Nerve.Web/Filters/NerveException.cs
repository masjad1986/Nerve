using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Options;
using Nerve.Common;
using Nerve.Common.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace Nerve.Web.Filters
{
    public class NerveException : ExceptionFilterAttribute
    {
        private readonly ILogger _logger;
        private readonly IOptions<AppSettings> _appSettings;

        public NerveException(ILogger logger, IOptions<AppSettings> appSettings)
        {
            _appSettings = appSettings;
            _logger = logger;
        }

        /// <summary>
        /// Global exception filter.
        /// </summary>
        /// <param name="context"></param>
        public override void OnException(ExceptionContext context)
        {
            if (context.Exception != null)
            {
                if (context.Exception is UnauthorizedAccessException)
                {
                    context.Result = new ViewResult
                    {
                        ViewName = WebConstants.ViewPage.Unauthorized
                    };
                    context.HttpContext.Response.StatusCode = (int)HttpStatusCode.Unauthorized;
                }
                else
                {
                    _logger.Log(Convert.ToString(context.RouteData.Values["controller"]),
                        Convert.ToString(context.RouteData.Values["action"]),
                        context.Exception);

                    context.HttpContext.Response.StatusCode = (int)HttpStatusCode.InternalServerError;
                    context.Result = new ViewResult()
                    {
                        ViewName = WebConstants.ViewPage.Error,
                    };
                }
            }

            base.OnException(context);
        }
    }
}
