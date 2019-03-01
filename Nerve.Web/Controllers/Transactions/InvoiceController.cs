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
            try
            {
                HttpContext.Session.SetInt32(SessionKeys.CurrentMenuId, id ?? 0);
                var dispatchViewModel = new DispatchNoteViewModel
                {
                    DeliveryAgentItems = new List<SelectListItem>(),
                    Devices = new List<DealerInvoiceDto>(),
                    DispatchNote = new DispatchNoteDto()
                    {
                        InvoiceDate = DateTime.Now.ToString("MM/dd/yyyy"),
                        DeliveryDate = DateTime.Now.ToString("MM/dd/yyyy"),
                        SelectedTrackingNumbers = new List<string>()
                    },
                    PageActionBarModel = new PageActionBarModel
                    {
                        ActionPrefix = "dispatch-note",
                        HasDeleteActionAccess = WebConstants.HasDeleteActionOptionAccess,
                        MenuId = id ?? 0,
                        ActionName = "",
                        ControllerName = WebConstants.Controllers.Invoice,
                        UndoActionUrl = Url.Action(WebConstants.PageRoute.DispatchNote, WebConstants.Controllers.Invoice) + "?id=" + id
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
            catch (Exception ex)
            {
                _logger.Log(WebConstants.Controllers.VendorUpdation, WebConstants.PageRoute.Find, ex);
                return View(WebConstants.ViewPage.Error);
            }
        }

        /// <summary>
        /// Search invoice number details.
        /// </summary>
        /// <param name="dispatchViewModel"></param>
        /// <returns></returns>
        [HttpPost]
        [Route(WebConstants.PageRoute.DispatchNote)]
        public async Task<IActionResult> DispatchNoteAsync(DispatchNoteViewModel dispatchViewModel)
        {
            try
            {
                if (!dispatchViewModel.IsSaveRequest)
                {
                    dispatchViewModel = await LoadDispatchModel(dispatchViewModel);
                    dispatchViewModel.DispatchNote.SelectedTrackingNumbers = new List<string>();
                    dispatchViewModel.Devices = await _invoiceService
                        .GetDealerInvoiceByParamAsync(dispatchViewModel.ImeiOrTrackingNumber, dispatchViewModel.DispatchNote.DeliveryAgent == 0 ? null : (int?)dispatchViewModel.DispatchNote.DeliveryAgent);
                }
                else
                {
                    var result = await _invoiceService.SaveDispatchNoteAsync(dispatchViewModel.DispatchNote, HttpContext.Session.GetString(SessionKeys.UserId));

                    var translateItems = await _languageTranslator.TranslateManyAsync(new List<string>
                    {
                        LanguageKeys.DispatchNote,
                        LanguageKeys.SaveRecordMessage
                    });

                    TempData[WebConstants.TempDataKeys.Notification] = NotificationHelper.GetJsonNotification(translateItems[LanguageKeys.DispatchNote],
                    translateItems[LanguageKeys.SaveRecordMessage],
                    NotificationType.Success);

                    return RedirectToAction(WebConstants.ViewPage.DispatchNote, new { id = HttpContext.Session.GetInt32(SessionKeys.CurrentMenuId) });
                }
                return View(WebConstants.ViewPage.DispatchNote, await Task.FromResult(dispatchViewModel));
            }
            catch (Exception ex)
            {
                _logger.Log(WebConstants.Controllers.Invoice, WebConstants.PageRoute.DispatchNote, ex);
                return View(WebConstants.ViewPage.Error);
            }
        }


        /// <summary>
        /// Get list of dealer invoice.
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        [HttpGet]
        [Route(WebConstants.PageRoute.Find + "/{search?}")]
        public async Task<IActionResult> GetDealerInvoiceAsync(int? search)
        {
            try
            {
                var result = await _invoiceService.GetDealerInvoiceAsync(search);
                var invoices = result?.Select(i => new ItemDto
                {
                    Name = Convert.ToString(i.InvoiceNumber),
                    Id = i.Id
                }).ToList();
                return PartialView(WebConstants.ViewPage.Partial.Invoice, invoices);
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

        [NonAction]
        private async Task<DispatchNoteViewModel> LoadDispatchModel(DispatchNoteViewModel dispatchViewModel)
        {
            var id = HttpContext.Session.GetInt32(SessionKeys.CurrentMenuId);
            dispatchViewModel.DeliveryAgentItems = new List<SelectListItem>();
            dispatchViewModel.PageActionBarModel = new PageActionBarModel
            {
                ActionPrefix = "dispatch-note",
                HasDeleteActionAccess = WebConstants.HasDeleteActionOptionAccess,
                MenuId = id ?? 0,
                ActionName = "",
                ControllerName = WebConstants.Controllers.Invoice,
                UndoActionUrl = Url.Action(WebConstants.PageRoute.DispatchNote, WebConstants.Controllers.Invoice) + "?id=" + id
            };

            //get forwarder or delivery agent
            var deliveryAgents = await _deliveryService.GetDeliveryAgentsAsync();
            if (deliveryAgents != null && deliveryAgents.Any())
            {
                dispatchViewModel.DeliveryAgentItems = deliveryAgents.Select(x => new SelectListItem
                {
                    Text = x.Name,
                    Value = Convert.ToString(x.Code),
                    Selected = Convert.ToString(x.Code) == Convert.ToString(dispatchViewModel.DispatchNote.DeliveryAgent)
                }).ToList();
            }

            return dispatchViewModel;
        }
    }
}
