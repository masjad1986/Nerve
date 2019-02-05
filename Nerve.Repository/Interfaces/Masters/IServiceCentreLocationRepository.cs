using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Repository
{
    public interface IServiceCentreLocationRepository
    {
        Task<IEnumerable<ServiceCentreLocationDto>> GetByIdAsync(int serviceCentreId);
        Task<IEnumerable<ServiceCentreLocationDto>> GetByIdAndBrandAndProductAsync(int serviceCentreId, int productId, string brandCode);
    }
}
