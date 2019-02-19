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
        private readonly IVendorUpdationRepository _vendorUpdationRepository;
        public VendorUpdationService(IDeviceRepository deviceRepository,
            IVendorUpdationRepository vendorUpdationRepository)
        {
            _deviceRepository = deviceRepository;
            _vendorUpdationRepository = vendorUpdationRepository;
        }

        /// <summary>
        /// Find device based on imei or tracking number
        /// </summary>
        /// <param name="imeiOrTrackingNumber">Search based on imei or tracking number.</param>
        /// <returns></returns>
        public async Task<VendorUpdationDto> GetByImeiOrTrackingNumberAsync(string imeiOrTrackingNumber)
        {
            var deviceDto = await _deviceRepository.FindAsync(imeiOrTrackingNumber);
            if (deviceDto == null)
                return null;

            return new VendorUpdationDto
            {
                ImeiNumber = deviceDto.ImeiNumber,
                CollectionPointName = deviceDto.CollectionPointName,
                TrackingNumber = deviceDto.TrackingNumber,
                BrandName = deviceDto.BrandName,
                ProductName = deviceDto.ProductName,
                Model = deviceDto.Model,
                LocationCode = deviceDto.LocationCode,
                LocationName = deviceDto.LocationName,
                CustomerName = deviceDto.CustomerName,
                VendorRmaNumber = deviceDto.VendorRmaNumber,
                JobNumber = deviceDto.AutoJobReferenceNumber
            };
        }

        /// <summary>
        /// Update new rma number for given imei or tracking number.
        /// </summary>
        /// <param name="vendorRmaNumber"></param>
        /// <param name="imeiNumber"></param>
        /// <param name="trackingNumber"></param>
        /// <returns></returns>
        public async Task<bool> UpdateAsync(string vendorRmaNumber, string imeiNumber, string trackingNumber)
        {
            return await _vendorUpdationRepository.UpdateAsync(vendorRmaNumber, imeiNumber, trackingNumber);
        }
    }
}
