using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Nerve.Repository;
using Nerve.Repository.Dtos;

namespace Nerve.Service
{
    public class VendorUpdationService : IVendorUpdationService
    {
        private readonly IDeviceRepository _deviceRepository;
        public VendorUpdationService(IDeviceRepository deviceRepository)
        {
            _deviceRepository = deviceRepository;
        }
        public async Task<VendorUpdationDto> GetByImeiOrTrackingNumberAsync(string imeiOrTrackingNumber)
        {
            var vendorDto = new VendorUpdationDto();
            var deviceDto = await _deviceRepository.FindAsync(imeiOrTrackingNumber);
            if (deviceDto != null)
            {
                vendorDto.ImeiNumber = deviceDto.ImeiNumber;
                vendorDto.CollectionPointName = deviceDto.CollectionPointName;
                vendorDto.TrackingNumber = deviceDto.TrackingNumber;
                vendorDto.BrandName = deviceDto.BrandName;
                vendorDto.ProductName = deviceDto.ProductName;
                vendorDto.Model = deviceDto.Model;
                vendorDto.LocationCode = deviceDto.LocationCode;
                vendorDto.LocationName = deviceDto.LocationName;
                vendorDto.CustomerName = deviceDto.CustomerName;
                vendorDto.VendorRmaNumber = deviceDto.VendorRmaNumber;
                vendorDto.JobNumber= deviceDto.AutoJobReferenceNumber;
            };

            return vendorDto;
        }
    }
}
