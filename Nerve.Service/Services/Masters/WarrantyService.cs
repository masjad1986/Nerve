using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Nerve.Repository;
using Nerve.Repository.Dtos;

namespace Nerve.Service
{
    public class WarrantyService : IWarrantyService
    {
        private readonly IWarrantyRepository _warrantyRepository;
        public WarrantyService(IWarrantyRepository warrantyRepository)
        {
            _warrantyRepository = warrantyRepository;
        }

        /// <summary>
        /// Get list of warranty type.
        /// </summary>
        /// <returns></returns>
        public async Task<List<TypeDto>> GetTypesAsync()
        {
            return await _warrantyRepository.GetTypesAsync();
        }
    }
}
