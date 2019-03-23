using Nerve.Common.Dtos;
using Nerve.Common.Dtos.Grid;
using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Service
{
    public interface IJobService
    {
        Task<JobGridDto> GetByLocationAndNumberAsync(string locationCode, decimal? jobNumber, PaginationDto paging = null);
        Task<List<ItemDto>> GetJobStatusTypesAsync(List<int> excludeItems);
        Task<List<ItemDto>> GetJobStatusTypesByItemsAsync(List<int> filterItems);
        Task<DateTime?> GetLastJobByImeiNumberAsync(string imeiNumber);
        Task<List<JobAllocationDto>> GetPendingJobAllocationByParamsAsync(JobAllocationDto jobAllocationDto, bool isAllPendingJobs = false);
        Task<List<JobAllocationDto>> GetPendingJobAllocationByDateAsync(JobAllocationDto jobAllocationDto, DateTime jobDate);
        Task<bool> SaveJobAllocationAsync(JobAllocationDto jobAllocation, List<string> trackingNumbers);
    }
}
