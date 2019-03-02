using Nerve.Repository.Dtos;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Nerve.Repository
{
    public interface ILocationRepository
    {
        Task<List<LocationDto>> GetAllAsync();
        Task<List<LocationDto>> GetAllBySearchAsync(string search);

    }
}
