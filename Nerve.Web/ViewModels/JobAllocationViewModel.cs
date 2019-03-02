﻿using Microsoft.AspNetCore.Mvc.Rendering;
using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Nerve.Web.ViewModels
{
    public class JobAllocationViewModel
    {
        public bool ShowTodayJobs { get; set; }
        public bool ShowPendingJobs { get; set; }
        public JobAllocationDto JobAllocation { get; set; }
        public PageActionBarModel PageActionBarModel { get; set; }
        public List<string> SelectedTrackingNumbers { get; set; }
        public List<JobAllocationDto> JobAllocations { get; set; }
        public List<SelectListItem> Products { get; set; }
        public List<SelectListItem> Brands { get; set; }
        public List<SelectListItem> Models { get; set; }
        public List<SelectListItem> Locations { get; set; }
        public List<SelectListItem> Engineers { get; set; }
        public bool IsSaveRequest { get; set; }
    }
}