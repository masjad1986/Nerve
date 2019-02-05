using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Repository.Dtos
{
    /// <summary>
    /// Information:
    /// Database: SCP 
    /// Table : M_ServiceCenter_Location
    /// </summary>
    public class ServiceCentreDto
    {
        /// <summary>
        /// Mapped with ServiceCentreId Database Column
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// Mapped with LocationName Database Column
        /// </summary>
        public string Name { get; set; }
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public string BrandCode { get; set; }
    }
}
