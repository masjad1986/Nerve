using Nerve.Repository.Dtos;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Nerve.Repository
{
    public interface IInvoiceRepository
    {
        Task<List<DealerInvoiceDto>> GetDealerInvoiceAsync(int? searchInvoice);
        Task<List<DealerInvoiceDto>> GetDealerInvoiceBytTrackingNumbersAsync(List<string> trackingNumbers);
        Task<List<DealerInvoiceDto>> GetDealerInvoiceByParamAsync(string imeiOrTrackingNumber, int? deliveryAgent);
        Task<bool> SaveDispatchNoteAsync(List<DealerInvoiceDto> dealerInvoiceDto, DispatchNoteDto dispatchNoteDto, string userId);
    }
}
