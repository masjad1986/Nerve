using Nerve.Repository.Dtos;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Nerve.Repository
{
    public interface IInvoiceRepository
    {
        Task<List<DealerInvoiceDto>> GetDealerInvoiceAsync(int? searchInvoice);
        Task<List<DealerInvoiceDto>> GetDealerInvoiceByParamAsync(string imeiOrTrackingNumber, string deliveryAgent);
    }
}
