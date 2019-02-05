using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Service
{
    public interface IGenericMasterService
    {
        //Model
        Task<IEnumerable<ProductModelDto>> GetAllProductModelAsync();
        Task<IEnumerable<ProductModelDto>> GetProductModelAsync(string productName);
        Task<IEnumerable<ProductModelDto>> GetProductModelByNameAndBrandAsync(string productName, string brandName);

        //Collection Points
        Task<IEnumerable<CollectionPointDto>> GetCollectionPointByUserIdAsync(string userId, string searchAccount);

        //Fault Code
        Task<IEnumerable<FaultDetailDto>> GetFaultCodesByBrandAsync(string brandName);
        
        //Accessories
        Task<IEnumerable<AccessoryDto>> GetAccessoriesByProductAndBrandAsync(string productName, string brandCode);

        //Physical Conditions
        Task<IEnumerable<PhysicalConditionDto>> GetPhysicalConditionsAsync();
    }
}
