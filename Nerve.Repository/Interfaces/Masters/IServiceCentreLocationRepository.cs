using Nerve.Common.Dtos;
using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Repository
{
    public interface IServiceCentreLocationRepository
    {
        Task<List<ServiceCentreLocationDto>> GetByIdAsync(int serviceCentreId);
        Task<List<ServiceCentreLocationDto>> GetByIdAndBrandAndProductAsync(int serviceCentreId, string productName, string brandCode);
        Task<List<ItemDto>> GetByUserIdAsync(string userId, string searchAccount);
    }
}
