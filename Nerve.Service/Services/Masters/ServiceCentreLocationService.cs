using Nerve.Repository.Dtos;
using Nerve.Repository;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Nerve.Common.Dtos;

namespace Nerve.Service
{
    public class ServiceCentreLocationService : IServiceCentreLocationService
    {
        private readonly IServiceCentreLocationRepository _serviceCentreLocationRepository;
        public ServiceCentreLocationService(IServiceCentreLocationRepository serviceCentreLocationRepository)
        {
            _serviceCentreLocationRepository = serviceCentreLocationRepository;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="serviceCentreId"></param>
        /// <returns></returns>
        public async Task<List<ServiceCentreLocationDto>> GetByIdAsync(int serviceCentreId)
        {
            return await _serviceCentreLocationRepository.GetByIdAsync(serviceCentreId);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="serviceCentreId"></param>
        /// <param name="productName"></param>
        /// <param name="brandCode"></param>
        /// <returns></returns>
        public async Task<List<ServiceCentreLocationDto>> GetByIdAndBrandAndProductAsync(int serviceCentreId, string productName, string brandCode)
        {
            return await _serviceCentreLocationRepository.GetByIdAndBrandAndProductAsync(serviceCentreId, productName, brandCode);
        }

        public async Task<List<ItemDto>> GetByUserIdAsync(string userId, string searchAccount)
        {
            return await _serviceCentreLocationRepository.GetByUserIdAsync(userId, searchAccount);
        }
    }
}
