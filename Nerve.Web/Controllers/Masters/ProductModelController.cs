using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Nerve.Common;
using Nerve.Common.Enums;
using Nerve.Common.Translations;
using Nerve.Service;
using Nerve.Web.Filters;
using Nerve.Web.Helpers;

namespace Nerve.Web.Controllers
{
    [NerveAuthorize]
    [TypeFilter(typeof(NerveException))]
    [Route("[controller]")]
    public class ProductModelController : Controller
    {
        private readonly ILogger _logger;
        private readonly ILanguageTranslator _languageTranslator;
        private readonly IProductModelService _productModelService;
        public ProductModelController(ILogger logger,
            ILanguageTranslator languageTranslator,
            IProductModelService productModelService)
        {
            _logger = logger;
            _languageTranslator = languageTranslator;
            _productModelService = productModelService;
        }

        /// <summary>
        /// Get list of model by product and brand
        /// </summary>
        /// <param name="brandName">Name of the brand.</param>
        /// <param name="productName">Name of the product.</param>
        /// <returns></returns>
        [HttpGet]
        [Route(WebConstants.PageRoute.GetOptionByBrandAndProductAndCollectionPoint + "/{brandName}/{productName}")]
        public async Task<IActionResult> GetModelByBrandAndProductAsync(string brandName, string productName)
        {
            try
            {
                var models = await _productModelService.GetByProductNameAndBrandNameAsync(productName, brandName);
                return Ok(models);
            }
            catch (Exception ex)
            {
                _logger.Log(WebConstants.Controllers.ProductModel, WebConstants.PageRoute.GetOptionByBrandAndProductAndCollectionPoint, ex);
                var translateItems = await _languageTranslator.TranslateManyAsync(new List<string>
                    {
                        LanguageKeys.Model,
                        LanguageKeys.ContactAdministrator
                    });

                return StatusCode(StatusCodes.Status500InternalServerError,
                    NotificationHelper.GetNotification(translateItems[LanguageKeys.Model],
                    translateItems[LanguageKeys.ContactAdministrator],
                    NotificationType.Error));
            }
        }
    }
}
