using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Nerve.Repository;
using Nerve.Repository.Dtos;

namespace Nerve.Service
{
    public class DeliveryService : IDeliveryService
    {
        private readonly IDeliveryRepository _deliveryRepository;
        public DeliveryService(IDeliveryRepository deliveryRepository)
        {
            _deliveryRepository = deliveryRepository;
        }

        /// <summary>
        /// Get list of delivery agents.
        /// </summary>
        /// <returns></returns>
        public async Task<List<DeliveryAgentDto>> GetDeliveryAgentsAsync()
        {
            return await _deliveryRepository.GetDeliveryAgentsAsync();
        }
    }
}
