using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Repository.Dtos
{
    public class JobAllocationDto: BaseDto
    {
        public int? Ageing { get; set; }
        public string EngineerCode { get; set; }
        public string WarrantyType { get; set; }
        public string WarrantyStatus { get; set; }
        public string RmaNumber { get; set; }
        public DateTime? UnitReceivedDate { get; set; }
        public string DoAStatus { get; set; }
    }
}
