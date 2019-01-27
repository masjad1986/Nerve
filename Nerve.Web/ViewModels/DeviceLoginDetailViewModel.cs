using Microsoft.AspNetCore.Mvc.Rendering;
using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Nerve.Web.ViewModels
{
    public class DeviceLoginDetailViewModel
    {
        public DeviceDto Device { get; set; }
        public List<SelectListItem> WarrantyTypeItems { get; set; }
        public List<SelectListItem> DeliveryAgentItems { get; set; }
    }
}
