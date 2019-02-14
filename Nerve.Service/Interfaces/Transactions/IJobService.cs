using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Service
{
    public interface IJobService
    {
        Task<DateTime?> GetLastJobByImeiNumberAsync(string imeiNumber);
    }
}
