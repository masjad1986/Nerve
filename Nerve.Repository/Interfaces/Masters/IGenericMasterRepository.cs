﻿using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Repository
{
    public interface IGenericMasterRepository
    {
        //Model
        Task<IEnumerable<ProductModelDto>> GetAllProductModelAsync();
        Task<IEnumerable<ProductModelDto>> GetProductModelAsync(string productName);
        Task<IEnumerable<ProductModelDto>> GetProductModelByNameAndBrandAsync(string productName, string brandName);

        //Collection Point
        Task<IEnumerable<CollectionPointDto>> GetCollectionPointByUserIdAsync(string userId, string searchAccount);

        //Fault Codes
        Task<IEnumerable<FaultDetailDto>> GetFaultCodesByBrandAsync(string brandName);

        //Accessories
        Task<IEnumerable<AccessoryDto>> GetAccessoriesByProductAndBrandAsync(string productName, string brandCode);

        //Physical Conditions
        Task<IEnumerable<PhysicalConditionDto>> GetPhysicalConditionsAsync();

        //Reference
        Task<string> GetAutoGeneratedDocumentNumberAsync(int year, string prefix);
    }
}
