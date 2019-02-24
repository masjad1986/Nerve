using Microsoft.AspNetCore.Mvc.Rendering;
using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Nerve.Web.ViewModels
{
    public class DispatchNoteViewModel
    {
        public string ImeiOrTrackingNumber { get; set; }
        public List<SelectListItem> DeliveryAgentItems { get; set; }
        public List<DealerInvoiceDto> Devices { get; set; }
        public DispatchNoteDto DispatchNote { get; set; }
        public PageActionBarModel PageActionBarModel { get; set; }
        public bool IsSaveRequest { get; set; }
    }
}
