using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Service
{
    public interface IProductModelService
    {
        Task<List<ProductModelDto>> GetAllAsync();
        Task<List<ProductModelDto>> GetByProductNameAsync(string productName);
        Task<List<ProductModelDto>> GetByProductNameAndBrandNameAsync(string productName, string brandName);
    }
}
