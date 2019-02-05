using Microsoft.Extensions.Options;
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
        private readonly IOptions<AppSettings> _settings;
        public ServiceCentreLocationRepository(IOptions<AppSettings> settings)
        {
            _settings = settings;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="serviceCentreId"></param>
        /// <returns></returns>
        public async Task<IEnumerable<ServiceCentreLocationDto>> GetByIdAsync(int serviceCentreId)
        {
            var query = $@"SELECT S.ServiceCenterID,S.LocationCode,S.LocationName,S.DetailID,S.ProductID,S.ProductName,S.BrandCode,
	                        L.Country, L.City
                        [{RepositoryConstants.SchemaName}].[{SCP.MasterTables.ServiceCentreLocation}] AS S
                        LEFT JOIN Laptop_VendorMaster AS L ON S.ServiceCenterID=L.ID
                        WHERE ServiceCenterID = @service_centre_id";

            var parameters = new SqlParameter[]
            {
                new SqlParameter { ParameterName ="@service_centre_id", Value = serviceCentreId }
            };

            var connection = SqlHelper.GetSqlConnectionAsync(_settings.Value.HAMI_SCP_DATABASE);
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
        public async Task<IEnumerable<ServiceCentreLocationDto>> GetByIdAndBrandAndProductAsync(int serviceCentreId, int productId, string brandCode)
        {
            var query = $@"SELECT DISTINCT ServiceCenterID AS [Id] ,LocationName, LocationCode, ProductID, ProductName, BrandCode
                        FROM [{RepositoryConstants.SchemaName}].[{SCP.MasterTables.ServiceCentreLocation}]
                        WHERE ServiceCenterID=@collection_point 
                        AND ProductID=@product_id
                        AND BrandCode=@brand_code
                        ORDER BY LocationName";

            var parameters = new SqlParameter[]
            {
                new SqlParameter {ParameterName = "@collection_point", Value = serviceCentreId},
                new SqlParameter {ParameterName = "@product_id", Value = productId},
                new SqlParameter {ParameterName = "@brand_code", Value = brandCode}
            };

            var reader = await SqlHelper.ExecuteReaderAsync(SqlHelper.GetSqlConnectionAsync(_settings.Value.HAMI_SCP_DATABASE),
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
                               ProductId = row.Field<int?>("ProductID"),
                               ProductName = row.Field<string>("ProductName"),
                               BrandCode = row.Field<string>("BrandCode"),
                           }).ToList();

            return centres;
        }

    }
}
