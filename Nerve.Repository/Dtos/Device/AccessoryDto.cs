using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Repository.Dtos
{
    public class AccessoryDto
    {
        public int Id { get; set; }
        public string Description { get; set; }
        public bool IsSelected { get; set; }
        /// <summary>
        /// Details ID in [M_Detail_Accessories]
        /// </summary>
        public int DetailId { get; set; }

        /// <summary>
        /// Accessory Details ID in [M_Detail_Accessories]
        /// </summary>
        public int AccessoryDetailId { get; set; }

        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public string BrandCode { get; set; }
        public string Deleted { get; set; }
    }
}
