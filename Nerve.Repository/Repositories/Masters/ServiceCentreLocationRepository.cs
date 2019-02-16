using Microsoft.Extensions.Options;
using Nerve.Common.Models;
using Nerve.Repository.Dtos;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Nerve.Repository
{
    public class ServiceCentreLocationRepository : IServiceCentreLocationRepository
    {
        private readonly IOptions<AppSettings> _appSettings;
        public ServiceCentreLocationRepository(IOptions<AppSettings> appSettings)
        {
            _appSettings = appSettings;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="serviceCentreId"></param>
        /// <returns></returns>
        public async Task<List<ServiceCentreLocationDto>> GetByIdAsync(int serviceCentreId)
        {
            var query = await GetBaseQueryAsync();
            query += $@"WHERE ServiceCenterID = @service_centre_id
                       ORDER BY LocationName";

            var parameters = new SqlParameter[]
            {
                new SqlParameter { ParameterName ="@service_centre_id", Value = serviceCentreId }
            };

            var connection = SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_SCP_DATABASE);
            var reader = await SqlHelper.ExecuteReaderAsync(connection, CommandType.Text, query);
            if (!reader.HasRows)
            {
                return new List<ServiceCentreLocationDto>();
            }

            var table = new DataTable();
            table.Load(reader);

            var items = (from row in table.AsEnumerable()
                         select new ServiceCentreLocationDto
                         {
                             ServiceCenterId = row.Field<int>("ServiceCenterID"),
                             LocationName = row.Field<string>("LocationName"),
                             LocationCode = row.Field<string>("LocationCode"),
                             DetailId = row.Field<int?>("DetailID"),
                             ProductId = row.Field<int?>("ProductID"),
                             ProductName = row.Field<string>("ProductName"),
                             BrandCode = row.Field<string>("BrandCode"),
                             City = row.Field<string>("City"),
                             Country = row.Field<string>("Country"),
                         }).ToList();

            return await Task.FromResult(items);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="serviceCentreId"></param>
        /// <param name="productName"></param>
        /// <param name="brandCode"></param>
        /// <returns></returns>
        public async Task<List<ServiceCentreLocationDto>> GetByIdAndBrandAndProductAsync(int serviceCentreId, string productName, string brandCode)
        {
            var query = await GetBaseQueryAsync();
            query += $@"
                        WHERE S.ServiceCenterID=@service_center_id 
                        AND ProductName=@product_name
                        AND BrandCode=@brand_code
                        ORDER BY LocationName";

            var parameters = new SqlParameter[]
            {
                new SqlParameter {ParameterName = "@service_center_id", Value = serviceCentreId},
                new SqlParameter {ParameterName = "@product_name", Value = productName},
                new SqlParameter {ParameterName = "@brand_code", Value = brandCode}
            };

            var reader = await SqlHelper.ExecuteReaderAsync(SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_SCP_DATABASE),
                CommandType.Text,
                query,
                parameters);

            if (!reader.HasRows)
                return new List<ServiceCentreLocationDto>();

            var table = new DataTable();
            table.Load(reader);

            var centres = (from row in table.AsEnumerable()
                           select new ServiceCentreLocationDto
                           {
                               ServiceCenterId = row.Field<int>("ServiceCenterID"),
                               LocationName = row.Field<string>("LocationName"),
                               LocationCode = row.Field<string>("LocationCode"),
                               DetailId = row.Field<int?>("DetailID"),
                               ProductId = row.Field<int?>("ProductID"),
                               ProductName = row.Field<string>("ProductName"),
                               BrandCode = row.Field<string>("BrandCode"),
                               City = row.Field<string>("City"),
                               Country = row.Field<string>("Country"),
                           }).ToList();

            return centres;
        }

        public async Task<List<ItemDto>> GetByUserIdAsync(string userId, string searchAccount)
        {
            var query = $@"SELECT UMD.ServiceCentreID AS [Id], TRIM(A.name) AS [Name] 
                            FROM [{RepositoryConstants.SchemaName}].[{HAMI.MasterTables.AccountMaster}] A
                            JOIN [{RepositoryConstants.ScpDatabase}].[{RepositoryConstants.SchemaName}].[{SCP.MasterTables.UserMaster}] UM ON A.accode = UM.USERID AND ISNULL(UM.Inactive, 0) = 0
                            JOIN [{RepositoryConstants.ScpDatabase}].[{RepositoryConstants.SchemaName}].[{SCP.MasterTables.LaptopVendorMaster}] VM ON UM.Laptop_VenderID = VM.ID
                            JOIN [{RepositoryConstants.ScpDatabase}].[{RepositoryConstants.SchemaName}].[{SCP.MasterTables.UserMasterDetail}] UMD ON VM.ID = UMD.ServiceCentreID AND UMD.Deleted = 'N'
                            WHERE A.grpcd = @gr_code
                            AND A.accode NOT LIKE @exclude_acc_code+'%'
                            AND TRIM(UM.USERID) = @user_id
                            AND (@search IS NULL OR (@search IS NOT NULL AND (A.accode LIKE '%'+@search+'%' OR A.name LIKE '%'+@search+'%')))
                            GROUP BY UMD.ServiceCentreID,A.name ORDER BY A.name";

            var parameters = new SqlParameter[]
            {
                new SqlParameter {ParameterName="@user_id",Value=userId},
                new SqlParameter {ParameterName="@search",Value=searchAccount},
                new SqlParameter {ParameterName="@gr_code",Value="SDD02"},
                new SqlParameter {ParameterName="@exclude_acc_code",Value="MLDS"}
            };

            var reader = await SqlHelper.ExecuteReaderAsync(SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_DATA_DATABASE),
                CommandType.Text,
                query,
                parameters);

            if (!reader.HasRows)
                return new List<ItemDto>();

            var table = new DataTable();
            table.Load(reader);

            var centres = (from row in table.AsEnumerable()
                               select new ItemDto
                               {
                                   Id = row.Field<int>("Id"),
                                   Name = row.Field<string>("Name")
                               }).ToList();

            return centres;
        }


        public async Task<bool> IsExistsLocationByIdAndBrandAndProductAsync(int serviceCentreId, string productName, string brandCode)
        {
            var rows = await GetByIdAndBrandAndProductAsync(serviceCentreId, productName, brandCode);
            return rows != null && rows.Count() > 0;
        }

        private async Task<string> GetBaseQueryAsync()
        {
            var query = $@"SELECT S.ServiceCenterID,S.LocationCode,S.LocationName,S.DetailID,S.ProductID,S.ProductName,S.BrandCode,
	                        L.Country, L.City
                        FROM [{RepositoryConstants.SchemaName}].[{SCP.MasterTables.ServiceCentreLocation}] AS S
                        LEFT JOIN Laptop_VendorMaster AS L ON S.ServiceCenterID=L.ID";

            return await Task.FromResult(query);
        }
    }
}
