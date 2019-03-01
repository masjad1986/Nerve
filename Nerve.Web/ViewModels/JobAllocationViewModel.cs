using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Nerve.Web.ViewModels
{
    public class JobAllocationViewModel
    {
        public JobAllocationDto JobAllocation { get; set; }
        public PageActionBarModel PageActionBarModel { get; set; }
        public List<string> SelectedTrackingNumbers { get; set; }
        public List<JobAllocationDto> JobAllocations { get; set; }
    }
}
