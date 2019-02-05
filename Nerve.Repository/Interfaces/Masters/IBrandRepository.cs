using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Repository
{
    public interface IBrandRepository
    {
        Task<IEnumerable<BrandDto>> GetAllAsync();
        Task<BrandDto> GetByIdAsync();
        Task<IEnumerable<BrandDto>> GetAllByProductNameAsync(string productName);
    }
}
