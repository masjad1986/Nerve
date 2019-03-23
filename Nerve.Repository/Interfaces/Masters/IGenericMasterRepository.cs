﻿using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Repository
{
    public interface IGenericMasterRepository
    {
        //Fault Codes
        Task<List<FaultDetailDto>> GetFaultCodesByBrandAsync(string brandName);

        //Physical Conditions
        Task<List<PhysicalConditionDto>> GetPhysicalConditionsAsync();

        //Reference
        Task<string> GetAutoGeneratedDocumentNumberAsync(int year, string prefix);
    }
}
