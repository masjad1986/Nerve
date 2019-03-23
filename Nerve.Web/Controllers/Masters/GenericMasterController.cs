using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Routing;
using Nerve.Common;
using Nerve.Common.Enums;
using Nerve.Common.Translations;
using Nerve.Service;
using Nerve.Web.Helpers;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Nerve.Web.Controllers
{
    [Route("[controller]")]
    public class GenericMasterController : Controller
    {
        private const string _controller = "GenericMaster";
        private readonly ILogger _logger;
        private readonly ILanguageTranslator _languageTranslator;
        private readonly IGenericMasterService _genericMasterService;
        private readonly IServiceCentreLocationService _serviceCentreLocationService;
        public GenericMasterController(ILogger logger,
            ILanguageTranslator languageTranslator,
            IGenericMasterService genericMasterService,
            IServiceCentreLocationService serviceCentreLocationService)
        {
            _logger = logger;
            _languageTranslator = languageTranslator;
            _genericMasterService = genericMasterService;
            _serviceCentreLocationService = serviceCentreLocationService;
        }

        #region Product Model Route


        #endregion

        #region Service Centre Route

        /// <summary>
        /// Get list of service centre by their colleciton point,product and brand
        /// </summary>
        /// <param name="collectionPoint"></param>
        /// <param name="brandName"></param>
        /// <param name="productName"></param>
        /// <returns></returns>
        [HttpGet]
        [Route(WebConstants.PageRoute.GetServiceCentreByCollectionPointAndBrandAndProduct + "/{collectionPoint}/{brandName}/{productId}")]
        public async Task<IActionResult> GetServiceCentreByCollectionPointAndBrandAndProductAsync(int collectionPoint, string brandName, string productName)
        {
            try
            {
                var centres = await _serviceCentreLocationService.GetByIdAndBrandAndProductAsync(collectionPoint, productName, brandName);
                return Ok(centres);
            }
            catch (Exception ex)
            {
                _logger.Log(_controller, WebConstants.PageRoute.GetServiceCentreByCollectionPointAndBrandAndProduct, ex);
                var translateItems = await _languageTranslator.TranslateManyAsync(new List<string>
                    {
                        LanguageKeys.Model,
                        LanguageKeys.ContactAdministrator
                    });

                return StatusCode(StatusCodes.Status500InternalServerError,
                    NotificationHelper.GetNotification(translateItems[LanguageKeys.ServiceCentre],
                    translateItems[LanguageKeys.ContactAdministrator],
                    NotificationType.Error));
            }
        }

        #endregion

        #region Fault Code Route

        #endregion
        #region Collection Points Route
        //[HttpGet]
        //[Route(WebConstants.PageRoute.GetCollectionPointByUser + "/{search}")]
        //public async Task<IActionResult> GetCollectionPointByUserAsync(string search)
        //{
        //    try
        //    {
        //        var userId = HttpContext.Session.GetString(SessionKeys.UserId);
        //        var collections = await _genericMasterService.GetCollectionPointByUserIdAsync(userId, search);
        //        return Ok(collections);
        //    }
        //    catch (Exception ex)
        //    {
        //        _logger.Log(_controller, WebConstants.PageRoute.GetCollectionPointByUser, ex);
        //        var translateItems = await _languageTranslator.TranslateManyAsync(new List<string>
        //            {
        //                LanguageKeys.CollectionPoint,
        //                LanguageKeys.ContactAdministrator
        //            });

        //        return StatusCode(StatusCodes.Status500InternalServerError,
        //            NotificationHelper.GetNotification(translateItems[LanguageKeys.CollectionPoint],
        //            translateItems[LanguageKeys.ContactAdministrator],
        //            NotificationType.Error));
        //    }
        //}

        #endregion


    }
}
