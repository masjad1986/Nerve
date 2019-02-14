using Nerve.Repository;
using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Service
{
    public class BrandService : IBrandService
    {
        private readonly IBrandRepository _brandRepository;
        public BrandService(IBrandRepository brandRepository)
        {
            _brandRepository = brandRepository;
        }

        public async Task<List<BrandDto>> GetAllAsync()
        {
            return await _brandRepository.GetAllAsync();
        }

        public async Task<List<BrandDto>> GetAllByProductNameAsync(string productName)
        {
            return await _brandRepository.GetAllByProductNameAsync(productName);
        }

        public async Task<BrandDto> GetByIdAsync()
        {
            return await _brandRepository.GetByIdAsync();
        }
    }
}
