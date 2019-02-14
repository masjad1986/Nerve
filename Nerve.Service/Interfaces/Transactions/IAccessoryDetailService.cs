using Nerve.Repository.Dtos;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Nerve.Service
{
    public interface IAccessoryDetailService
    {
        Task<List<AccessoryDto>> GetByProductAndBrandAsync(string productName, string brandCode);
    }
}
