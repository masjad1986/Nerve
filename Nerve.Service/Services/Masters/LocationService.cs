using Nerve.Repository;
using Nerve.Repository.Dtos;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Nerve.Service
{
    public class LocationService : ILocationService
    {
        private readonly ILocationRepository _locationRepository;
        public LocationService(ILocationRepository locationRepository)
        {
            _locationRepository = locationRepository;
        }

        /// <summary>
        /// Get list of all location.
        /// </summary>
        /// <returns></returns>
        public async Task<List<LocationDto>> GetAllAsync()
        {
            return await _locationRepository.GetAllAsync();
        }

        /// <summary>
        /// Get list of location based on search.
        /// </summary>
        /// <param name="search">Search location based on Code or Name.</param>
        /// <returns></returns>
        public async Task<List<LocationDto>> GetAllBySearchAsync(string search)
        {
            return await _locationRepository.GetAllBySearchAsync(search);
        }
    }
}
