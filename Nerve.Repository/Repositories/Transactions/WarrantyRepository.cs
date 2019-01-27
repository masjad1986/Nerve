﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.Options;
using Nerve.Repository.Dtos;

namespace Nerve.Repository
{
    public class WarrantyRepository : IWarrantyRepository
    {
        private readonly AppSettings _appSettings;
        public WarrantyRepository(IOptions<AppSettings> appSettings)
        {
            _appSettings = appSettings.Value;
        }

        /// <summary>
        /// Get list of warranty type stored in system
        /// </summary>
        /// <returns></returns>
        public async Task<IEnumerable<WarrantyTypeDto>> GetWarrantyTypesAsync()
        {
            var query = $@"SELECT WarrantyTypeID AS [Id], WarrantyType AS [Name], PriorityLevel AS [Priority] FROM 
                            { SCP.MasterTables.WarrantyType } ORDER BY WarrantyType";

            var connection = SqlHelper.GetSqlConnectionAsync(_appSettings.HAMI_SCP_DATABASE);
            var reader = await SqlHelper.ExecuteReaderAsync(connection, CommandType.Text, query);
            if (!reader.HasRows)
            {
                return new List<WarrantyTypeDto>();
            }

            var table = new DataTable();
            table.Load(reader);

            var items = (from row in table.AsEnumerable()
                         select new WarrantyTypeDto
                         {
                             Id = row.Field<int>("Id"),
                             Name = row.Field<string>("Name"),
                             Priority = row.Field<int>("Priority")
                         }).ToList();
            return await Task.FromResult(items);
        }
    }
}
