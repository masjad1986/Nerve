using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.Options;
using Nerve.Common.Models;
using Nerve.Repository.Dtos;

namespace Nerve.Repository
{
    public class WarrantyRepository : IWarrantyRepository
    {
        private readonly IOptions<AppSettings> _appSettings;
        public WarrantyRepository(IOptions<AppSettings> appSettings)
        {
            _appSettings = appSettings;
        }

        /// <summary>
        /// Get list of warranty type stored in system
        /// </summary>
        /// <returns></returns>
        public async Task<List<TypeDto>> GetTypesAsync()
        {
            var query = $@"SELECT WarrantyTypeID AS [Id], WarrantyType AS [Name], PriorityLevel AS [Priority] FROM 
                            { SCP.MasterTables.WarrantyType } ORDER BY WarrantyType";

            var connection = SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_SCP_DATABASE);
            var reader = await SqlHelper.ExecuteReaderAsync(connection, CommandType.Text, query);
            if (!reader.HasRows)
            {
                return new List<TypeDto>();
            }

            var table = new DataTable();
            table.Load(reader);

            var items = (from row in table.AsEnumerable()
                         select new TypeDto
                         {
                             Id = row.Field<int>("Id"),
                             Name = row.Field<string>("Name"),
                             Priority = row.Field<int>("Priority")
                         }).ToList();
            return await Task.FromResult(items);
        }
    }
}
