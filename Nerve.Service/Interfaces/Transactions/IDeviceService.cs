using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Nerve.Repository.Dtos;

namespace Nerve.Service
{
    public interface IDeviceService
    {
        Task<bool> DeviceAuthenticateAsync(string imeiNumber);
        Task<bool> SaveAsync(string userId, DeviceDto deviceDto);
    }
}
