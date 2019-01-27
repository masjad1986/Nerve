using Nerve.Repository;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Service
{
    class DeviceService : IDeviceService
    {
        private readonly IDeviceRepository _deviceRepository;
        public DeviceService(IDeviceRepository deviceRepository)
        {
            _deviceRepository = deviceRepository;
        }

        /// <summary>
        /// Authenticate device for any existing job running or not.
        /// </summary>
        /// <param name="imeiNumber"></param>
        /// <returns></returns>
        public async Task<bool> DeviceAuthenticateAsync(string imeiNumber)
        {
            return await _deviceRepository.DeviceAuthenticationAsync(imeiNumber);
        }
    }
}
