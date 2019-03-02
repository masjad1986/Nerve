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
        /// <param name="engineerCode"></param>
        /// <param name="isAllPendingJobs"></param>
        /// <returns></returns>
        public async Task<List<JobAllocationDto>> GetPendingJobAllocationByLocationAsync(string locationCode, string engineerCode, bool isAllPendingJobs = false)
        {
            return await _jobRepository.GetPendingJobAllocationByLocationAsync(locationCode, engineerCode, isAllPendingJobs);
        }

        /// <summary>
        /// Get list of job allocation for date.
        /// </summary>
        /// <param name="locationCode"></param>
        /// <param name="engineerCode"></param>
        /// <param name="isAllPendingJobs"></param>
        /// <returns></returns>
        public async Task<List<JobAllocationDto>> GetPendingJobAllocationByDateAsync(string locationCode, string engineerCode, DateTime jobDate)
        {
            return await _jobRepository.GetPendingJobAllocationByDateAsync(locationCode, engineerCode, jobDate);
        }
    }
}
