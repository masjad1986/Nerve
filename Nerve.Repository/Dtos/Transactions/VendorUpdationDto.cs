using System;
namespace Nerve.Repository.Dtos
{
    public class VendorUpdationDto
    {
        public string JobNumber { get; set; }
        public string ImeiNumber { get; set; }
        public string CollectionPointName { get; set; }
        public string TrackingNumber { get; set; }
        public DateTime? TrackingDate { get; set; }
        public string CrnNumber { get; set; }
        public string ProductName { get; set; }
        public string BrandName { get; set; }
        public string Model { get; set; }
        public string VendorRmaNumber { get; set; }
        public string LocationCode { get; set; }
        public string LocationName { get; set; }
        public string CustomerName { get; set; }
    }
}
