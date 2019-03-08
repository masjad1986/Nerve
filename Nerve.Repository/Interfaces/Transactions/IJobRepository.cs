using Nerve.Common.Dtos;
using Nerve.Common.Dtos.Grid;
using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Nerve.Repository
{
    public interface IJobRepository
    {
        Task<List<JobAllocationDto>> GetByLocationAndNumberAsync(string locationCode, decimal? jobNumber, PagingDto paging = null);
        Task<List<ItemDto>> GetJobStatusTypesAsync(List<int> excludeItems);
        Task<KeyValuePair<string, string>> GetJobReferenceNumberAsync(string locationCode);
        Task<DateTime?> GetLastJobByImeiNumberAsync(string imeiNumber);
        Task<List<JobAllocationDto>> GetPendingJobAllocationByParamsAsync(JobAllocationDto jobAllocationDto, bool isAllPendingJobs = false);
        Task<List<JobAllocationDto>> GetPendingJobAllocationByDateAsync(JobAllocationDto jobAllocationDto, DateTime jobDate);
        Task<bool> SaveJobAllocationAsync(JobAllocationDto jobAllocationDto, List<string> trackingNumbers);
    }
}
