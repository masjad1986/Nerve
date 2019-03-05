﻿using Nerve.Repository;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Service
{
    public class EstimationService: IEstimationService
    {
        private readonly IEstimationRepository _estimationRepository;
        public EstimationService(IEstimationRepository estimationRepository)
        {
            _estimationRepository = estimationRepository;
        }

        /// <summary>
        /// Save estimation for job number.
        /// </summary>
        /// <returns></returns>
        public Task<bool> SaveAsync()
        {
            throw new NotImplementedException();
        }
    }
}
