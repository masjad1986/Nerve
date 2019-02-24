﻿using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Service
{
    public interface IInvoiceService
    {
        Task<List<DealerInvoiceDto>> GetDealerInvoiceAsync(int? searchInvoice);
        Task<List<DealerInvoiceDto>> GetDealerInvoiceByParamAsync(string imeiOrTrackingNumber, string deliveryAgent);
    }
}
