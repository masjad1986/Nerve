using Nerve.Repository.Dtos;

namespace Nerve.Web.ViewModels
{
    public class VendorUpdateViewModel
    {
        public string Search { get; set; }
        public VendorUpdationDto VendorUpdation { get; set; }
        public PageActionBarModel PageActionBarModel { get; set; }
    }
}
