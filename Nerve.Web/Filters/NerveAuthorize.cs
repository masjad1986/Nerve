using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Net;
using static Nerve.Web.WebConstants;

namespace Nerve.Web.Filters
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = true, Inherited = true)]
    public class NerveAuthorize : AuthorizeAttribute, IAuthorizationFilter
    {
        public void OnAuthorization(AuthorizationFilterContext context)
        {
            //if (context.HttpContext.Session.(SessionKeys.GroupId] == null)
            //{
            //    context.Result = new ViewResult
            //    {
            //        StatusCode = (int)HttpStatusCode.Unauthorized,
            //        ViewName = "Login"
            //    };
            //}
        }
    }
}
