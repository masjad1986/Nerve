using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Repository.Dtos
{
    public class EstimationDto: BaseDto
    {
        public string CustomerType { get; set; }
        public string CustomerId { get; set; }
        public string CustomerName { get; set; }
        public DateTime? Date { get; set; }
        public int? JobStatus { get; set; }
        public UnitDetailDto UnitDetails { get; }
    }
}
