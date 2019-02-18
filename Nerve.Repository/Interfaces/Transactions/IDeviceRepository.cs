using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Repository
{
    public interface IDeviceRepository
    {
        Task<bool> DeviceAuthenticationAsync(string imeiNumber);
        Task<bool> SaveAsync(string userId, DeviceDto deviceDto, IEnumerable<AccessoryDto> accessories);
        Task<DeviceDto> FindAsync(string imeiOrTrackingNumber);
    }
}
