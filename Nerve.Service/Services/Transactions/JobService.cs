using Nerve.Common.Dtos;
using Nerve.Common.Dtos.Grid;
using Nerve.Repository;
using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Service
{
    public class JobService : IJobService
    {
        private readonly IJobRepository _jobRepository;
        public JobService(IJobRepository jobRepository)
        {
            _jobRepository = jobRepository;
        }

        /// <summary>
        /// Get job by number.
        /// </summary>
        /// <param name="jobNumber"></param>
        /// <returns></returns>
        public async Task<JobGridDto> GetByLocationAndNumberAsync(string locationCode, decimal? jobNumber, PaginationDto paging = null)
        {
            return await _jobRepository.GetByLocationAndNumberAsync(locationCode, jobNumber, paging);
        }

        /// <summary>
        /// Get list of job status types.
        /// </summary>
        /// <param name="excludeItems"></param>
        /// <returns></returns>
        public async Task<List<ItemDto>> GetJobStatusTypesAsync(List<int> excludeItems)
        {
            return await _jobRepository.GetJobStatusTypesAsync(excludeItems);
        }

        /// <summary>
        /// Get list of job status types by filter enum.
        /// </summary>
        /// <param name="excludeItems"></param>
        /// <returns></returns>
        public async Task<List<ItemDto>> GetJobStatusTypesByItemsAsync(List<int> filterItems)
        {
            return await _jobRepository.GetJobStatusTypesByItemsAsync(filterItems);
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
        public async Task<List<JobAllocationDto>> GetPendingJobAllocationByParamsAsync(JobAllocationDto jobAllocationDto, bool isAllPendingJobs = false)
        {
            return await _jobRepository.GetPendingJobAllocationByParamsAsync(jobAllocationDto, isAllPendingJobs);
        }

        /// <summary>
        /// Get list of job allocation for date.
        /// </summary>
        /// <param name="locationCode"></param>
        /// <param name="engineerCode"></param>
        /// <param name="isAllPendingJobs"></param>
        /// <returns></returns>
        public async Task<List<JobAllocationDto>> GetPendingJobAllocationByDateAsync(JobAllocationDto jobAllocationDto, DateTime jobDate)
        {
            return await _jobRepository.GetPendingJobAllocationByDateAsync(jobAllocationDto, jobDate);
        }

        /// <summary>
        /// Save job allocation.
        /// </summary>
        /// <param name="jobAllocation"></param>
        /// <param name="selectedTrackingNumbers"></param>
        /// <returns></returns>
        public async Task<bool> SaveJobAllocationAsync(JobAllocationDto jobAllocationDto, List<string> trackingNumbers)
        {
            return await _jobRepository.SaveJobAllocationAsync(jobAllocationDto, trackingNumbers);
        }
    }
}
