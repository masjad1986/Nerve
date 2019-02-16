﻿using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Service
{
    public interface IGenericMasterService
    {
        //Model
        Task<List<ProductModelDto>> GetAllProductModelAsync();
        Task<List<ProductModelDto>> GetProductModelAsync(string productName);
        Task<List<ProductModelDto>> GetProductModelByNameAndBrandAsync(string productName, string brandName);

        //Fault Code
        Task<List<FaultDetailDto>> GetFaultCodesByBrandAsync(string brandName);
        
        //Physical Conditions
        Task<List<PhysicalConditionDto>> GetPhysicalConditionsAsync();

        //Tracking Number
        Task<string> GetAutoGeneratedTrackingNumberAsync(int year, string prefix);
    }
}