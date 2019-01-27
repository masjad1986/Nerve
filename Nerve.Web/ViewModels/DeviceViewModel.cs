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
        public DeviceLoginDetailViewModel LoginDetail { get; set; }
        public FaultAccessoryDto FaultAccessory { get; set; }
        public StandByUnitDto StandByUnit { get; set; }
        public PopUploadDto PopUpload { get; set; }
        public List<ImeiHistoryDto> HistoryItems { get; set; }

    }
}
