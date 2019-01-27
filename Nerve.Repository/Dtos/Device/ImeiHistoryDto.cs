using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Repository.Dtos
{
    public class ImeiHistoryDto
    {
        public string CollectionPointCode { get; set; }
        public string CollectionPointName { get; set; }
        public string TrackingNumber { get; set; }
        public string LogDate { get; set; }
        public string DispatchDate { get; set; }
        public string CustomerName { get; set; }
        public string Brand { get; set; }
    }
}
