using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Repository
{
    public interface IEstimationRepository
    {
        Task<bool> SaveAsync();
        Task<bool> UpdateEstimationDateAsync(string locationCode, decimal jobNumber);
    }
}
