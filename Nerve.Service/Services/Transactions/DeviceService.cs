using Nerve.Common;
using Nerve.Common.Translations;
using Nerve.Repository;
using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Service
{
    class DeviceService : IDeviceService
    {
        private readonly IDeviceRepository _deviceRepository;
        private readonly IGenericMasterRepository _genericMasterRepository;
        private readonly IJobRepository _jobRepository;
        private readonly IServiceCentreLocationRepository _serviceCentreLocationRepository;
        private readonly IAccessoryDetailRepository _accessoryDetailRepository;
        private readonly IUserRepository _userRepository;
        private readonly ILanguageTranslator _languageTranslator;
        public DeviceService(IDeviceRepository deviceRepository,
            IGenericMasterRepository genericMasterRepository,
            IJobRepository jobRepository,
            IServiceCentreLocationRepository serviceCentreLocationRepository,
            IAccessoryDetailRepository accessoryDetailRepository,
            IUserRepository userRepository,
            ILanguageTranslator languageTranslator)
        {
            _deviceRepository = deviceRepository;
            _genericMasterRepository = genericMasterRepository;
            _jobRepository = jobRepository;
            _serviceCentreLocationRepository = serviceCentreLocationRepository;
            _accessoryDetailRepository = accessoryDetailRepository;
            _userRepository = userRepository;
            _languageTranslator = languageTranslator;
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

        public async Task<bool> SaveAsync(string userId, DeviceDto deviceDto)
        {
            var serviceCentreLocations = await _serviceCentreLocationRepository.GetByIdAndBrandAndProductAsync(deviceDto.CollectionPoint, deviceDto.ProductName, deviceDto.BrandCode);
            if (serviceCentreLocations != null && serviceCentreLocations.Any())
            {
                var serviceCentreLocation = serviceCentreLocations.Select(x => new ServiceCentreLocationDto
                {
                    LocationCode = x.LocationCode,
                    City = x.City,
                    DetailId = x.DetailId,
                    LocationName = x.LocationName
                }).Distinct().FirstOrDefault();

                deviceDto.LocationCode = serviceCentreLocation.LocationCode;
                deviceDto.City = serviceCentreLocation.City;
                deviceDto.DetailId = serviceCentreLocation.DetailId;
            }

            //tracking prefix
            var prefix = await _userRepository.GetTrackingPrefixByUserIdAsync(userId);

            if (prefix == null)
            {
                throw new InvalidOperationException(await _languageTranslator.TranslateAsync(LanguageKeys.ErrorFieldPrefixNotMaintained));
            }

            deviceDto.Prefix = prefix.TrackingPrefix;

            //get job number 
            var jobValuePair = await _jobRepository.GetJobReferenceNumberAsync(deviceDto.LocationCode);
            if (jobValuePair.Key == null || string.IsNullOrEmpty(jobValuePair.Value))
            {
                throw new InvalidOperationException(await _languageTranslator.TranslateAsync(LanguageKeys.ErrorFieldJobNuberNotFound));
            }
            
            deviceDto.AutoJobNumber = jobValuePair.Key;
            deviceDto.AutoJobReferenceNumber = jobValuePair.Value;

            // DOA is true
            // write here code for Pop Upload.

            var accessories = await _accessoryDetailRepository.GetByIdsAsync(deviceDto.AccessoriesIds, deviceDto.ProductName, deviceDto.BrandCode);
            return await _deviceRepository.SaveAsync(userId, deviceDto, accessories);
        }
    }
}
