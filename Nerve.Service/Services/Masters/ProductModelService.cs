using Nerve.Repository;
using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Service
{
    public class ProductModelService: IProductModelService
    {
        private readonly IProductModelRepository _productModelRepository;
        public ProductModelService(IProductModelRepository productModelRepository)
        {
            _productModelRepository = productModelRepository;
        }

        public async Task<List<ProductModelDto>> GetAllAsync()
        {
            return await _productModelRepository.GetAllAsync();
        }

        public async Task<List<ProductModelDto>> GetByProductNameAsync(string productName)
        {
            return await _productModelRepository.GetByProductNameAsync(productName);
        }

        public async Task<List<ProductModelDto>> GetByProductNameAndBrandNameAsync(string productName, string brandName)
        {
            return await _productModelRepository.GetByProductNameAndBrandNameAsync(productName, brandName);
        }
    }
}
