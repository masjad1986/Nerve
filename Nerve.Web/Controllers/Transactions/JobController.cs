using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Nerve.Common;
using Nerve.Common.Translations;
using Nerve.Service;
using Nerve.Web.ViewModels;

namespace Nerve.Web.Controllers
{
    //[Authorize]
    [Route("[controller]")]
    public class JobController : Controller
    {
        private readonly ILogger _logger;
        private readonly ILanguageTranslator _languageTranslator;
        private readonly IJobService _jobService;
        public JobController(ILogger logger,
            ILanguageTranslator languageTranslator,
            IJobService jobService)
        {
            _logger = logger;
            _languageTranslator = languageTranslator;
            _jobService = jobService;
        }

        [HttpGet]
        [Route(WebConstants.PageRoute.JobAllocation + "/{id?}")]
        public async Task<IActionResult> JobAllocationAsync(int? id)
        {
            try
            {
                var defaultLocation = HttpContext.Session.GetString(WebConstants.SessionKeys.DefaultStockLocation);
                var allocations = await _jobService.GetPendingJobAllocationByLocationAsync(defaultLocation);
                var jobAllocationViewModel = new JobAllocationViewModel
                {
                    JobAllocations = allocations,
                    PageActionBarModel = new PageActionBarModel
                    {
                        ActionPrefix = LanguageKeys.JobAllocation,
                        HasDeleteActionAccess = WebConstants.HasDeleteActionOptionAccess,
                        MenuId = id ?? 0,
                        ControllerName = WebConstants.Controllers.Job,
                        UndoActionUrl = Url.Action(WebConstants.PageRoute.JobAllocation, WebConstants.Controllers.Job) + "?id=" + id,
                        AdditionalMenus = new List<ActionBarMenuItem>
                    {
                        new ActionBarMenuItem { Name = "audit", Icon="file", TranslateKey ="audit"}
                    }
                    }
                };
                return View(WebConstants.ViewPage.JobAllocation, jobAllocationViewModel);
            }
            catch (Exception ex)
            {
                _logger.Log(WebConstants.Controllers.Job, WebConstants.PageRoute.JobAllocation, ex);
                return View(WebConstants.ViewPage.Error);
            }
        }
    }
}
