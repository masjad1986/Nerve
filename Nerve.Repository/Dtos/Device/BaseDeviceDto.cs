using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Repository.Dtos
{
    public class BaseDeviceDto
    {
        public int Id { get; set; }
        public string ImeiNumber { get; set; }
        public string JobNumber { get; set; }
        public string TrackingNumber { get; set; }
        public decimal InvoiceNumber { get; set; }
        public DateTime? InvoiceDate { get; set; }
        public string CollectionPointName { get; set; }
        public string AirwayBillNumber { get; set; }
        public string DeliveryAgent { get; set; }
        public string Remarks { get; set; }
        public string LocationCode { get; set; }
        public string LocationName { get; set; }
        public string ProductName { get; set; }
        public string BrandName { get; set; }
        public string Model { get; set; }
        public int WarrantyType { get; set; }
        public string WarrantyTypeText { get; set; }
        public string RmaNumber { get; set; }
        public string LoginType { get; set; }
        public string LocationPrefix { get; set; }
    }
}
