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
    public class LocationRepository : ILocationRepository
    {
        private readonly IOptions<AppSettings> _appSettings;
        public LocationRepository(IOptions<AppSettings> appSettings)
        {
            _appSettings = appSettings;
        }

        /// <summary>
        /// Get list of all location.
        /// </summary>
        /// <returns></returns>
        public async Task<List<LocationDto>> GetAllAsync()
        {
            var query = $@"SELECT TRIM(locode) AS [Code] , loname AS [Name], LocPrefix AS [Prefix] 
                        FROM [{RepositoryConstants.SchemaName}].[{HAMI.MasterTables.GluMaster}]
                        WHERE locode IS NOT NULL
                        AND LEFT(locode, 1) = 'G' 
                        AND blockloc<>1
                        ORDER BY locode, loname";

            var reader = await SqlHelper.ExecuteReaderAsync(SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_DATA_DATABASE),
               CommandType.Text,
               query);

            if (!reader.HasRows)
                return new List<LocationDto>();

            var table = new DataTable();
            table.Load(reader);

            var items = (from row in table.AsEnumerable()
                         select new LocationDto
                         {
                             Code = row.Field<string>("Code"),
                             Name = row.Field<string>("Name"),
                             Prefix = row.Field<string>("Prefix")
                         }).ToList();

            return items;
        }

        /// <summary>
        /// Get list of location based on search.
        /// </summary>
        /// <param name="search">Search location based on Code or Name.</param>
        /// <returns></returns>
        public async Task<List<LocationDto>> GetAllBySearchAsync(string search)
        {
            var query = $@"SELECT TRIM(locode) AS [Code] , loname AS [Name], LocPrefix AS [Prefix] 
                        FROM [{RepositoryConstants.SchemaName}].[{HAMI.MasterTables.GluMaster}]
                        WHERE locode IS NOT NULL
                        AND SUBSTRING(locode,1,1) = 'G' 
                        AND (locode LIKE '%'+@search+'%' OR loname LIKE '%'+@search+'%')
                        AND blockloc<>1
                        ORDER BY locode, loname";

            var parameters = new SqlParameter[]
            {
                new SqlParameter { ParameterName = "@search", Value = search }
            };

            var reader = await SqlHelper.ExecuteReaderAsync(SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_DATA_DATABASE),
               CommandType.Text,
               query,
               parameters);

            if (!reader.HasRows)
                return new List<LocationDto>();

            var table = new DataTable();
            table.Load(reader);

            var items = (from row in table.AsEnumerable()
                         select new LocationDto
                         {
                             Code = row.Field<string>("Code"),
                             Name = row.Field<string>("Name"),
                             Prefix = row.Field<string>("Prefix")
                         }).ToList();

            return items;
        }
    }
}
