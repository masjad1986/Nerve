using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Service
{
    public interface IServiceCentreLocationService
    {
        Task<IEnumerable<ServiceCentreLocationDto>> GetByIdAsync(int serviceCentreId);
        Task<IEnumerable<ServiceCentreLocationDto>> GetByIdAndBrandAndProductAsync(int serviceCentreId, int productName, string brandCode);
    }
}
