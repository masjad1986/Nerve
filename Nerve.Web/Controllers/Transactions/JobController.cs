using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Nerve.Common;
using Nerve.Common.Enums;
using Nerve.Common.Translations;
using Nerve.Repository.Dtos;
using Nerve.Service;
using Nerve.Web.Filters;
using Nerve.Web.Helpers;
using Nerve.Web.ViewModels;

namespace Nerve.Web.Controllers
{
    [NerveAuthorize]
    [TypeFilter(typeof(NerveException))]
    [Route("[controller]")]
    public class JobController : Controller
    {
        private readonly ILogger _logger;
        private readonly ILanguageTranslator _languageTranslator;
        private readonly IJobService _jobService;
        private readonly IProductService _productService;
        private readonly IBrandService _brandService;
        private readonly IEngineerService _engineerService;
        private readonly ILocationService _locationService;
        private readonly IGenericMasterService _genericMasterService;
        public JobController(ILogger logger,
            ILanguageTranslator languageTranslator,
            IJobService jobService,
            IProductService productService,
            IBrandService brandService,
            IEngineerService engineerService,
            ILocationService locationService,
            IGenericMasterService genericMasterService)
        {
            _logger = logger;
            _languageTranslator = languageTranslator;
            _jobService = jobService;
            _brandService = brandService;
            _engineerService = engineerService;
            _genericMasterService = genericMasterService;
            _locationService = locationService;
            _productService = productService;

        }

        /// <summary>
        /// Job allocation.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        [Route(WebConstants.PageRoute.JobAllocation + "/{id?}")]
        public async Task<IActionResult> JobAllocationAsync(int? id)
        {
            HttpContext.Session.SetInt32(WebConstants.SessionKeys.CurrentMenuId, id ?? 0);
            var defaultLocation = HttpContext.Session.GetString(WebConstants.SessionKeys.DefaultStockLocation);
            var jobAllocationViewModel = new JobAllocationViewModel
            {
                JobAllocation = new JobAllocationDto(),
                PageActionBarModel = new PageActionBarModel
                {
                    ActionPrefix = LanguageKeys.JobAllocation,
                    HasDeleteActionAccess = WebConstants.HasDeleteActionOptionAccess,
                    MenuId = id ?? 0,
                    ControllerName = WebConstants.Controllers.Job,
                    UndoActionUrl = Url.Action(WebConstants.PageRoute.JobAllocation, WebConstants.Controllers.Job) + "?id=" + id,
                    AdditionalMenus = new List<ActionBarMenuItem>
                        {
                            new ActionBarMenuItem { Name = "find", Icon="search", TranslateKey =LanguageKeys.Find},
                            new ActionBarMenuItem { Name = "clear", Icon="remove", TranslateKey = LanguageKeys.Clear},
                            new ActionBarMenuItem { Name = "audit", Icon="file", TranslateKey = LanguageKeys.Audit}
                        }
                }
            };

            jobAllocationViewModel.JobAllocation.LocationCode = defaultLocation;

            var allocations = await _jobService.GetPendingJobAllocationByParamsAsync(jobAllocationViewModel.JobAllocation);
            jobAllocationViewModel.JobAllocations = allocations;

            //locations
            var locations = await _locationService.GetAllAsync();
            jobAllocationViewModel.Locations = new List<SelectListItem>();
            if (locations != null && locations.Any())
            {
                jobAllocationViewModel.Locations = locations.Select(x => new SelectListItem
                {
                    Text = $"{x.Name} ({x.Code})",
                    Value = Convert.ToString(x.Code),
                    Selected = jobAllocationViewModel.JobAllocation.LocationCode == x.Code.Trim()
                }).ToList();
            }

            //engineers
            var engineers = await _engineerService.GetByLocationAsync(jobAllocationViewModel.JobAllocation.LocationCode);
            jobAllocationViewModel.Engineers = new List<SelectListItem>();
            if (engineers != null && engineers.Any())
            {
                jobAllocationViewModel.Engineers = engineers.Select(x => new SelectListItem
                {
                    Text = $"{x.Name} ({x.Code})",
                    Value = Convert.ToString(x.Code),
                    Selected = jobAllocationViewModel.JobAllocation.EngineerCode == x.Code.Trim()
                }).ToList();
            }

            //products
            var products = await _productService.GetAllAsync();
            jobAllocationViewModel.Products = new List<SelectListItem>();
            if (products != null && products.Any())
            {
                jobAllocationViewModel.Products = products.Select(x => new SelectListItem
                {
                    Text = x.Name,
                    Value = Convert.ToString(x.Id),
                }).ToList();
            }

            jobAllocationViewModel.Brands = new List<SelectListItem>();
            jobAllocationViewModel.Models = new List<SelectListItem>();

            return View(WebConstants.ViewPage.JobAllocation, jobAllocationViewModel);
        }

        [HttpPost]
        [Route(WebConstants.PageRoute.JobAllocation)]
        public async Task<IActionResult> JobAllocationAsync(JobAllocationViewModel jobAllocationViewModel)
        {
            var id = HttpContext.Session.GetInt32(WebConstants.SessionKeys.CurrentMenuId);

            if (jobAllocationViewModel.IsSaveRequest)
            {
                jobAllocationViewModel.JobAllocation.UserId = HttpContext.Session.GetString(WebConstants.SessionKeys.UserId);
                await _jobService.SaveJobAllocationAsync(jobAllocationViewModel.JobAllocation, jobAllocationViewModel.SelectedTrackingNumbers);

                var translateItems = await _languageTranslator.TranslateManyAsync(new List<string>
                    {
                        LanguageKeys.JobAllocation,
                        LanguageKeys.SaveRecordMessage
                    });

                TempData[WebConstants.TempDataKeys.Notification] = NotificationHelper.GetJsonNotification(translateItems[LanguageKeys.JobAllocation],
                translateItems[LanguageKeys.SaveRecordMessage],
                NotificationType.Success);

                return RedirectToAction(WebConstants.PageRoute.JobAllocation, new { id });
            }
            else
            {
                if (string.IsNullOrEmpty(jobAllocationViewModel.JobAllocation.LocationCode))
                    jobAllocationViewModel.JobAllocation.LocationCode = HttpContext.Session.GetString(WebConstants.SessionKeys.DefaultStockLocation);

                jobAllocationViewModel.PageActionBarModel = new PageActionBarModel
                {
                    ActionPrefix = LanguageKeys.JobAllocation,
                    HasDeleteActionAccess = WebConstants.HasDeleteActionOptionAccess,
                    MenuId = id ?? 0,
                    ControllerName = WebConstants.Controllers.Job,
                    UndoActionUrl = Url.Action(WebConstants.PageRoute.JobAllocation, WebConstants.Controllers.Job) + "?id=" + id,
                    AdditionalMenus = new List<ActionBarMenuItem>
                        {
                            new ActionBarMenuItem { Name = "find", Icon="search", TranslateKey =LanguageKeys.Find},
                            new ActionBarMenuItem { Name = "clear", Icon="remove", TranslateKey = LanguageKeys.Clear},
                            new ActionBarMenuItem { Name = "audit", Icon="file", TranslateKey = LanguageKeys.Audit}
                        }
                };

                var allocations = new List<JobAllocationDto>();

                if (jobAllocationViewModel.ShowTodayJobs)
                    allocations = await _jobService.GetPendingJobAllocationByDateAsync(jobAllocationViewModel.JobAllocation, DateTime.Now);
                else
                    allocations = await _jobService.GetPendingJobAllocationByParamsAsync(jobAllocationViewModel.JobAllocation, jobAllocationViewModel.ShowPendingJobs);
                jobAllocationViewModel.JobAllocations = allocations;

                //locations
                var locations = await _locationService.GetAllAsync();
                jobAllocationViewModel.Locations = new List<SelectListItem>();
                if (locations != null && locations.Any())
                {
                    jobAllocationViewModel.Locations = locations.Select(x => new SelectListItem
                    {
                        Text = $"{x.Name} ({x.Code})",
                        Value = Convert.ToString(x.Code),
                        Selected = jobAllocationViewModel.JobAllocation.LocationCode == x.Code.Trim()
                    }).ToList();
                }

                //engineers
                var engineers = await _engineerService.GetByLocationAsync(jobAllocationViewModel.JobAllocation.LocationCode);
                jobAllocationViewModel.Engineers = new List<SelectListItem>();
                if (engineers != null && engineers.Any())
                {
                    jobAllocationViewModel.Engineers = engineers.Select(x => new SelectListItem
                    {
                        Text = $"{x.Name} ({x.Code})",
                        Value = Convert.ToString(x.Code),
                        Selected = jobAllocationViewModel.JobAllocation.EngineerCode == x.Code.Trim()
                    }).ToList();
                }

                //products
                var products = await _productService.GetAllAsync();
                jobAllocationViewModel.Products = new List<SelectListItem>();
                if (products != null && products.Any())
                {
                    jobAllocationViewModel.Products = products.Select(x => new SelectListItem
                    {
                        Text = x.Name,
                        Value = Convert.ToString(x.Id),
                        Selected = jobAllocationViewModel.JobAllocation.Product == Convert.ToString(x.Id)
                    }).ToList();
                }

                //brands
                var brands = await _brandService.GetAllByProductNameAsync(jobAllocationViewModel.JobAllocation.ProductName);
                jobAllocationViewModel.Brands = new List<SelectListItem>();
                if (brands != null && brands.Any())
                {
                    jobAllocationViewModel.Brands = brands.Select(x => new SelectListItem
                    {
                        Text = x.Name,
                        Value = Convert.ToString(x.Code),
                        Selected = jobAllocationViewModel.JobAllocation.Brand == Convert.ToString(x.Code)
                    }).ToList();
                }

                //models
                var models = await _genericMasterService.GetProductModelByNameAndBrandAsync(jobAllocationViewModel.JobAllocation.ProductName,
                    jobAllocationViewModel.JobAllocation.BrandName);

                jobAllocationViewModel.Models = new List<SelectListItem>();
                if (models != null && models.Any())
                {
                    jobAllocationViewModel.Models = models.Select(x => new SelectListItem
                    {
                        Text = x.Name,
                        Value = Convert.ToString(x.Code),
                        Selected = jobAllocationViewModel.JobAllocation.Model == Convert.ToString(x.Code)
                    }).ToList();
                }

                return View(WebConstants.ViewPage.JobAllocation, jobAllocationViewModel);
            }
        }
    }
}
