using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Repository.Dtos
{
    public class DealerInvoiceDto
    {
        public int Id { get; set; }
        public int InvoiceNumber { get; set; }
        public DateTime? InvoiceDate { get; set; }
        public string RequestReference { get; set; }
        public string LocationPrefix { get; set; }
        public string CollectionPointName { get; set; }
        public string AirwayBillNumber { get; set; }
        public string DeliveryAgent { get; set; }
        public string DeliveryId { get; set; }
        public int? GrvReturn { get; set; }
        public string GrvReturnSupplierName { get; set; }
        public int? SlipReceived { get; set; }
        public DateTime? PreparedDate { get; set; }
        public string CosmosReference { get; set; }
        public string Remarks { get; set; }
        public string UserId { get; set; }
    }
}
