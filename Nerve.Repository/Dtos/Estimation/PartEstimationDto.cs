using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Repository.Dtos
{
    public class PartEstimationDto
    {
        public string PartCode { get; set; }
        public string PartDescription { get; set; }
        public int Quantity { get; set; }
        public string UnitRateFc { get; set; }
        public string UnitRateBc { get; set; }
        public decimal Amount { get; set; }
    }
}
