using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Repository
{
    public interface IAccessoryDetailRepository
    {
        Task<List<AccessoryDto>> GetByIdsAsync(List<int> ids, string productName, string brandCode);
        Task<List<AccessoryDto>> GetByProductAndBrandAsync(string productName, string brandCode);
    }
}
