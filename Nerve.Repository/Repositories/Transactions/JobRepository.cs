using Microsoft.Extensions.Options;
using Nerve.Common.Enums;
using Nerve.Common.Models;
using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
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

        /// <summary>
        /// Get last closed job for imei number.
        /// </summary>
        /// <param name="imeiNumber"></param>
        /// <returns></returns>
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

        public async Task<List<JobAllocationDto>> GetPendingJobAllocationByLocationAsync(string locationCode)
        {
            var query = $@"
                            SELECT 
	                            CAST(0 AS BIT) AS [Status], WarrantyType, docno AS [TrackingNumber], rmano AS [RmaNumber], 
	                            JobNo AS [JobNumber], UnitRecieved_TCDate AS [UnitRecievedDate], Product, Brand, Model,
	                            ISNULL(ageinghrs,0) AS Ageing, DOAStatus, ccode AS [LocationCode], LocationName, CAST(WARRANTY AS INT) AS Warranty
                            FROM [{RepositoryConstants.SchemaName}].[{HAMI.Views.Jobs}]
                            WHERE ccode=@location_code
                            AND JobStatus = @job_status
                            AND ISNULL(QRS,0) = 0
                            AND JobAll_Techcd IS NULL 
                            AND JobAll_Date IS NULL 
                            AND JobAll_EnggCode IS NULL";

            var parameters = new SqlParameter[]
            {
                new SqlParameter { ParameterName = "@location_code", Value = locationCode },
                new SqlParameter { ParameterName = "@job_status", Value = (int)JobStatusType.WaitingForAllocation }
            };

            var reader = await SqlHelper.ExecuteReaderAsync(SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_DATA_DATABASE),
                CommandType.Text,
                query,
                parameters);

            if (!reader.HasRows)
                return new List<JobAllocationDto>();

            var table = new DataTable();
            table.Load(reader);

            var items = (from row in table.AsEnumerable()
                         select new JobAllocationDto
                         {
                             JobNumber = row.Field<decimal?>("JobNumber"),
                             LocationCode = row.Field<string>("LocationCode"),
                             Product = row.Field<string>("Product"),
                             Brand = row.Field<string>("Brand"),
                             Model = row.Field<string>("Model"),
                             WarrantyType = row.Field<string>("WarrantyType"),
                             WarrantyStatus = row.Field<int?>("Warranty") != null ? Enum.GetName(typeof(WarrantyType), row.Field<int?>("Warranty")) : string.Empty,
                             TrackingNumber = row.Field<string>("TrackingNumber"),
                             RmaNumber = row.Field<string>("RmaNumber"),
                             UnitReceivedDate = row.Field<DateTime?>("UnitRecievedDate"),
                             Ageing = row.Field<int?>("Ageing"),
                             DoAStatus = row.Field<string>("DOAStatus")
                         }).ToList();

            return items;
        }
    }
}
