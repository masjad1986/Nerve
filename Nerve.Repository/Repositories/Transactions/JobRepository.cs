using Microsoft.Extensions.Options;
using Nerve.Common.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace Nerve.Repository
{
    public class JobRepository : IJobRepository
    {
        private readonly IOptions<AppSettings> _appSettings;
        public JobRepository(IOptions<AppSettings> appSettings)
        {
            _appSettings = appSettings;
        }

        /// <summary>
        /// Get job reference number based on location code.
        /// </summary>
        /// <param name="locationCode"></param>
        /// <returns></returns>
        public async Task<KeyValuePair<string, string>> GetJobReferenceNumberAsync(string locationCode)
        {
            var query = $@"DECLARE @jobno INT, @jobref VARCHAR(50)
                        SELECT @jobno = ISNULL(MAX(jobno),100000)+1 FROM [dbo].[jbrepair] WITH(TABLOCKX) WHERE CCODE=@location_code; 
                        SELECT @jobref= TRIM(locprefix) + '-' + TRIM(STR(@jobno)) FROM hami_data.dbo.glumast WHERE locode=@location_code;
                        SELECT @jobno AS [JobNumber], @jobref AS [JobRefNumber]";

            var parameters = new SqlParameter[]
            {
                new SqlParameter { ParameterName = "@location_code", Value = locationCode }
            };

            var connection = SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_DATA_DATABASE);
            var reader = await SqlHelper.ExecuteReaderAsync(connection,
                CommandType.Text,
                query,
                parameters);

            if (!reader.HasRows)
                return new KeyValuePair<string, string>();

            var jobNumber = string.Empty;
            var jobRefNumber = string.Empty;
            while (await reader.ReadAsync().ConfigureAwait(false))
            {
                jobNumber = Convert.ToString(reader["JobNumber"]);
                jobRefNumber = Convert.ToString(reader["JobRefNumber"]);
            }

            return new KeyValuePair<string, string>(jobNumber, jobRefNumber);
        }

        public async Task<DateTime?> GetLastJobByImeiNumberAsync(string imeiNumber)
        {
            var query = $@"SELECT MAX(dispatchdate) FROM [{RepositoryConstants.SchemaName}].[{SCP.TransactionTables.DealerLog}] WHERE IMEINO = @imei_number";
            var parameters = new SqlParameter[]
            {
                new SqlParameter { ParameterName = "@imei_number", Value = imeiNumber }
            };

            var job = await SqlHelper.ExecuteScalarAsync(SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_SCP_DATABASE),
                CommandType.Text,
                query,
                parameters);

            if (job == DBNull.Value)
                return null;

            return (DateTime) job;
        }
    }
}
