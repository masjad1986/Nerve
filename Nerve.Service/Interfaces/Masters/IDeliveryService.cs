﻿using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Service
{
    public interface IDeliveryService
    {
        Task<List<DeliveryAgentDto>> GetDeliveryAgentsAsync();
    }
}
