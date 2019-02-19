using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Repository
{
    public interface IVendorUpdationRepository
    {
        Task<bool> UpdateAsync(string vendorRmaNumber, string imeiNumber, string trackingNumber);
    }
}
