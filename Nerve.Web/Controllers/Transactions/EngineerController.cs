﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Nerve.Common;
using Nerve.Common.Translations;
using Nerve.Service;
using Nerve.Web.Filters;

namespace Nerve.Web.Controllers
{
    [Route("[controller]")]
    [NerveAuthorize]
    [TypeFilter(typeof(NerveException))]
    public class EngineerController : Controller
    {
        private readonly ILogger _logger;
        private readonly ILanguageTranslator _languageTranslator;
        private readonly IEngineerService _engineerService;
        public EngineerController(ILogger logger,
            ILanguageTranslator languageTranslator,
            IEngineerService engineerService)
        {
            _logger = logger;
            _languageTranslator = languageTranslator;
            _engineerService = engineerService;
        }

        [HttpGet]
        [Route(WebConstants.PageRoute.GetEngineer + "/{location}")]
        public async Task<IActionResult> GetEngineersAsync(string location)
        {
            var result = await _engineerService.GetByLocationAsync(location);
            return Json(result);
        }
    }
}
