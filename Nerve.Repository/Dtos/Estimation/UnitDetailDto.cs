using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Repository.Dtos
{
    public class UnitDetailDto
    {
        public string CustomerType { get; set; }
        public string CollectionPoint { get; set; }
        public string CollectionPointName { get; set; }
        public string ReferenceNumber { get; set; }
        public string MsnNumber { get; set; }
        public string PhysicalCondition { get; set; }
        public string WarrantType { get; set; }
        public string ServiceType { get; set; }
    }
}
