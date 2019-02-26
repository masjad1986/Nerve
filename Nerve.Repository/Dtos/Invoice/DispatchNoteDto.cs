using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Repository.Dtos
{
    public class DispatchNoteDto
    {
        public int Id { get; set; }
        public int? InvoiceNumber { get; set; }
        public string InvoiceDate { get; set; }
        public string DeliveryDate { get; set; }
        public string DeliveryAgent { get; set; }
        public string AirwayBillNumber { get; set; }
        public string Remarks { get; set; }
        public decimal? Quantity { get; set; }
    }
}
