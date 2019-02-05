using Nerve.Repository;
using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Service
{
    public class GenericMasterService : IGenericMasterService
    {
        private readonly IGenericMasterRepository _genericMasterRepository;
        public GenericMasterService(IGenericMasterRepository genericMasterRepository)
        {
            _genericMasterRepository = genericMasterRepository;
        }

        #region Model

        public async Task<IEnumerable<ProductModelDto>> GetAllProductModelAsync()
        {
            return await _genericMasterRepository.GetAllProductModelAsync();
        }

        public async Task<IEnumerable<ProductModelDto>> GetProductModelAsync(string productName)
        {
            return await _genericMasterRepository.GetProductModelAsync(productName);
        }

        public async Task<IEnumerable<ProductModelDto>> GetProductModelByNameAndBrandAsync(string productName, string brandName)
        {
            return await _genericMasterRepository.GetProductModelByNameAndBrandAsync(productName, brandName);
        }

        #endregion

        #region Collection Points

        public async Task<IEnumerable<CollectionPointDto>> GetCollectionPointByUserIdAsync(string userId, string searchAccount)
        {
            return await _genericMasterRepository.GetCollectionPointByUserIdAsync(userId, searchAccount);
        }

        #endregion

        #region Fault Codes
        public async Task<IEnumerable<FaultDetailDto>> GetFaultCodesByBrandAsync(string brandName)
        {
            return await _genericMasterRepository.GetFaultCodesByBrandAsync(brandName);
        }
        #endregion

        #region Accessories
        public async Task<IEnumerable<AccessoryDto>> GetAccessoriesByProductAndBrandAsync(string productName, string brandCode)
        {
            return await _genericMasterRepository.GetAccessoriesByProductAndBrandAsync(productName, brandCode);
        }
        #endregion

        #region Physical Condition
        public async Task<IEnumerable<PhysicalConditionDto>> GetPhysicalConditionsAsync()
        {
            return await _genericMasterRepository.GetPhysicalConditionsAsync();
        }
        
        #endregion
    }
}
