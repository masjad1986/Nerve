using Nerve.Repository.Dtos;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Nerve.Service
{
    public interface ILocationService
    {
        Task<List<LocationDto>> GetAllAsync();
        Task<List<LocationDto>> GetAllBySearchAsync(string search);
    }
}
