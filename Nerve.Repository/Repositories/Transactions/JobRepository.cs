using Microsoft.Extensions.Options;
using Nerve.Common.Dtos;
using Nerve.Common.Dtos.Grid;
using Nerve.Common.Enums;
using Nerve.Common.Extensions;
using Nerve.Common.Helpers;
using Nerve.Common.Models;
using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
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
        /// Get job by location and number.
        /// </summary>
        /// <param name="locationCode">Pass location code.</param>
        /// <param name="jobNumber">Pass job number.</param>
        /// <returns></returns>
        public async Task<List<JobAllocationDto>> GetByLocationAndNumberAsync(string locationCode, decimal? jobNumber, PagingDto paging = null)
        {
            var query = $@"SELECT 
                               j.jobno AS [JobNumber], j.DEALERREF AS [TrackingNumber], CAST(j.JobAll_Date AS VARCHAR) AS [Date], j.CCODE AS [LocationCode],
	                           j.Product AS [ProductName], CAST(ISNULL(p.ProductID,0) AS VARCHAR) AS [Product], j.BRAND, j.MODEL, j.JobAll_EnggCode AS [EngineerCode],
	                           j.UnitReceiveDate, d.RMANo AS [RmaNumber]
                           FROM [{RepositoryConstants.HamiDatabase}].[{RepositoryConstants.SchemaName}].[{HAMI.MasterTables.JobRepair}] j
                           LEFT JOIN [{RepositoryConstants.SchemaName}].[{SCP.MasterTables.Product}] p ON j.Product = p.ProductName
                           LEFT JOIN [{RepositoryConstants.SchemaName}].[{SCP.TransactionTables.DealerLog}] d ON d.Docno=j.DEALERREF AND d.LocationCode = j.CCODE
                           WHERE j.ccode = @location_code";

            if (jobNumber.HasValue && jobNumber.Value > 0)
            {
                query += " AND CHARINDEX(CAST(@job_number AS VARCHAR), CAST(j.JOBNO AS VARCHAR), 1) > 0";
            }

            var parameters = new List<SqlParameter>
            {
                new SqlParameter { ParameterName = "@location_code",Value = locationCode },
                new SqlParameter { ParameterName = "@job_number",Value = jobNumber }
            };

            if (paging != null)
            {
                if (paging.PageIndex < 1)
                {
                    paging.PageIndex = 1;
                }

                if (paging.PageSize < 1)
                {
                    paging.PageSize = 10;
                }

                query += $@" ORDER BY j.jobno
                          OFFSET @page_index ROWS
                          FETCH NEXT @page_size ROWS ONLY
                        ";

                parameters.AddRange(new List<SqlParameter>{
                    new SqlParameter { ParameterName = "@page_index", Value = (paging.PageIndex * paging.PageSize) - 1 },
                    new SqlParameter { ParameterName = "@page_size", Value = paging.PageSize }
                });
            }


            var connection = SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_SCP_DATABASE);
            var reader = await SqlHelper.ExecuteReaderAsync(connection, CommandType.Text, query, parameters.ToArray());

            if (!reader.HasRows)
                return new List<JobAllocationDto>();

            var table = new DataTable();
            table.Load(reader);

            var items = (from row in table.AsEnumerable()
                         select new JobAllocationDto
                         {
                             JobNumber = row.Field<decimal?>("JobNumber"),
                             LocationCode = row.Field<string>("LocationCode"),
                             Date = row.Field<string>("Date"),
                             Product = row.Field<string>("Product"),
                             Brand = row.Field<string>("Brand"),
                             Model = row.Field<string>("Model"),
                             EngineerCode = row.Field<string>("EngineerCode"),
                             TrackingNumber = row.Field<string>("TrackingNumber"),
                             RmaNumber = row.Field<string>("RmaNumber"),
                             UnitReceivedDate = row.Field<DateTime?>("UnitReceiveDate")
                         }).ToList();

            return items;
        }

        /// <summary>
        /// Get list of job status types.
        /// </summary>
        /// <param name="excludeTypes"></param>
        /// <returns></returns>
        public async Task<List<ItemDto>> GetJobStatusTypesAsync(List<int> excludeItems)
        {
            var ignoreItems = excludeItems != null && excludeItems.Any() ? excludeItems.Cast<object>().ToList() : new List<object>();
            var items = EnumHelper.ToList<JobStatusType>(ignoreItems);
            if (items != null && items.Any())
                items = items.OrderBy(x => x.Name).ToList();
            return await Task.FromResult(items);
        }

        /// <summary>
        /// Get job reference number based on location code.
        /// </summary>
        /// <param name="locationCode"></param>
        /// <returns></returns>
        public async Task<KeyValuePair<string, string>> GetJobReferenceNumberAsync(string locationCode)
        {
            var query = $@"DECLARE @jobno INT, @jobref VARCHAR(50)
                        SELECT @jobno = ISNULL(MAX(jobno),100000)+1 FROM [{RepositoryConstants.SchemaName}].[{HAMI.MasterTables.JobRepair}] WITH(TABLOCKX) WHERE CCODE=@location_code; 
                        SELECT @jobref= TRIM(locprefix) + '-' + TRIM(STR(@jobno)) FROM [{RepositoryConstants.SchemaName}].[{HAMI.MasterTables.GluMaster}] WHERE locode=@location_code;
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

            return (DateTime)job;
        }

        #region Job Allocation

        /// <summary>
        /// Get pending job allocation by location.
        /// </summary>
        /// <param name="locationCode"></param>
        /// <param name="engineerCode"></param>
        /// <param name="isAllPendingJobs"></param>
        /// <returns></returns>
        public async Task<List<JobAllocationDto>> GetPendingJobAllocationByParamsAsync(JobAllocationDto jobAllocationDto, bool isAllPendingJobs = false)
        {
            var baseQueryAndParams = await GetPendingJobAllocationQueryAsync(jobAllocationDto, (int)JobStatusType.WaitingForAllocation);
            var query = baseQueryAndParams.Key + (!isAllPendingJobs
                            ? $@" AND ISNULL(QRS,0) = 0 
                                  AND JobAll_Techcd IS NULL
                                  AND JobAll_Date IS NULL
                                  AND JobAll_EnggCode IS NULL"

                            : $@" AND ISNULL(jbcomplete,0)=0
                                  AND ISNULL(repair_status,0) = 0
                                  AND ISNULL(cpappr,0) <> @collection_point_approval
                                  AND ISNULL(QC_STATUS,0) = 0
                                  AND ISNULL(PInvFlag,0) = 0");

            baseQueryAndParams.Value.AddRange(new List<SqlParameter>
            {
                new SqlParameter { ParameterName = "@collection_point_approval", Value = "2" },
            });

            var reader = await SqlHelper.ExecuteReaderAsync(SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_DATA_DATABASE),
                CommandType.Text,
                query,
                baseQueryAndParams.Value.ToArray());

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
                             WarrantyStatus = row.Field<string>("Warranty") != null ? row.Field<string>("Warranty") : string.Empty,
                             TrackingNumber = row.Field<string>("TrackingNumber"),
                             RmaNumber = row.Field<string>("RmaNumber"),
                             UnitReceivedDate = row.Field<DateTime?>("UnitRecievedDate"),
                             Ageing = row.Field<int?>("Ageing"),
                             DoAStatus = row.Field<string>("DOAStatus")
                         }).ToList();

            return items;
        }

        /// <summary>
        /// Get pending job allocation by date.
        /// </summary>
        /// <param name="locationCode"></param>
        /// <param name="engineerCode"></param>
        /// <param name="jobDate"></param>
        /// <returns></returns>
        public async Task<List<JobAllocationDto>> GetPendingJobAllocationByDateAsync(JobAllocationDto jobAllocationDto, DateTime jobDate)
        {
            var baseQueryAndParams = await GetPendingJobAllocationQueryAsync(jobAllocationDto, (int)JobStatusType.WaitingForAllocation);
            var query = $@"{baseQueryAndParams.Key} AND CAST(JobAll_Date AS DATE) = @job_date AND ISNULL(jbcomplete,0) = 0 AND ISNULL(repair_status,0) = 0 AND ISNULL(cpappr,0) <> @collection_point_approval";

            baseQueryAndParams.Value.AddRange(new List<SqlParameter>
            {
                new SqlParameter { ParameterName = "@collection_point_approval", Value = "2" },
                new SqlParameter { ParameterName = "@job_date", Value = jobDate.ToString("MM/dd/YYYY") }
            });

            var reader = await SqlHelper.ExecuteReaderAsync(SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_DATA_DATABASE),
                CommandType.Text,
                query,
                baseQueryAndParams.Value.ToArray());

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
                             WarrantyStatus = row.Field<string>("Warranty") != null ? row.Field<string>("Warranty") : string.Empty,
                             TrackingNumber = row.Field<string>("TrackingNumber"),
                             RmaNumber = row.Field<string>("RmaNumber"),
                             UnitReceivedDate = row.Field<DateTime?>("UnitRecievedDate"),
                             Ageing = row.Field<int?>("Ageing"),
                             DoAStatus = row.Field<string>("DOAStatus")
                         }).ToList();

            return items;
        }

        /// <summary>
        /// Save job allocation.
        /// </summary>
        /// <param name="jobAllocationDto"></param>
        /// <param name="trackingNumbers"></param>
        /// <returns></returns>
        public async Task<bool> SaveJobAllocationAsync(JobAllocationDto jobAllocationDto, List<string> trackingNumbers)
        {
            var isSaved = false;
            var connection = new SqlConnection();
            SqlTransaction transaction = null;
            try
            {
                connection = SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_DATA_DATABASE);
                await connection.OpenAsync().ConfigureAwait(false);
                transaction = connection.BeginTransaction();

                var query = $@"UPDATE [{RepositoryConstants.SchemaName}].[{HAMI.MasterTables.JobRepair}] 
                           SET JobAll_Techcd=@user_id, JobAll_Date=GETDATE(),JobAll_EnggCode=@engineer_code, TECHCD=@engineer_code
                           WHERE ccode=@location_code 
                           AND JOBNO IN (SELECT CSORef FROM  
                           [{RepositoryConstants.ScpDatabase}].[{RepositoryConstants.SchemaName}].[{SCP.TransactionTables.DealerLog}]
                           WHERE docno IN ({ trackingNumbers.ToSingleQuote(',')}));

                           UPDATE [{RepositoryConstants.ScpDatabase}].[{RepositoryConstants.SchemaName}].[{SCP.TransactionTables.DealerLog}] 
                           SET jobstatus = @job_status WHERE docno IN ({ trackingNumbers.ToSingleQuote(',')})";

                var parameters = new SqlParameter[]
                {
                    new SqlParameter { ParameterName = "@location_code", Value = jobAllocationDto.LocationCode },
                    new SqlParameter { ParameterName = "@engineer_code", Value = jobAllocationDto.EngineerCode },
                    new SqlParameter { ParameterName = "@job_status", Value = (int) JobStatusType.WaitingForUnitRequest },
                    new SqlParameter { ParameterName = "@user_id", Value = jobAllocationDto.UserId }
                };

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

        private async Task<KeyValuePair<string, List<SqlParameter>>> GetPendingJobAllocationQueryAsync(JobAllocationDto jobAllocationDto, int jobStatus)
        {
            if (!string.IsNullOrEmpty(jobAllocationDto.Model) && jobAllocationDto.Model == RepositoryConstants.DefaultSelectItem)
                jobAllocationDto.Model = null;

            var parameters = new List<SqlParameter>
            {
                new SqlParameter { ParameterName = "@location_code", Value = jobAllocationDto.LocationCode },
                new SqlParameter { ParameterName = "@job_status", Value = jobStatus },
                new SqlParameter { ParameterName = "@engineer_code", Value = jobAllocationDto.EngineerCode },
                new SqlParameter { ParameterName = "@product_name", Value = jobAllocationDto.ProductName },
                new SqlParameter { ParameterName = "@brand_name", Value = jobAllocationDto.BrandName },
                new SqlParameter { ParameterName = "@model", Value = jobAllocationDto.Model },
                new SqlParameter { ParameterName = "@job_number", Value = jobAllocationDto.JobNumber }

            };


            var baseQuery = $@"SELECT 
	                            CAST(0 AS BIT) AS [Status], WarrantyType, docno AS [TrackingNumber], rmano AS [RmaNumber], 
	                            JobNo AS [JobNumber], UnitRecieved_TCDate AS [UnitRecievedDate], Product, Brand, Model,
	                            ISNULL(ageinghrs,0) AS Ageing, DOAStatus, ccode AS [LocationCode], LocationName, 
                                CASE WARRANTY WHEN 'N' THEN 'Non Warranty' ELSE 'Wrarranty' END AS Warranty
                            FROM [{RepositoryConstants.SchemaName}].[{HAMI.Views.Jobs}]
                            WHERE ccode=@location_code
                            AND JobStatus = @job_status
                            AND (@engineer_code IS NULL OR (@engineer_code IS NOT NULL AND JobAll_EnggCode=@engineer_code))
                            AND (@product_name IS NULL OR (@product_name IS NOT NULL AND Product=@product_name))
                            AND (@brand_name IS NULL OR (@brand_name IS NOT NULL AND Brand=@brand_name))
                            AND (@model IS NULL OR (@model IS NOT NULL AND Model=@model))
                            AND (@job_number IS NULL OR (@job_number IS NOT NULL AND JobNo=@job_number))
                            ";

            return await Task.FromResult(new KeyValuePair<string, List<SqlParameter>>(baseQuery, parameters));
        }

        #endregion
    }
}
