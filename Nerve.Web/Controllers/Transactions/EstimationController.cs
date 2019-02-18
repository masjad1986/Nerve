using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Nerve.Common;
using Nerve.Common.Translations;
using Nerve.Service;
using static Nerve.Web.WebConstants;

namespace Nerve.Web.Controllers.Transactions
{
    //[NerveAuthorize]
    [Route("[controller]")]
    public class EstimationController : Controller
    {
        private const string _controller = "Estimation";
        private readonly ILogger _logger;
        private readonly ILanguageTranslator _languageTranslator;
        private readonly IEstimationService _estimationService;

        public EstimationController(ILogger logger,
            ILanguageTranslator languageTranslator,
            IEstimationService estimationService)
        {
            _logger = logger;
            _languageTranslator = languageTranslator;
            _estimationService = estimationService;

        }


        [HttpGet]
        [Route("Index/{id?}")]
        public IActionResult Index(int? id)
        {
            HttpContext.Session.SetInt32(SessionKeys.CurrentMenuId, id ?? 0);
            var pageActionBarModel = new PageActionBarModel
            {
                ActionPrefix = "device",
                HasDeleteActionAccess = WebConstants.HasDeleteActionOptionAccess,
                MenuId = id ?? 0,
                ActionName = "",
                ControllerName = _controller,
                UndoActionUrl = Url.Action("Index", _controller) + "?id=" + id
            };
            return View(WebConstants.ViewPage.Estimation);
        }
    }
}
