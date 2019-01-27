using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Routing;
using Nerve.Repository.Dtos;
using Nerve.Service;
using Nerve.Web.Filters;
using Nerve.Web.Translation;
using Nerve.Web.ViewModels;

namespace Nerve.Web.Controllers.Transactions
{
    //[NerveAuthorize]
    [Route("[controller]")]
    public class DeviceController : Controller
    {
        private const string _controller = "Device";
        private readonly ILogger _logger;
        private readonly ILanguageTranslator _languageTranslator;
        private readonly IDeviceService _deviceService;
        private readonly IDeliveryService _deliveryService;
        private readonly IWarrantyService _warrantyService;
        public DeviceController(
            ILanguageTranslator languageTranslator,
            ILogger logger,
            IDeviceService deviceService,
            IDeliveryService deliveryService,
            IWarrantyService warrantyService)
        {
            _logger = logger;
            _languageTranslator = languageTranslator;
            _deviceService = deviceService;
            _deliveryService = deliveryService;
            _warrantyService = warrantyService;
        }

        [HttpGet]
        [Route("Index/{id?}")]
        public async Task<IActionResult> Index()
        {
            var model = new DeviceViewModel()
            {
                LoginDetail = new DeviceLoginDetailViewModel()
                {
                    Device = new DeviceDto(),
                    WarrantyTypeItems = new List<SelectListItem>(),
                    DeliveryAgentItems = new List<SelectListItem>()
                },
                FaultAccessory = new FaultAccessoryDto(),
                HistoryItems = new List<ImeiHistoryDto>(),
                PopUpload = new PopUploadDto(),
                StandByUnit = new StandByUnitDto()
            };
            try
            {
                // get warranty types
                var warrantyItems = await _warrantyService.GetWarrantyTypesAsync();
                if (warrantyItems != null && warrantyItems.Any())
                {
                    model.LoginDetail.WarrantyTypeItems = warrantyItems.Select(x => new SelectListItem
                    {
                        Text = x.Name,
                        Value = Convert.ToString(x.Id),
                    }).ToList();
                }

                ViewBag.WarrantyTypeItems = model.LoginDetail.WarrantyTypeItems;
                //get forwarder or delivery agent
                var deliveryAgents = await _deliveryService.GetDeliveryAgentsAsync();
                if (deliveryAgents != null && deliveryAgents.Any())
                {
                    model.LoginDetail.DeliveryAgentItems = deliveryAgents.Select(x => new SelectListItem
                    {
                        Text = x.Name,
                        Value = Convert.ToString(x.Code),
                    }).ToList();
                }

                ViewBag.DeliveryAgentItems = model.LoginDetail.DeliveryAgentItems;
            }
            catch (Exception ex)
            {
                model.IsValid = false;
                model.ErrorMessage = $"{WebConstants.NotifyMessage.ContactAdministrator}";
                _logger.Log(_controller, WebConstants.PageRoute.DeviceAuthenticate, ex);
            }

            return View(WebConstants.ViewPage.DeviceLogin, model);
        }

        [HttpGet]
        [Route(WebConstants.PageRoute.DeviceAuthenticate + "/{imeiNumber}")]
        public async Task<IActionResult> AuthenticateAsync(string imeiNumber)
        {
            var model = new DeviceViewModel();
            try
            {
                var isValid = await _deviceService.DeviceAuthenticateAsync(imeiNumber);
                model.IsValid = !isValid;
                model.ErrorMessage = isValid
                    ? $"{WebConstants.NotifyMessage.JobAlreadyOpenForImeiNumber} {imeiNumber}"
                    : string.Empty;
            }
            catch (Exception ex)
            {
                model.IsValid = false;
                model.ErrorMessage = $"{WebConstants.NotifyMessage.ContactAdministrator}";
                _logger.Log(_controller, WebConstants.PageRoute.DeviceAuthenticate, ex);
            }
            return View(WebConstants.ViewPage.DeviceLogin, model);
        }

    }
}
