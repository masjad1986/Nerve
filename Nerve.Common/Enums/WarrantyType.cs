using System.ComponentModel;

namespace Nerve.Common.Enums
{
    ////select WarrantyTypeid,WarrantyType from m_WarrantyType
    public enum WarrantyType
    {
        [Description("Warranty")]
        Warranty = 1,

        [Description("Non Warranty")]
        NonWarranty = 2,

        [Description("Service Warranty")]
        ServiceWarranty = 3
    }
}
