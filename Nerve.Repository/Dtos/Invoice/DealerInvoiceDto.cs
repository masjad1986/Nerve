using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Repository.Dtos
{
    public class DealerInvoiceDto: BaseDeviceDto
    {
        public string RequestReference { get; set; }
        public string DeliveryId { get; set; }
        public int? GrvReturn { get; set; }
        public string GrvReturnSupplierName { get; set; }
        public int? SlipReceived { get; set; }
        public DateTime? PreparedDate { get; set; }
        public string CosmosReference { get; set; }
        public int? InvoiceDetailId { get; set; }
        public string SwapImeiNumber { get; set; }
        public string AllocatedTo { get; set; }
        public string ShipmentDetails { get; set; }
        public decimal? VendorPercent { get; set; }
        public decimal? Cost { get; set; }
        public decimal? CalculatedCost { get; set; }
        public bool Delivery { get; set; }
        public string UserId { get; set; }
    }
}
