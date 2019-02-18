using Nerve.Repository;
using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Service
{
    public class EstimationService: IEstimationService
    {
        private readonly IEstimationRepository _estimationRepository;
        public EstimationService(IEstimationRepository estimationRepository)
        {
            _estimationRepository = estimationRepository;
        }
    }
}
