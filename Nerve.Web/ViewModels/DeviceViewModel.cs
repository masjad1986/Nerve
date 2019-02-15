using Microsoft.AspNetCore.Mvc.Rendering;
using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Nerve.Web.ViewModels
{
    public class DeviceViewModel
    {
        public string ImeiNumber { get; set; }
        public bool IsValid { get; set; }
        public string ErrorMessage { get; set; }
        public DeviceDto Device { get; set; }
        public List<SelectListItem> WarrantyTypeItems { get; set; }
        public List<SelectListItem> DeliveryAgentItems { get; set; }
        public List<SelectListItem> BrandItems { get; set; }
        public List<SelectListItem> ModelItems { get; set; }
        public List<SelectListItem> ProductItems { get; set; }
        public List<SelectListItem> TransferItems { get; set; }
        public List<SelectListItem> ServiceCentreItems { get; set; }
        public List<SelectListItem> TypeItems { get; set; }
        public List<SelectListItem> PhysicalConditionItems { get; set; }
        public List<SelectListItem> FaultCodeItems { get; set; }
        public List<SelectListItem> AccessoryItems { get; set; }
        public List<string> ValidationErrorItems { get; set; }
    }
}
