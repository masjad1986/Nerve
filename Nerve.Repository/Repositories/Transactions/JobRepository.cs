using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Repository
{
    public class JobRepository : IJobRepository
    {
        private readonly AppSettings _appSettings;
        public JobRepository(IOptions<AppSettings> appSettings)
        {
            _appSettings = appSettings.Value;
        }

        /// <summary>
        /// Get job reference number based on location code.
        /// </summary>
        /// <param name="locationCode"></param>
        /// <returns></returns>
        public async Task<string> GetJobReferenceNumberAsync(string locationCode)
        {
            var query = $@"DECLARE @jobno INT, @jobref VARCHAR(50)
                        SELECT @jobno = ISNULL(MAX(jobno),100000)+1 FROM [dbo].[jbrepair] WITH(TABLOCKX) WHERE CCODE=@location_code; 
                        SELECT @jobref= TRIM(locprefix) + '-' + TRIM(STR(@jobno)) FROM hami_data.dbo.glumast WHERE locode=@location_code;
                        SELECT @jobref AS [JobNumber]";

            var parameters = new SqlParameter[]
            {
                new SqlParameter { ParameterName = "@location_code", Value = locationCode }
            };

            var connection = SqlHelper.GetSqlConnectionAsync(_appSettings.HAMI_DATA_DATABASE);
            var jobNumber = (string) await SqlHelper.ExecuteScalarAsync(connection,
                CommandType.Text,
                query,
                parameters);

            return jobNumber;
        }
    }
}
