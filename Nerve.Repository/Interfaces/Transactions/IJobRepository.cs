using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Repository
{
    public interface IJobRepository
    {
        Task<string> GetJobReferenceNumberAsync(string locationCode);
    }
}
