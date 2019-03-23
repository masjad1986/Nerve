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
        public string Date { get; set; }
        public string EngineerCode { get; set; }
        public string ExpectedDeliveryDate { get; set; }
        public bool IsModelLinking { get; set; }
        public bool IsLiquidDamge { get; set; }
        public int? JobStatus { get; set; }
        public string Remarks { get; set; }
        public int? TotalItems { get; set; }
        public decimal? RepairCharges { get; set; }
        public decimal? Discount { get; set; }
        public decimal? Amount { get; set; }
        public decimal? SalesTax { get; set; }
        public decimal? NetAmount { get; set; }
        public int? Stock { get; set; }
        public UnitDetailDto UnitDetail { get; }
    }
}
