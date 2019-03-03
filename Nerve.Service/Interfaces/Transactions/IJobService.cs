using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Service
{
    public interface IJobService
    {
        Task<DateTime?> GetLastJobByImeiNumberAsync(string imeiNumber);
        Task<List<JobAllocationDto>> GetPendingJobAllocationByParamsAsync(JobAllocationDto jobAllocationDto, bool isAllPendingJobs = false);
        Task<List<JobAllocationDto>> GetPendingJobAllocationByDateAsync(JobAllocationDto jobAllocationDto, DateTime jobDate);
        Task<bool> SaveJobAllocationAsync(JobAllocationDto jobAllocation, List<string> trackingNumbers);
    }
}
