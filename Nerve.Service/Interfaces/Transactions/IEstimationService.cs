using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Service
{
    public interface IEstimationService
    {
        Task<bool> SaveAsync();
    }
}
