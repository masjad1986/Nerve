﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Nerve.Repository;
using Nerve.Repository.Dtos;

namespace Nerve.Service.Services.Transactions
{
    public class InvoiceService : IInvoiceService
    {
        private readonly IInvoiceRepository _invoiceRepository;
        public InvoiceService(IInvoiceRepository invoiceRepository)
        {
            _invoiceRepository = invoiceRepository;
        }

        /// <summary>
        /// Get list of dealer invoice.
        /// </summary>
        /// <param name="searchInvoice"></param>
        /// <returns></returns>
        public async Task<List<DealerInvoiceDto>> GetDealerInvoiceAsync(int? searchInvoice)
        {
            return await _invoiceRepository.GetDealerInvoiceAsync(searchInvoice);
        }

        /// <summary>
        /// Get list of invoice details for imei or tracking number or delivery agent.
        /// </summary>
        /// <param name="imeiOrTrackingNumber"></param>
        /// <param name="deliveryAgent"></param>
        /// <returns></returns>
        public async Task<List<DealerInvoiceDto>> GetDealerInvoiceByParamAsync(string imeiOrTrackingNumber, int? deliveryAgent)
        {
            return await _invoiceRepository.GetDealerInvoiceByParamAsync(imeiOrTrackingNumber, deliveryAgent);
        }

        /// <summary>
        /// Save dealer invoice and dispatch note.
        /// </summary>
        /// <param name="dealerInvoiceDto"></param>
        /// <param name="dispatchNoteDto"></param>
        /// <returns></returns>
        public async Task<bool> SaveDispatchNoteAsync(DispatchNoteDto dispatchNoteDto, string userId)
        {
            var dealerInvoices = new List<DealerInvoiceDto>();
            if (dispatchNoteDto.SelectedTrackingNumbers != null && dispatchNoteDto.SelectedTrackingNumbers.Any())
                dealerInvoices = await _invoiceRepository.GetDealerInvoiceBytTrackingNumbersAsync(dispatchNoteDto.SelectedTrackingNumbers);

            return await _invoiceRepository.SaveDispatchNoteAsync(dealerInvoices, dispatchNoteDto, userId);
        }
    }
}
