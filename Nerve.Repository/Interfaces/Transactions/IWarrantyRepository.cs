﻿using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Repository
{ 
    public interface IWarrantyRepository
    {
        Task<List<TypeDto>> GetTypesAsync();
    }
}
