using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;

namespace Nerve.Common.Enums
{
    public enum JobStatusType
    {
        [Description("Cancelled")]
        Cancelled = -1,

        [Description("Customer Approved")]
        CustomerApproved = 20,

        [Description("Delivered")]
        Delivered = 29,

        [Description("Estimation")]
        Estimation = 19,

        [Description("Invoiced")]
        Invoiced = 23,

        [Description("Non Warranty Job")]
        NonWarrantyJob = 16,

        [Description("Open")]
        Open = -1,

        [Description("QC Passed")]
        QcPassed = 26,

        [Description("Ready To Dispatch")]
        ReadyToDispatch = 30,

        [Description("Waiting For Allocation")]
        WaitingForAllocation = 15,

        [Description("Waiting For Unit Request")]
        WaitingForUnitRequest = 48,

        [Description("Warranty Job")]
        WarrantyJob = 36,

        [Description("Waiting For Part")]
        WaitingForPart = 18

    }
}
