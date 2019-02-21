using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Nerve.Common;
using Nerve.Common.Enums;
using Nerve.Common.Translations;
using Nerve.Repository.Dtos;
using Nerve.Service;
using Nerve.Web.Helpers;
using Nerve.Web.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using static Nerve.Web.WebConstants;

namespace Nerve.Web
{
    //[Authorize]
    [Route("[controller]")]
    public class InvoiceController : Controller
    {
        private readonly ILogger _logger;
        private readonly ILanguageTranslator _languageTranslator;
        private readonly IDeliveryService _deliveryService;
        private readonly IInvoiceService _invoiceService;
        public InvoiceController(ILogger logger,
            ILanguageTranslator languageTranslator,
            IDeliveryService deliveryService,
            IInvoiceService invoiceService)
        {
            _logger = logger;
            _languageTranslator = languageTranslator;
            _deliveryService = deliveryService;
            _invoiceService = invoiceService;
        }

        /// <summary>
        /// View for dispatch note index.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        [Route(WebConstants.PageRoute.DispatchNote + "/{id?}")]
        public async Task<IActionResult> DispatchNoteAsync(int? id)
        {
            HttpContext.Session.SetInt32(SessionKeys.CurrentMenuId, id ?? 0);
            var dispatchViewModel = new DispatchNoteViewModel
            {
                AirwayBillItems = new List<SelectListItem>(),
                DeliveryAgentItems = new List<SelectListItem>(),
                DispatchNote = new DispatchNoteDto(),
                PageActionBarModel = new PageActionBarModel
                {
                    ActionPrefix = "dispatch-note",
                    HasDeleteActionAccess = WebConstants.HasDeleteActionOptionAccess,
                    MenuId = id ?? 0,
                    ActionName = "",
                    ControllerName = WebConstants.Controllers.VendorUpdation,
                    UndoActionUrl = Url.Action("Index", WebConstants.Controllers.VendorUpdation) + "?id=" + id
                }
            };

            //get forwarder or delivery agent
            var deliveryAgents = await _deliveryService.GetDeliveryAgentsAsync();
            if (deliveryAgents != null && deliveryAgents.Any())
            {
                dispatchViewModel.DeliveryAgentItems = deliveryAgents.Select(x => new SelectListItem
                {
                    Text = x.Name,
                    Value = Convert.ToString(x.Code),
                }).ToList();
            }
            
            return View(WebConstants.ViewPage.DispatchNote, await Task.FromResult(dispatchViewModel));
        }

        /// <summary>
        /// Get list of dealer invoice.
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        [HttpGet]
        [Route(WebConstants.PageRoute.GetDealerInvoices + "/{search}")]
        public async Task<IActionResult> GetDealerInvoiceAsync(string search)
        {
            try
            {
                var result = await _invoiceService.GetDealerInvoiceAsync(search);
                return Ok(result);
            }
            catch (InvalidOperationException)
            {
                return StatusCode((int)HttpStatusCode.BadRequest);
            }
            catch (Exception ex)
            {
                _logger.Log(WebConstants.Controllers.VendorUpdation, WebConstants.PageRoute.Find, ex);
                var translateItems = await _languageTranslator.TranslateManyAsync(new List<string>
                    {
                        LanguageKeys.DispatchNote,
                        LanguageKeys.ContactAdministrator
                    });

                TempData[WebConstants.TempDataKeys.Notification] = NotificationHelper.GetJsonNotification(translateItems[LanguageKeys.DispatchNote],
                    translateItems[LanguageKeys.ContactAdministrator],
                    NotificationType.Error);

                return StatusCode((int)HttpStatusCode.InternalServerError);
            }
        }
    }
}
