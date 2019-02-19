using Microsoft.Extensions.Options;
using Nerve.Common.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Repository
{
    public class VendorUpdationRepository : IVendorUpdationRepository
    {
        private readonly IOptions<AppSettings> _appSettings;
        public VendorUpdationRepository(IOptions<AppSettings> appSettings)
        {
            _appSettings = appSettings;
        }

        /// <summary>
        /// Update new vendor rma number for given imei and tracking number
        /// </summary>
        /// <param name="vendorRmaNumber"></param>
        /// <param name="imeiNumber"></param>
        /// <param name="trackingNumber"></param>
        /// <returns></returns>
        public async Task<bool> UpdateAsync(string vendorRmaNumber, string imeiNumber, string trackingNumber)
        {
            var query = $@"UPDATE [{RepositoryConstants.SchemaName}].[{SCP.TransactionTables.DealerLog}] 
                        SET RMANo = @rma_number 
                        WHERE IMEINO = @imei_number AND DocNo = @tracking_number";
            var parameters = new SqlParameter[]
            {
                new SqlParameter { ParameterName = "@imei_number", Value = imeiNumber },
                new SqlParameter { ParameterName = "@rma_number", Value = vendorRmaNumber },
                new SqlParameter { ParameterName = "@tracking_number", Value = trackingNumber }
            };

            var updated = await SqlHelper.ExecuteNonQueryAsync(SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_SCP_DATABASE),
                CommandType.Text,
                query,
                parameters);

            return updated > 0;
        }
    }
}
