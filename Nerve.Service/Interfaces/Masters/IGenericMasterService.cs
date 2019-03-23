﻿using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Service
{
    public interface IGenericMasterService
    {
        //Fault Code
        Task<List<FaultDetailDto>> GetFaultCodesByBrandAsync(string brandName);
        
        //Physical Conditions
        Task<List<PhysicalConditionDto>> GetPhysicalConditionsAsync();

        //Tracking Number
        Task<string> GetAutoGeneratedTrackingNumberAsync(int year, string prefix);
    }
}
