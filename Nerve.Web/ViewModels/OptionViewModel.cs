using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Nerve.Web.ViewModels
{
    public class OptionViewModel
    {
        public List<SelectListItem> Products { get; set; }
        public List<SelectListItem> Brands { get; set; }
        public List<SelectListItem> Models { get; set; }
        public List<SelectListItem> Locations { get; set; }
        public List<SelectListItem> Engineers { get; set; }
        public PageActionBarModel PageActionBarModel { get; set; }
        public bool IsSaveRequest { get; set; }
    }
}
