using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Nerve.Common;
using Nerve.Common.Dtos;
using Nerve.Common.Enums;
using Nerve.Common.Translations;
using Nerve.Repository.Dtos;
using Nerve.Service;
using Nerve.Web.Filters;
using Nerve.Web.Helpers;
using Nerve.Web.ViewModels;
using static Nerve.Web.WebConstants;

namespace Nerve.Web.Controllers.Transactions
{
    [Route("[controller]")]
    [NerveAuthorize]
    [TypeFilter(typeof(NerveException))]
    public class EstimationController : Controller
    {
        private const string _controller = "Estimation";
        private readonly ILogger _logger;
        private readonly IMapper _mapper;
        private readonly ILanguageTranslator _languageTranslator;
        private readonly IBrandService _brandService;
        private readonly IEstimationService _estimationService;
        private readonly IJobService _jobService;
        private readonly IProductService _productService;

        public EstimationController(ILogger logger,
            ILanguageTranslator languageTranslator,
            IMapper mapper,
            IBrandService brandService,
            IEstimationService estimationService,
            IJobService jobService,
            IProductService productService)
        {
            _logger = logger;
            _languageTranslator = languageTranslator;
            _mapper = mapper;
            _brandService = brandService;
            _estimationService = estimationService;
            _jobService = jobService;
            _productService = productService;
        }

        [HttpGet]
        [Route(WebConstants.PageRoute.Estimation + "/{id?}")]
        public async Task<IActionResult> Index(int? id)
        {
            HttpContext.Session.SetInt32(SessionKeys.CurrentMenuId, id ?? 0);
            var estimationViewModel = new EstimationViewModel
            {
                Estimation = new EstimationDto
                {
                    LocationCode= HttpContext.Session.GetString(SessionKeys.DefaultStockLocation),
                    Date = DateTime.Now.ToShortDateString()
                },
                PartEstimations = new List<PartEstimationDto>() {
                },
                PageActionBarModel = new PageActionBarModel
                {
                    ActionPrefix = LanguageKeys.Estimation,
                    HasDeleteActionAccess = WebConstants.HasDeleteActionOptionAccess,
                    MenuId = id ?? 0,
                    ControllerName = WebConstants.Controllers.Estimation,
                    UndoActionUrl = Url.Action(WebConstants.PageRoute.Estimation, WebConstants.Controllers.Estimation) + "?id=" + id,
                    AdditionalMenus = new List<ActionBarMenuItem>
                        {
                            //new ActionBarMenuItem { Name = "find", Icon="search", TranslateKey =LanguageKeys.Find},
                            //new ActionBarMenuItem { Name = "clear", Icon="remove", TranslateKey = LanguageKeys.Clear},
                            new ActionBarMenuItem { Name = "audit", Icon="file", TranslateKey = LanguageKeys.Audit}
                        }
                }
            };

            var jobStatusTypes = await _jobService.GetJobStatusTypesByItemsAsync(new List<int>() {
                (int)JobStatusType.Open,
                (int)JobStatusType.Cancelled,
                (int)JobStatusType.Estimation,
                (int)JobStatusType.WaitingForPart,
                (int)JobStatusType.CustomerApproved,
                (int)JobStatusType.QcPassed,
                (int)JobStatusType.Invoiced,
                (int)JobStatusType.Delivered
            });
            if (jobStatusTypes != null && jobStatusTypes.Any())
            {
                estimationViewModel.JobStatusItems = _mapper.Map<List<SelectListItem>>(jobStatusTypes);
            }

            estimationViewModel.CustomerTypes = new List<SelectListItem>
            {
                new SelectListItem { Text ="Customer" , Value = "1"},
                new SelectListItem { Text ="Partner" , Value = "2"}
            };

            //products
            var products = await _productService.GetAllAsync();
            estimationViewModel.Products = new List<SelectListItem>();
            if (products != null && products.Any())
            {
                estimationViewModel.Products = products.Select(x => new SelectListItem
                {
                    Text = x.Name,
                    Value = Convert.ToString(x.Id),
                }).ToList();
            }


            estimationViewModel.Brands = new List<SelectListItem>();

            return View(WebConstants.ViewPage.Estimation, estimationViewModel);
        }

        /// <summary>
        /// Save estimation for job number.
        /// </summary>
        /// <param name="estimationViewModel"></param>
        /// <returns></returns>
        [HttpPost]
        [Route(WebConstants.PageRoute.Save)]
        public async Task<IActionResult> SaveAsync(EstimationViewModel estimationViewModel)
        {
            var id = HttpContext.Session.GetInt32(SessionKeys.CurrentMenuId);
            if (estimationViewModel.IsSaveRequest)
            {
                await _estimationService.SaveAsync();
                var translateItems = await _languageTranslator.TranslateManyAsync(new List<string>
                    {
                        LanguageKeys.Estimation,
                        LanguageKeys.SaveRecordMessage
                    });

                TempData[WebConstants.TempDataKeys.Notification] = NotificationHelper.GetJsonNotification(translateItems[LanguageKeys.Estimation],
                translateItems[LanguageKeys.SaveRecordMessage],
                NotificationType.Success);

                return RedirectToAction(WebConstants.PageRoute.Estimation, new { id });
            }

            return View(WebConstants.ViewPage.Estimation, estimationViewModel);
        }

        /// <summary>
        /// Update estimation start date.
        /// </summary>
        /// <param name="locationCode"></param>
        /// <param name="jobNumber"></param>
        /// <returns></returns>
        [HttpGet]
        [Route(WebConstants.PageRoute.UpdateEstimationDate + "/{locationCode}/{jobNumber}")]
        public async Task<IActionResult> UpdateEstimationDateAsync(string locationCode, decimal jobNumber)
        {
            try
            {
                await _estimationService.UpdateEstimationDateAsync(locationCode, jobNumber);
                return Ok();
            }
            catch (Exception ex)
            {
                _logger.Log(WebConstants.Controllers.Estimation, WebConstants.PageRoute.UpdateEstimationDate, ex);
                return StatusCode((int)HttpStatusCode.InternalServerError);
            }
        }

    }
}
