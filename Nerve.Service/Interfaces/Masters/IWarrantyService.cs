using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Service
{
    public interface IWarrantyService
    {
        Task<IEnumerable<TypeDto>> GetTypesAsync();
    }
}
