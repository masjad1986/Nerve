using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.Options;
using Nerve.Repository.Dtos;

namespace Nerve.Repository
{
    public class AccessoryDetailRepository : IAccessoryDetailRepository
    {
        private readonly IOptions<AppSettings> _settings;
        public AccessoryDetailRepository(IOptions<AppSettings> settings)
        {
            _settings = settings;
        }


        public async Task<List<AccessoryDto>> GetByIdsAsync(List<int> ids, string productName, string brandCode)
        {
            var query = await GetBaseQueryAsync();
            query += $@" AND AD.AccessoryID IN ({string.Join(",", ids)})
                        ORDER BY A.AccessoryDesc";

            var parameters = new SqlParameter[]
            {
                new SqlParameter {ParameterName="@brand_code", Value = brandCode},
                new SqlParameter {ParameterName="@product_name", Value = productName}
            };

            var reader = await SqlHelper.ExecuteReaderAsync(SqlHelper.GetSqlConnectionAsync(_settings.Value.HAMI_SCP_DATABASE),
                CommandType.Text,
                query,
                parameters);

            return await GetQueryResultAsync(reader);
        }

        public async Task<List<AccessoryDto>> GetByProductAndBrandAsync(string productName, string brandCode)
        {
            var query = await GetBaseQueryAsync();
            query += $@" ORDER BY A.AccessoryDesc";

            var parameters = new SqlParameter[]
            {
                new SqlParameter {ParameterName="@brand_code", Value = brandCode},
                new SqlParameter {ParameterName="@product_name", Value = productName}
            };

            var reader = await SqlHelper.ExecuteReaderAsync(SqlHelper.GetSqlConnectionAsync(_settings.Value.HAMI_SCP_DATABASE),
                CommandType.Text,
                query,
                parameters);

            return await GetQueryResultAsync(reader);
        }

        private async Task<string> GetBaseQueryAsync()
        {
            var query = $@"SELECT AD.AccessoryID AS [Id], A.AccessoryDesc [Description], CAST(0 AS BIT) AS [IsSelected], 
	                        AD.AccessoryDetailID,  AD.ProductID, AD.DetailID, BD.ProductName, BD.BrandCode,AD.Deleted
                        FROM [{RepositoryConstants.SchemaName}].[{SCP.MasterTables.AccessoryDetailMaster}] AS AD 
                        LEFT OUTER JOIN [{RepositoryConstants.SchemaName}].[{SCP.MasterTables.BrandDetail}] AS BD ON AD.ProductID = BD.ProductID And AD.DetailID = BD.DetailID
                        LEFT OUTER JOIN [{RepositoryConstants.SchemaName}].[{SCP.MasterTables.AccessoryMaster}] AS A ON AD.AccessoryID = A.AccessoryID
                        WHERE BD.ProductName=@product_name AND BD.BrandCode=@brand_code";

            return await Task.FromResult(query);
        }

        private async Task<List<AccessoryDto>> GetQueryResultAsync(SqlDataReader reader)
        {

            if (!reader.HasRows)
                return new List<AccessoryDto>();

            var table = new DataTable();
            table.Load(reader);

            var accessories = (from row in table.AsEnumerable()
                               select new AccessoryDto
                               {
                                   Id = row.Field<int>("Id"),
                                   Description = row.Field<string>("Description"),
                                   AccessoryDetailId = row.Field<int>("AccessoryDetailId"),
                                   DetailId = row.Field<int>("DetailId"),
                                   ProductId = row.Field<int>("ProductId"),
                                   ProductName = row.Field<string>("ProductName"),
                                   BrandCode = row.Field<string>("BrandCode"),
                                   IsSelected = row.Field<bool>("IsSelected"),
                                   Deleted = row.Field<string>("Deleted")
                               }).ToList();

            return await Task.FromResult(accessories);
        }
    }
}
