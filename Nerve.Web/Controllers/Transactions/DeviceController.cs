using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Routing;
using Nerve.Repository.Dtos;
using Nerve.Service;
using Nerve.Service.Services.Masters;
using Nerve.Web.Enums;
using Nerve.Web.Filters;
using Nerve.Web.Helpers;
using Nerve.Web.Translation;
using Nerve.Web.ViewModels;
using static Nerve.Web.WebConstants;

namespace Nerve.Web.Controllers
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
        private readonly IProductService _productService;
        private readonly IBrandService _brandService;
        private readonly IGenericMasterService _genericMasterService;
        public DeviceController(
            ILanguageTranslator languageTranslator,
            ILogger logger,
            IDeviceService deviceService,
            IDeliveryService deliveryService,
            IWarrantyService warrantyService,
            IProductService productService,
            IBrandService brandService,
            IGenericMasterService genericMasterService)
        {
            _logger = logger;
            _languageTranslator = languageTranslator;
            _deviceService = deviceService;
            _deliveryService = deliveryService;
            _warrantyService = warrantyService;
            _productService = productService;
            _brandService = brandService;
            _genericMasterService = genericMasterService;
        }

        [HttpGet]
        [Route("Index/{id?}")]
        public async Task<IActionResult> Index()
        {
            var model = new DeviceViewModel()
            {
                Device = new DeviceDto(),
                WarrantyTypeItems = new List<SelectListItem>(),
                DeliveryAgentItems = new List<SelectListItem>()
            };
            try
            {
                // get types
                var typeItems = await _warrantyService.GetTypesAsync();
                if (typeItems != null && typeItems.Any())
                {
                    model.TypeItems = typeItems.Select(x => new SelectListItem
                    {
                        Text = x.Name,
                        Value = Convert.ToString(x.Id),
                    }).ToList();
                }

                //get forwarder or delivery agent
                var deliveryAgents = await _deliveryService.GetDeliveryAgentsAsync();
                if (deliveryAgents != null && deliveryAgents.Any())
                {
                    model.DeliveryAgentItems = deliveryAgents.Select(x => new SelectListItem
                    {
                        Text = x.Name,
                        Value = Convert.ToString(x.Code),
                    }).ToList();
                }

                //get list of brands
                model.BrandItems = new List<SelectListItem>();
                //get list of model
                model.ModelItems = new List<SelectListItem>();
                //get list of service centre
                model.ServiceCentreItems = new List<SelectListItem>();
                //get list of transfer to
                model.TransferItems = new List<SelectListItem>();
                //get list of products
                var products = await _productService.GetAllAsync();
                model.ProductItems = new List<SelectListItem>();
                if (products != null && products.Any())
                {
                    model.ProductItems = products.Select(x => new SelectListItem
                    {
                        Text = x.Name,
                        Value = Convert.ToString(x.Id),
                    }).ToList();
                }
                //get list of warranty type
                model.WarrantyTypeItems = new List<SelectListItem>() {
                    new SelectListItem("Warranty", "W"),
                    new SelectListItem("Non-Warranty", "N")
                };
                //get list of physical condition
                var conditions = await _genericMasterService.GetPhysicalConditionsAsync();
                model.PhysicalConditionItems = new List<SelectListItem>();
                if (conditions!=null && conditions.Any())
                {
                    model.PhysicalConditionItems = conditions.Select(x => new SelectListItem
                    {
                        Text = $"{x.Description} ({x.FarsiDescription})",
                        Value = Convert.ToString(x.Id)
                    }).ToList();
                }

                //get list of fault code
                model.FaultCodeItems = new List<SelectListItem>();
                //get list of accessories
                model.AccessoryItems = new List<SelectListItem>();
            }
            catch (Exception ex)
            {
                model.IsValid = false;
                model.ErrorMessage = $"{LanguageKeys.ContactAdministrator}";
                _logger.Log(_controller, WebConstants.PageRoute.DeviceAuthenticate, ex);
            }

            return View(WebConstants.ViewPage.DeviceLogin, model);
        }

        [HttpGet]
        [Route(WebConstants.PageRoute.DeviceAuthenticate + "/{imeiNumber}")]
        public async Task<bool> AuthenticateAsync(string imeiNumber)
        {
            try
            {
                var result = await _deviceService.DeviceAuthenticateAsync(imeiNumber);
                return result;
            }
            catch (Exception ex)
            {
                _logger.Log(_controller, WebConstants.PageRoute.DeviceAuthenticate, ex);
                var translateItems = await _languageTranslator.TranslateManyAsync(new List<string>
                    {
                        LanguageKeys.DeviceLogin,
                        LanguageKeys.ContactAdministrator
                    });

                TempData[WebConstants.TempDataKeys.Notification] = NotificationHelper.GetJsonNotification(translateItems[LanguageKeys.DeviceLogin],
                    translateItems[LanguageKeys.ContactAdministrator],
                    NotificationType.Error);
            }
            return false;
        }

        /// <summary>
        /// Get partial view to show collection points.
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        [HttpGet]
        [Route(WebConstants.PageRoute.DeviceCollectionPoint)]
        public async Task<PartialViewResult> CollectionPointAsync([FromQuery] string search)
        {
            try
            {
                var userId = HttpContext.Session.GetString(SessionKeys.UserId);
                var collections = await _genericMasterService.GetCollectionPointByUserIdAsync(userId, search);
                return PartialView(WebConstants.ViewPage.Partial.DeviceCollectionPointView, collections);
            }
            catch (Exception ex)
            {
                _logger.Log(_controller, WebConstants.PageRoute.DeviceCollectionPoint, ex);
                var translateItems = await _languageTranslator.TranslateManyAsync(new List<string>
                    {
                        LanguageKeys.DeviceLogin,
                        LanguageKeys.ContactAdministrator
                    });

                TempData[WebConstants.TempDataKeys.Notification] = NotificationHelper.GetJsonNotification(translateItems[LanguageKeys.DeviceLogin],
                    translateItems[LanguageKeys.ContactAdministrator],
                    NotificationType.Error);

                return PartialView(WebConstants.ViewPage.Partial.DeviceCollectionPointView, null);
            }
        }

        /// <summary>
        /// Save device information.
        /// </summary>
        /// <param name="deviceDto"></param>
        /// <returns></returns>
        public async Task<IActionResult> SaveAsync([FromBody] DeviceDto deviceDto)
        {
            deviceDto.LoginType = WebConstants.LoginType;
            var result = await _deviceService.SaveAsync(deviceDto);
            return Ok(result);
        }
    }
}
