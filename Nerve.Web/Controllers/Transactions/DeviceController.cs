using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Routing;
using Nerve.Web.Filters;
using Nerve.Web.Translation;
using Nerve.Web.ViewModels;

namespace Nerve.Web.Controllers.Transactions
{
    //[NerveAuthorize]
    public class DeviceController : Controller
    {
        private readonly ILogger _logger;
        private readonly ILanguageTranslator _languageTranslator;
        public DeviceController(
            ILanguageTranslator languageTranslator,
            ILogger logger)
        {
            _logger = logger;
            _languageTranslator = languageTranslator;
        }

        public IActionResult Index()
        {
            var model = new DeviceViewModel();
            return View(WebConstants.ViewPages.DeviceLogin, model);
        }
    }
}
