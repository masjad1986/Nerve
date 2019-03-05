using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
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
        private readonly ITempDataProvider _provider;

        public NerveException(ILogger logger,
            IOptions<AppSettings> appSettings,
            ITempDataProvider provider)
        {
            _appSettings = appSettings;
            _logger = logger;
            _provider = provider;
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
                        TempData = new TempDataDictionary(context.HttpContext, _provider)
                        {
                            { "ShowPageError" , _appSettings.Value.DISPLAY_PAGE_ERROR},
                            { "Error" , context.Exception.StackTrace},
                            { "Controller" , context.RouteData.Values["controller"]},
                            { "Action" , context.RouteData.Values["action"]}
                        }
                    };
                }
            }

            base.OnException(context);
        }
    }
}
