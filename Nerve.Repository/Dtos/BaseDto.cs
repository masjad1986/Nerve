using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Repository.Dtos
{
    public class BaseDto
    {
        public string ImeiNumber { get; set; }
        public string TrackingNumber { get; set; }
        public decimal? JobNumber { get; set; }
        public string UserId { get; set; }
        public string Product { get; set; }
        public string ProductName { get; set; }
        public string Brand { get; set; }
        public string BrandName { get; set; }
        public string Model { get; set; }
        public string LocationCode { get; set; }
        public string LocationName { get; set; }
    }
}
