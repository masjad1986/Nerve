using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Nerve.Common;
using Nerve.Common.Models;
using Nerve.Web.Filters;
using Nerve.Web.ViewModels;
using System.Diagnostics;

namespace Nerve.Web.Controllers
{
    [Route("[controller]")]
    [NerveAuthorize]
    [TypeFilter(typeof(NerveException))]
    public class HomeController : Controller
    {
        private readonly ILogger _logger;
        public HomeController(ILogger logger)
        {
            _logger = logger;
        }
        public IActionResult Index()
        {
            HttpContext.Session.Remove(WebConstants.SessionKeys.CurrentMenuId);
            return View();
        }
    }
}
