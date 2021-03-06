﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Repository
{
    public interface IJobRepository
    {
        Task<KeyValuePair<string, string>> GetJobReferenceNumberAsync(string locationCode);

        Task<DateTime?> GetLastJobByImeiNumberAsync(string imeiNumber);
    }
}
