using Nerve.Repository;
using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Service.Services.Masters
{
    public class ProductService: IProductService
    {
        private readonly IProductRepository _productRepository;

        public ProductService(IProductRepository productRepository)
        {
            _productRepository = productRepository;
        }

        public async Task<IEnumerable<ProductDto>> GetAllAsync()
        {
            return await _productRepository.GetAllAsync();
        }

        public async Task<ProductDto> GetByIdAsync(int productId)
        {
            return await _productRepository.GetByIdAsync(productId);
        }
    }
}
