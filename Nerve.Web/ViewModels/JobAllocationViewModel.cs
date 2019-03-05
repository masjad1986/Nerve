using Microsoft.AspNetCore.Mvc.Rendering;
using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Nerve.Web.ViewModels
{
    public class JobAllocationViewModel: OptionViewModel
    {
        public bool ShowTodayJobs { get; set; }
        public bool ShowPendingJobs { get; set; }
        public JobAllocationDto JobAllocation { get; set; }
        public List<string> SelectedTrackingNumbers { get; set; }
        public List<JobAllocationDto> JobAllocations { get; set; }
        public bool IsSaveRequest { get; set; }
    }
}
