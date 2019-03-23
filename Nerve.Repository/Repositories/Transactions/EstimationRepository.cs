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
    public class EstimationRepository : IEstimationRepository
    {
        private readonly IOptions<AppSettings> _appSettings;
        public EstimationRepository(IOptions<AppSettings> appSettings)
        {
            _appSettings = appSettings;
        }

        /// <summary>
        /// Save estimation for job number.
        /// </summary>
        /// <returns></returns>
        public async Task<bool> SaveAsync()
        {
            var isSaved = false;
            var connection = new SqlConnection();
            SqlTransaction transaction = null;
            try
            {
                var query = $@"";
                var parameters = new SqlParameter[] { };
                connection = SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_DATA_DATABASE);
                await connection.OpenAsync().ConfigureAwait(false);
                transaction = connection.BeginTransaction();

                isSaved = await SqlHelper.ExecuteNonQueryAsync(transaction, CommandType.Text, query, parameters) > 0;
                transaction.Commit();
            }
            catch (Exception ex)
            {
                if (transaction != null) transaction.Rollback();
                throw ex;
            }

            return isSaved;
        }

        /// <summary>
        /// Update estimation start date.
        /// </summary>
        /// <param name="locationCode"></param>
        /// <param name="jobNumber"></param>
        /// <returns></returns>
        public async Task<bool> UpdateEstimationDateAsync(string locationCode, decimal jobNumber)
        {
            var query = $@"UPDATE [{RepositoryConstants.SchemaName}].[{HAMI.MasterTables.JobRepair}] SET ESTSTARTDATE = GETDATE() 
                           WHERE jobno = @job_number AND ccode = @location_code";

            var parameters = new SqlParameter[]
            {
                new SqlParameter { ParameterName = "@location_code", Value = locationCode },
                new SqlParameter { ParameterName = "@job_number", Value = jobNumber }
            };

            var result = await SqlHelper.ExecuteNonQueryAsync(SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_DATA_DATABASE),
                CommandType.Text,
                query,
                parameters);

            return result > 0;
        }
    }
}
