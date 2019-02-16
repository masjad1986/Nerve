﻿using Nerve.Repository;
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

        public async Task<List<ProductModelDto>> GetAllProductModelAsync()
        {
            return await _genericMasterRepository.GetAllProductModelAsync();
        }

        public async Task<List<ProductModelDto>> GetProductModelAsync(string productName)
        {
            return await _genericMasterRepository.GetProductModelAsync(productName);
        }

        public async Task<List<ProductModelDto>> GetProductModelByNameAndBrandAsync(string productName, string brandName)
        {
            return await _genericMasterRepository.GetProductModelByNameAndBrandAsync(productName, brandName);
        }

        #endregion


        #region Fault Codes
        public async Task<List<FaultDetailDto>> GetFaultCodesByBrandAsync(string brandName)
        {
            return await _genericMasterRepository.GetFaultCodesByBrandAsync(brandName);
        }
        #endregion

        #region Physical Condition
        public async Task<List<PhysicalConditionDto>> GetPhysicalConditionsAsync()
        {
            return await _genericMasterRepository.GetPhysicalConditionsAsync();
        }

        #endregion

        public async Task<string> GetAutoGeneratedTrackingNumberAsync(int year, string prefix)
        {
            return await _genericMasterRepository.GetAutoGeneratedDocumentNumberAsync(year, prefix);
        }
    }
}