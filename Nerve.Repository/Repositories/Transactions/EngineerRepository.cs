using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.Options;
using Nerve.Common.Models;
using Nerve.Repository.Dtos;

namespace Nerve.Repository
{
    public class EngineerRepository : IEngineerRepository
    {
        private readonly IOptions<AppSettings> _appSettings;
        public EngineerRepository(IOptions<AppSettings> appSettings)
        {
            _appSettings = appSettings;
        }

        public async Task<List<EngineerDto>> GetAllAsync(string search)
        {
            var query = $@"SELECT ITCODE AS [Code],ITDESC AS [Name], 1 AS [Type]
                        FROM [{RepositoryConstants.SchemaName}].[{HAMI.MasterTables.BcgMaster}] 
                        WHERE ITTAG = @tag
                        ORDER BY ITDESC";

            if (!string.IsNullOrEmpty(search))
            {
                query = " AND (ITCODE LIKE '%'+@search+'%' OR ITDESC LIKE '%'+@search+'%')";
            }
            var parameters = new SqlParameter[]
            {
                new SqlParameter { ParameterName = "@search", Value = search },
                new SqlParameter { ParameterName = "@tag", Value = HAMI.BcgMasterTag.Engineer },
            };

            var reader = await SqlHelper.ExecuteReaderAsync(SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_DATA_DATABASE),
               CommandType.Text,
               query,
               parameters);

            if (!reader.HasRows)
                return new List<EngineerDto>();

            var table = new DataTable();
            table.Load(reader);

            var items = (from row in table.AsEnumerable()
                         select new EngineerDto
                         {
                             Code = row.Field<string>("Code"),
                             Name = row.Field<string>("Name"),
                             LocationCode = row.Field<string>("LocationCode"),
                             Type = row.Field<int>("Type")
                         }).ToList();

            return items;
        }

        /// <summary>
        /// Get list of engineer by location code.
        /// </summary>
        /// <param name="locationCode"></param>
        /// <returns></returns>
        public async Task<List<EngineerDto>> GetByLocationAsync(string locationCode)
        {
            var query = $@"SELECT u.enggcode AS [Code], u.name AS [Name], COALESCE(loc, locode) AS [LocationCode], CAST(u.enggtype1 AS INT) AS [Type]
                            FROM [{RepositoryConstants.SchemaName}].[{VIEW.MasterTables.UserMaster}] u
                            INNER JOIN [{RepositoryConstants.HamiDatabase}].[{RepositoryConstants.SchemaName}].[{HAMI.MasterTables.BcgMaster}] b on b.ITCODE = u.USERID And b.ITTAG = @tag
                            WHERE ISNULL(u.block, 0) <> 1
                            AND (ISNULL(u.enggtype, 0) = 1 AND ISNULL(u.enggtype1, 0) = 1)
                            AND CHARINDEX(@location_code, LOC, 1) > 0
                            ORDER BY u.name";

            var parameters = new SqlParameter[]
            {
                new SqlParameter { ParameterName = "@location_code", Value = locationCode },
                new SqlParameter { ParameterName = "@tag", Value = HAMI.BcgMasterTag.Engineer },
            };

            var reader = await SqlHelper.ExecuteReaderAsync(SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_VM_DATABASE),
                CommandType.Text,
                query,
                parameters);

            if (!reader.HasRows)
                return new List<EngineerDto>();

            var table = new DataTable();
            table.Load(reader);

            var items = (from row in table.AsEnumerable()
                         select new EngineerDto
                         {
                             Code = row.Field<string>("Code"),
                             Name = row.Field<string>("Name"),
                             LocationCode = row.Field<string>("LocationCode"),
                             Type = row.Field<int>("Type")
                         }).ToList();

            return items;
        }
    }
}
