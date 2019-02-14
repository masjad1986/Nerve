using System.ComponentModel;

namespace Nerve.Repository.Enums
{
    ////select WarrantyTypeid,WarrantyType from m_WarrantyType
    public enum WarrantyType
    {
        [Description("Warranty")]
        Warranty = 1,

        [Description("Non Warranty")]
        NonWarranty = 2

        //[Description("Service Warranty")]
        //ServiceWarranty = 3
    }

    ///// <summary>
    ///// Warranty type enum.
    ///// </summary>
    //public enum WarrantyType
    //{
    //    Bounce = 1,
    //    Normal = 3
    //}
}
