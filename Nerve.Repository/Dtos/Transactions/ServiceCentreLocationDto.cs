using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Repository.Dtos
{
    /// <summary>
    /// SCPM_ServiceCenter_Location
    /// </summary>
    public class ServiceCentreLocationDto
    {
        public int ServiceCenterId { get; set; }
        public string LocationCode { get; set; }
        public string LocationName { get; set; }
        public int? DetailId { get; set; }
        public int? ProductId { get; set; }
        public string ProductName { get; set; }
        public string BrandCode { get; set; }
        /// <summary>
        /// Laptop_VendorMaster refer City
        /// </summary>
        public string City { get; set; }

        /// <summary>
        /// Laptop_VendorMaster refer Country
        /// </summary>
        public string Country { get; set; }
    }
}
