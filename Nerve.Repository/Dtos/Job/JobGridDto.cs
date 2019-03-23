using Nerve.Common.Dtos.Grid;
using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Repository.Dtos
{
    public class JobGridDto : BaseGridDto<JobAllocationDto>
    {
        public string LocationCode { get; set; }
        public decimal? JobNumber { get; set; }
    }
}
