using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Nerve.Common;
using Nerve.Common.Enums;
using Nerve.Common.Translations;
using Nerve.Repository.Dtos;
using Nerve.Service;
using Nerve.Web.Helpers;
using Nerve.Web.ViewModels;
using static Nerve.Web.WebConstants;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Nerve.Web.Controllers.Transactions
{
    //[Authorize]
    [Route("[controller]")]
    public class VendorUpdationController : Controller
    {
        private readonly ILogger _logger;
        private readonly ILanguageTranslator _languageTranslator;
        private readonly IVendorUpdationService _vendorUpdationService;
        public VendorUpdationController(ILogger logger,
            ILanguageTranslator languageTranslator,
            IVendorUpdationService vendorUpdationService)
        {
            _logger = logger;
            _languageTranslator = languageTranslator;
            _vendorUpdationService = vendorUpdationService;
        }


        [HttpGet]
        [Route("Index/{id?}")]
        public async Task<IActionResult> Index(int? id)
        {
            HttpContext.Session.SetInt32(SessionKeys.CurrentMenuId, id ?? 0);
            var vendorUpdationModel = new VendorUpdateViewModel
            {
                VendorUpdation = new VendorUpdationDto(),
                PageActionBarModel = new PageActionBarModel
                {
                    ActionPrefix = "vendor-updation",
                    HasDeleteActionAccess = WebConstants.HasDeleteActionOptionAccess,
                    MenuId = id ?? 0,
                    ActionName = "",
                    ControllerName = WebConstants.Controllers.VendorUpdation,
                    UndoActionUrl = Url.Action("Index", WebConstants.Controllers.VendorUpdation) + "?id=" + id
                }
            };
            return View(WebConstants.ViewPage.VendorUpdation, await Task.FromResult(vendorUpdationModel));
        }

        /// <summary>
        /// Find device based on tracking or imei number.
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        [HttpGet]
        [Route(WebConstants.PageRoute.Find + "/{search}")]
        public async Task<IActionResult> GetByImeiOrTrackingNumberAsync(string search)
        {
            try
            {
                var result = await _vendorUpdationService.GetByImeiOrTrackingNumberAsync(search);
                return Ok(result);
            }
            catch (Exception ex)
            {
                _logger.Log(WebConstants.Controllers.VendorUpdation, WebConstants.PageRoute.Find, ex);
                var translateItems = await _languageTranslator.TranslateManyAsync(new List<string>
                    {
                        LanguageKeys.VendorRmaUpdation,
                        LanguageKeys.ContactAdministrator
                    });

                TempData[WebConstants.TempDataKeys.Notification] = NotificationHelper.GetJsonNotification(translateItems[LanguageKeys.VendorRmaUpdation],
                    translateItems[LanguageKeys.ContactAdministrator],
                    NotificationType.Error);

                return StatusCode((int)HttpStatusCode.InternalServerError);
            }
        }

    }
}
