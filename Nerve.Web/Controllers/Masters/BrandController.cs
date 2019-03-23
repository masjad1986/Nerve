using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Routing;
using Nerve.Common;
using Nerve.Common.Enums;
using Nerve.Common.Translations;
using Nerve.Repository.Dtos;
using Nerve.Service;
using Nerve.Web.Filters;
using Nerve.Web.Helpers;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Nerve.Web.Controllers
{
    [NerveAuthorize]
    [TypeFilter(typeof(NerveException))]
    [Route("[controller]")]
    public class BrandController : Controller
    {
        private const string _controller = "Brand";
        private readonly ILogger _logger;
        private readonly ILanguageTranslator _languageTranslator;
        private readonly IBrandService _brandService;
        private readonly IProductModelService _productModelService;
        private readonly IGenericMasterService _genericMasterService;
        private readonly IServiceCentreLocationService _serviceCentreLocationService;
        private readonly IAccessoryDetailService _accessoryDetailService;

        public BrandController(ILogger logger,
            ILanguageTranslator languageTranslator,
            IBrandService brandService,
            IProductModelService productModelService,
            IGenericMasterService genericMasterService,
            IServiceCentreLocationService serviceCentreLocationService,
            IAccessoryDetailService accessoryDetailService)
        {
            _logger = logger;
            _languageTranslator = languageTranslator;
            _brandService = brandService;
            _productModelService = productModelService;
            _genericMasterService = genericMasterService;
            _serviceCentreLocationService = serviceCentreLocationService;
            _accessoryDetailService = accessoryDetailService;
        }

        /// <summary>
        /// Get list of brands by product.
        /// </summary>
        /// <param name="productName"></param>
        /// <returns></returns>
        [HttpGet]
        [Route(WebConstants.PageRoute.GetBrandByProductName + "/{productName}")]
        public async Task<IActionResult> GetByProductAsync(string productName)
        {
            try
            {
                var brands = await _brandService.GetAllByProductNameAsync(productName);
                return Ok(brands);
            }
            catch (Exception ex)
            {
                _logger.Log(_controller, WebConstants.PageRoute.GetBrandByProductName, ex);
                var translateItems = await _languageTranslator.TranslateManyAsync(new List<string>
                    {
                        LanguageKeys.Brand,
                        LanguageKeys.ContactAdministrator
                    });

                return StatusCode(StatusCodes.Status500InternalServerError,
                    NotificationHelper.GetNotification(translateItems[LanguageKeys.Brand],
                    translateItems[LanguageKeys.ContactAdministrator],
                    NotificationType.Error));
            }
        }


        /// <summary>
        /// Get option for product model, transfer to, service centre items by collection point, brand and product
        /// </summary>
        /// <param name="brandName"></param>
        /// <param name="productName"></param>
        /// <param name="collectionPoint"></param>
        /// <returns></returns>
        [HttpGet]
        [Route(WebConstants.PageRoute.GetOptionByBrandAndProductAndCollectionPoint + "/{brandName}/{productName}/{collectionPoint?}")]
        public async Task<IActionResult> GetOptionByCollectionAndBrandAndProductAsync(string brandName, string productName, int? collectionPoint)
        {
            try
            {
                var models = await _productModelService.GetByProductNameAndBrandNameAsync(productName, brandName);
                var centres = new List<ServiceCentreLocationDto>();
                if (collectionPoint.HasValue && collectionPoint.Value > 0)
                {
                    centres = await _serviceCentreLocationService
                        .GetByIdAndBrandAndProductAsync(collectionPoint.Value, productName, brandName);
                }

                var faultCodes = await _genericMasterService.GetFaultCodesByBrandAsync(brandName);
                var accessories = await _accessoryDetailService.GetByProductAndBrandAsync(productName, brandName);
                var option = new
                {
                    Models = models,
                    Centres = centres,
                    FaultCodes = faultCodes,
                    Accessories = accessories
                };

                return Ok(option);
            }
            catch (Exception ex)
            {
                _logger.Log(_controller, WebConstants.PageRoute.GetOptionByBrandAndProductAndCollectionPoint, ex);
                var translateItems = await _languageTranslator.TranslateManyAsync(new List<string>
                    {
                        LanguageKeys.Brand,
                        LanguageKeys.ContactAdministrator
                    });

                return StatusCode(StatusCodes.Status500InternalServerError,
                    NotificationHelper.GetNotification(translateItems[LanguageKeys.Brand],
                    translateItems[LanguageKeys.ContactAdministrator],
                    NotificationType.Error));
            }
        }
    }
}
