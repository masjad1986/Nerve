using Nerve.Repository;
using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Service.Services
{
    public class AccessoryDetailService: IAccessoryDetailService
    {
        private readonly IAccessoryDetailRepository _accessoryDetailRepository;
        public AccessoryDetailService(IAccessoryDetailRepository accessoryDetailRepository)
        {
            _accessoryDetailRepository = accessoryDetailRepository;
        }

        /// <summary>
        /// Get list of accessories by product name and brand code.
        /// </summary>
        /// <param name="productName"></param>
        /// <param name="brandCode"></param>
        /// <returns></returns>
        public async Task<List<AccessoryDto>> GetByProductAndBrandAsync(string productName, string brandCode)
        {
            return await _accessoryDetailRepository.GetByProductAndBrandAsync(productName, brandCode);
        }
    }
}
