using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Nerve.Common;
using Nerve.Common.Enums;
using Nerve.Common.Translations;
using Nerve.Repository.Dtos;
using Nerve.Service;
using Nerve.Web.Filters;
using Nerve.Web.Helpers;
using Nerve.Web.ViewModels;
using System;
using System.Collections.Generic;
using System.Net;
using System.Threading.Tasks;
using static Nerve.Web.WebConstants;

namespace Nerve.Web.Controllers.Transactions
{
    [Route("[controller]")]
    [NerveAuthorize]
    [TypeFilter(typeof(NerveException))]
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
                if (result == null)
                {
                    throw new InvalidOperationException(LanguageKeys.SearchItemNotFound);
                }
                return Ok(result);
            }
            catch (InvalidOperationException)
            {
                return StatusCode((int)HttpStatusCode.BadRequest);
            }
        }

        /// <summary>
        /// Update vendor rma number.
        /// </summary>
        /// <param name="vendorUpdationDto"></param>
        /// <returns></returns>
        [HttpPost]
        [Route(WebConstants.PageRoute.Update)]
        public async Task<IActionResult> UpdateAsync(VendorUpdateViewModel vendorUpdateViewModel)
        {
            var translateItems = new Dictionary<string, string>();
            var vendorUpdationDto = vendorUpdateViewModel.VendorUpdation;
            translateItems = await _languageTranslator.TranslateManyAsync(new List<string>
                    {
                        LanguageKeys.VendorRmaUpdation,
                        LanguageKeys.ContactAdministrator,
                        LanguageKeys.SaveRecordMessage
                    });
            var result = await _vendorUpdationService.UpdateAsync(vendorUpdationDto.VendorRmaNumber, vendorUpdationDto.ImeiNumber, vendorUpdationDto.TrackingNumber);

            TempData[WebConstants.TempDataKeys.Notification] = NotificationHelper.GetJsonNotification(translateItems[LanguageKeys.VendorRmaUpdation],
                translateItems[LanguageKeys.SaveRecordMessage],
                NotificationType.Success);

            return RedirectToAction("Index", new { id = HttpContext.Session.GetInt32(SessionKeys.CurrentMenuId) });

        }
    }
}
