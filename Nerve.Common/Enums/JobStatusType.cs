using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Common.Enums
{
    public enum JobStatusType
    {
        WaitingForUnitRequest = 48,
        ReadyToDispatch = 30,
        WaitingForAllocation = 15,
        NonWarrantyJob = 16,
        WarrantyJob = 36
    }
}
