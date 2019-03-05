using Microsoft.AspNetCore.Mvc.Rendering;
using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;

namespace Nerve.Web.ViewModels
{
    public class EstimationViewModel : OptionViewModel
    {
        public EstimationDto Estimation { get; set; }
        public List<PartEstimationDto> PartEstimations { get; set; }
        public List<SelectListItem> JobStatusItems { get; set; }
        public List<SelectListItem> CustomerTypes { get; set; }
        public List<SelectListItem> CollectionPoints { get; set; }
    }
}
