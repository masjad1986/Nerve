using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Routing;
using Nerve.Common;
using Nerve.Common.Enums;
using Nerve.Common.Helpers;
using Nerve.Common.Translations;
using Nerve.Repository.Dtos;
using Nerve.Repository.Helpers;
using Nerve.Service;
using Nerve.Web.Filters;
using Nerve.Web.Helpers;
using Nerve.Web.ViewModels;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using static Nerve.Web.WebConstants;

namespace Nerve.Web.Controllers
{
    [Route("[controller]")]
    [NerveAuthorize]
    [TypeFilter(typeof(NerveException))]
    public class DeviceController : Controller
    {
        private const string _controller = "Device";
        private readonly ILogger _logger;
        private readonly ILanguageTranslator _languageTranslator;
        private readonly IDeviceService _deviceService;
        private readonly IDeliveryService _deliveryService;
        private readonly IJobService _jobService;
        private readonly IWarrantyService _warrantyService;
        private readonly IProductService _productService;
        private readonly IProductModelService _productModelService;
        private readonly IBrandService _brandService;
        private readonly IGenericMasterService _genericMasterService;
        private readonly IServiceCentreLocationService _serviceCentreLocationService;
        private readonly IAccessoryDetailService _accessoryDetailService;
        private readonly IUserService _userService;
        public DeviceController(
            ILanguageTranslator languageTranslator,
            ILogger logger,
            IDeviceService deviceService,
            IDeliveryService deliveryService,
            IJobService jobService,
            IWarrantyService warrantyService,
            IProductService productService,
            IProductModelService productModelService,
            IBrandService brandService,
            IGenericMasterService genericMasterService,
            IServiceCentreLocationService serviceCentreLocationService,
            IAccessoryDetailService accessoryDetailService,
            IUserService userService)
        {
            _logger = logger;
            _languageTranslator = languageTranslator;
            _deviceService = deviceService;
            _deliveryService = deliveryService;
            _jobService = jobService;
            _warrantyService = warrantyService;
            _productService = productService;
            _productModelService = productModelService;
            _brandService = brandService;
            _genericMasterService = genericMasterService;
            _serviceCentreLocationService = serviceCentreLocationService;
            _accessoryDetailService = accessoryDetailService;
            _userService = userService;
        }

        [HttpGet]
        [Route("Index/{id?}")]
        public async Task<IActionResult> Index(int? id)
        {
            HttpContext.Session.SetInt32(SessionKeys.CurrentMenuId, id ?? 0);
            var model = new DeviceViewModel()
            {
                Device = new DeviceDto() { Type = (int)Common.Enums.Type.Normal },
                WarrantyTypeItems = new List<SelectListItem>(),
                DeliveryAgentItems = new List<SelectListItem>(),
                PageActionBarModel = new PageActionBarModel
                {
                    ActionPrefix = "device",
                    HasDeleteActionAccess = WebConstants.HasDeleteActionOptionAccess,
                    MenuId = id ?? 0,
                    ActionName = "",
                    ControllerName = "",
                    UndoActionUrl = Url.Action("Index", "Device") + "?id=" + id
                }
            };

            //remove after testing
            //model.Device = LoadDevice();
            // get types
            var typeItems = await _warrantyService.GetTypesAsync();
            if (typeItems != null && typeItems.Any())
            {
                model.TypeItems = typeItems.Select(x => new SelectListItem
                {
                    Text = x.Name,
                    Value = Convert.ToString(x.Id)
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
                    new SelectListItem("Warranty", Convert.ToString((int)WarrantyType.Warranty)),
                    new SelectListItem("Non-Warranty", Convert.ToString((int)WarrantyType.NonWarranty))
                };
            //get list of physical condition
            var conditions = await _genericMasterService.GetPhysicalConditionsAsync();
            model.PhysicalConditionItems = new List<SelectListItem>();
            if (conditions != null && conditions.Any())
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

            return View(WebConstants.ViewPage.DeviceLogin, model);
        }

        [HttpGet]
        [Route(WebConstants.PageRoute.DeviceAuthenticate + "/{imeiNumber}")]
        public async Task<bool> AuthenticateAsync(string imeiNumber)
        {
            var result = await _deviceService.DeviceAuthenticateAsync(imeiNumber);
            return result;
        }

        /// <summary>
        /// Get partial view to show collection points.
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        [HttpGet]
        [Route(WebConstants.PageRoute.DeviceCollectionPoint + "/{search?}")]
        public async Task<PartialViewResult> CollectionPointAsync(string search)
        {
            try
            {
                var userId = HttpContext.Session.GetString(SessionKeys.UserId);
                var collections = await _serviceCentreLocationService.GetByUserIdAsync(userId, search);
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
        /// Generate tacking prefix based on service centre or collection point.
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route(WebConstants.PageRoute.GetTrackingPrefix)]
        public async Task<IActionResult> GetTrackingNumberAsync()
        {
            try
            {
                var userId = HttpContext.Session.GetString(SessionKeys.UserId);
                var prefix = await _userService.GetTrackingPrefixByUserIdAsync(userId);
                if (string.IsNullOrEmpty(prefix))
                {
                    throw new InvalidOperationException();
                }
                //get tracking number 
                var trackingNumber = await _genericMasterService.GetAutoGeneratedTrackingNumberAsync(DateTime.Now.Year, prefix);
                if (string.IsNullOrEmpty(trackingNumber))
                {
                    throw new InvalidOperationException();
                }


                return Ok(trackingNumber);
            }
            catch (Exception ex)
            {
                _logger.Log(_controller, WebConstants.PageRoute.GetTrackingPrefix, ex);
                var translateItems = await _languageTranslator.TranslateManyAsync(new List<string>
                    {
                        LanguageKeys.DeviceLogin,
                        LanguageKeys.ContactAdministrator
                    });

                TempData[WebConstants.TempDataKeys.Notification] = NotificationHelper.GetJsonNotification(translateItems[LanguageKeys.DeviceLogin],
                    translateItems[LanguageKeys.ContactAdministrator],
                    NotificationType.Error);

                return StatusCode((int)HttpStatusCode.InternalServerError, string.Empty);
            }
        }

        /// <summary>
        /// Save device information.
        /// </summary>
        /// <param name="deviceDto"></param>
        /// <returns></returns>
        [HttpPost]
        [Route(WebConstants.PageRoute.Save)]
        public async Task<IActionResult> SaveAsync(DeviceViewModel deviceViewModel)
        {
            var deviceDto = deviceViewModel.Device;
            var translateItems = new Dictionary<string, string>();
            try
            {
                if (!ModelState.IsValid)
                {
                    return View(WebConstants.ViewPage.DeviceLogin, deviceViewModel);
                }

                translateItems = await _languageTranslator.TranslateManyAsync(new List<string>
                {
                    LanguageKeys.DeviceLogin,
                    LanguageKeys.ContactAdministrator,
                    LanguageKeys.SaveDeviceMessage,
                    LanguageKeys.JobAlreadyOpenForImeiNumber
                });

                //authenticate device
                var result = await _deviceService.DeviceAuthenticateAsync(deviceDto.ImeiNumber);
                if (result)
                {
                    throw new InvalidOperationException(translateItems[LanguageKeys.JobAlreadyOpenForImeiNumber]);
                }

                //If product=MOBILE PHONES and brand= HUAWEI then imeino should be 16 Characters 
                if (deviceDto.ProductName.ToUpper().Equals(WebConstants.ProductMobilePhone)
                        && deviceDto.BrandName.ToUpper().Equals(WebConstants.BrandHuawei)
                        && deviceDto.ImeiNumber.Length != WebConstants.ImeiLength)
                {
                    throw new InvalidOperationException(await _languageTranslator.TranslateAsync(LanguageKeys.ErrorInvalidImeiLength));
                }

                //POP Date: Not Null, Previous Date, Less than expiry date
                if (!DateHelper.CompareDate(deviceDto.PopDate.Value, deviceDto.ExpiryDate.Value, CompareType.LessThan))
                {
                    throw new InvalidOperationException(await _languageTranslator.TranslateAsync(LanguageKeys.ErrorPopDateShouldLessThan));
                }

                //Set warranty type = warranty if expiry date greater than current date else set as non-warranty
                if (!DateHelper.CompareDate(DateTime.Now, deviceDto.ExpiryDate.Value, CompareType.GreaterThan))
                {
                    deviceDto.WarrantyType = (int)WarrantyType.NonWarranty;
                }

                //Set Type as Bounce if last job date [max dispatchdate in DEALERLOG for the same imeino] is within last 15 days
                var lastJob = await _jobService.GetLastJobByImeiNumberAsync(deviceDto.ImeiNumber);
                if (lastJob != null && DateTime.Now.Subtract(lastJob.Value).Days <= WebConstants.WarrantyBounceDays)
                {
                    deviceDto.Type = (int)Common.Enums.Type.Bounce;
                }

                deviceDto.CollectionDate = deviceDto.TrackingDate = DateTime.Now;

                //Persian Calender
                var persianCalender = new PersianCalendar();
                deviceDto.FarsiDate = persianCalender.ToDateTime(deviceDto.TrackingDate.Value.Year, deviceDto.TrackingDate.Value.Month, deviceDto.TrackingDate.Value.Day,
                    deviceDto.TrackingDate.Value.Hour, deviceDto.TrackingDate.Value.Minute, deviceDto.TrackingDate.Value.Second, deviceDto.TrackingDate.Value.Millisecond);


                deviceDto.LoginType = WebConstants.LoginType;
                var userId = HttpContext.Session.GetString(SessionKeys.UserId);
                result = await _deviceService.SaveAsync(userId, deviceDto);
            }
            catch (InvalidOperationException iex)
            {
                var title = await _languageTranslator.TranslateAsync(LanguageKeys.ValidationFailureSummary);
                TempData[WebConstants.TempDataKeys.Notification] = NotificationHelper.GetJsonNotification(title, iex.Message, NotificationType.Error);
                deviceViewModel = await PrepareDeviceModelAsync(deviceViewModel);
                return View(WebConstants.ViewPage.DeviceLogin, deviceViewModel);
            }

            TempData[WebConstants.TempDataKeys.Notification] = NotificationHelper.GetJsonNotification(translateItems[LanguageKeys.DeviceLogin],
                    translateItems[LanguageKeys.SaveDeviceMessage],
                    NotificationType.Success);

            return RedirectToAction("Index", new { id = HttpContext.Session.GetInt32(SessionKeys.CurrentMenuId) });
        }

        [NonAction]
        private DeviceDto LoadDevice()
        {
            return new DeviceDto
            {
                CustomerAddress = "Delhi",
                FaultDetail = "Color Issue",
                VendorRmaNumber = "RMA00001",
                PostalCode = "100012",
                PopDate = DateTime.Parse("01/01/2019"),
                TrackingDate = DateTime.Now,
                CustomerName = "Asjad",
                LastName = "Idrisi",
                FarsiName = "Asjad",
                TelephoneNumber = "",
                MobileNumber = "+9898912009827",
                Email = "test@gmail.com",
                NationalId = "91",
                Notes = "Device",
                ExpiryDate = DateTime.Parse("01/11/2019"),
                Date = DateTime.Parse("01/01/2019"),
                EcoCode = "91",
                ImeiNumber = "IMEI000000000001",

            };
        }

        /// <summary>
        /// Prepare device model drop down values.
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        private async Task<DeviceViewModel> PrepareDeviceModelAsync(DeviceViewModel model)
        {
            // get types
            var typeItems = await _warrantyService.GetTypesAsync();
            if (typeItems != null && typeItems.Any())
            {
                model.TypeItems = typeItems.Select(x => new SelectListItem
                {
                    Text = x.Name,
                    Value = Convert.ToString(x.Id),
                    Selected = model.Device.Type == x.Id
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
                    Selected = Convert.ToString(x.Code) == model.Device.Forwarder
                }).ToList();
            }
            //get list of products
            var products = await _productService.GetAllAsync();
            model.ProductItems = new List<SelectListItem>();
            if (products != null && products.Any())
            {
                model.ProductItems = products.Select(x => new SelectListItem
                {
                    Text = x.Name,
                    Value = Convert.ToString(x.Id),
                    Selected = x.Id == model.Device.Product
                }).ToList();
            }

            //get list of brands
            var brands = await _brandService.GetAllByProductNameAsync(model.Device.ProductName);
            model.BrandItems = new List<SelectListItem>();
            if (brands != null && brands.Any())
            {
                model.BrandItems = brands.Select(x => new SelectListItem
                {
                    Text = x.Name,
                    Value = Convert.ToString(x.Code),
                    Selected = Convert.ToString(x.Code) == model.Device.BrandCode
                }).ToList();
            }

            //get list of model
            var models = await _productModelService.GetByProductNameAndBrandNameAsync(model.Device.ProductName, model.Device.BrandName);
            model.ModelItems = new List<SelectListItem>();
            if (models != null && models.Any())
            {
                model.ModelItems = models.Select(x => new SelectListItem
                {
                    Text = x.Name,
                    Value = Convert.ToString(x.Code),
                    Selected = Convert.ToString(x.Code) == model.Device.Model
                }).ToList();
            }

            var centres = new List<ServiceCentreLocationDto>();

            centres = await _serviceCentreLocationService
                .GetByIdAndBrandAndProductAsync(Convert.ToInt32(model.Device.CollectionPoint), model.Device.ProductName, model.Device.BrandName);

            //get list of service centre
            model.ServiceCentreItems = new List<SelectListItem>();
            //get list of transfer to
            model.TransferItems = new List<SelectListItem>();

            if (centres != null && centres.Any())
            {
                model.ServiceCentreItems = centres.Select(x => new SelectListItem
                {
                    Text = x.LocationName,
                    Value = Convert.ToString(x.ServiceCenterId),
                    Selected = x.ServiceCenterId == model.Device.ServiceCentre
                }).ToList();


                model.TransferItems = centres.Select(x => new SelectListItem
                {
                    Text = x.LocationName,
                    Value = Convert.ToString(x.ServiceCenterId),
                    Selected = x.ServiceCenterId == model.Device.TransferTo
                }).ToList();
            }

            //get list of warranty type
            model.WarrantyTypeItems = new List<SelectListItem>() {
                    new SelectListItem("Warranty", Convert.ToString((int)WarrantyType.Warranty)),
                    new SelectListItem("Non-Warranty", Convert.ToString((int)WarrantyType.NonWarranty))
                };
            //get list of physical condition
            var conditions = await _genericMasterService.GetPhysicalConditionsAsync();
            model.PhysicalConditionItems = new List<SelectListItem>();
            if (conditions != null && conditions.Any())
            {
                model.PhysicalConditionItems = conditions.Select(x => new SelectListItem
                {
                    Text = $"{x.Description} ({x.FarsiDescription})",
                    Value = Convert.ToString(x.Id),
                    Selected = Convert.ToString(x.Id) == model.Device.PhysicalCondition
                }).ToList();
            }

            //get list of fault code
            var faultCodes = await _genericMasterService.GetFaultCodesByBrandAsync(model.Device.BrandName);
            model.FaultCodeItems = new List<SelectListItem>();
            if (faultCodes != null && faultCodes.Any())
            {
                model.FaultCodeItems = faultCodes.Select(x => new SelectListItem
                {
                    Text = x.Name,
                    Value = Convert.ToString(x.Code),
                    Selected = Convert.ToString(x.Code) == model.Device.FaultCode
                }).ToList();
            }
            //get list of accessories
            var accessories = await _accessoryDetailService.GetByProductAndBrandAsync(model.Device.ProductName, model.Device.BrandName);
            model.AccessoryItems = new List<SelectListItem>();
            if (accessories != null && accessories.Count > 0)
            {
                model.AccessoryItems = accessories.Select(x => new SelectListItem
                {
                    Text = x.Description,
                    Value = Convert.ToString(x.Id),
                    Selected = model.Device.AccessoriesIds != null && model.Device.AccessoriesIds.Contains(x.Id)
                }).ToList();

            }

            var menu = HttpContext.Session.GetInt32(WebConstants.SessionKeys.CurrentMenuId);
            var undoUrl = Url.Action("Index", "Device") + "?id=" + menu;
            model.PageActionBarModel = new PageActionBarModel
            {
                ActionPrefix = "device",
                HasDeleteActionAccess = WebConstants.HasDeleteActionOptionAccess,
                MenuId = menu ?? 0,
                ActionName = "",
                ControllerName = "",
                UndoActionUrl = undoUrl
            };

            return model;
        }
    }

}
