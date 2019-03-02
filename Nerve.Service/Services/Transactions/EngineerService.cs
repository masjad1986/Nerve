using Nerve.Repository;
using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Service
{
    public class EngineerService: IEngineerService
    {
        private readonly IEngineerRepository _engineerRepository;
        public EngineerService(IEngineerRepository engineerRepository)
        {
            _engineerRepository = engineerRepository;
        }

        /// <summary>
        /// Get list of engineer based on location code.
        /// </summary>
        /// <param name="locationCode"></param>
        /// <returns></returns>
        public async Task<List<EngineerDto>> GetByLocationAsync(string locationCode)
        {
            return await _engineerRepository.GetByLocationAsync(locationCode);
        }
    }
}
