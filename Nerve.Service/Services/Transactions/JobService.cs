using Nerve.Repository;
using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Service
{
    public class JobService: IJobService
    {
        private readonly IJobRepository _jobRepository;
        public JobService(IJobRepository jobRepository)
        {
            _jobRepository = jobRepository;
        }

        /// <summary>
        /// Get last job status for imei number.
        /// </summary>
        /// <param name="imeiNumber"></param>
        /// <returns></returns>
        public async Task<DateTime?> GetLastJobByImeiNumberAsync(string imeiNumber)
        {
            return await _jobRepository.GetLastJobByImeiNumberAsync(imeiNumber);
        }

        /// <summary>
        /// Get list of job allocation for location.
        /// </summary>
        /// <param name="locationCode"></param>
        /// <returns></returns>
        public async Task<List<JobAllocationDto>> GetPendingJobAllocationByLocationAsync(string locationCode)
        {
            return await _jobRepository.GetPendingJobAllocationByLocationAsync(locationCode);
        }
    }
}
