using Microsoft.Extensions.Options;
using Nerve.Common.Models;
using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Nerve.Repository
{
    public class DeliveryRepository : IDeliveryRepository
    {
        private readonly IOptions<AppSettings> _appSettings;
        public DeliveryRepository(IOptions<AppSettings> appSettings)
        {
            _appSettings = appSettings;
        }

        /// <summary>
        /// Get list of delivery agent.
        /// </summary>
        /// <returns></returns>
        public async Task<List<DeliveryAgentDto>> GetDeliveryAgentsAsync()
        {
            var query = $@"SELECT Agent_Code AS [Code], Agent_Name AS [Name], Description, Country, MobileNo AS [Mobile],
                            Biker, Status, Target, Email, CC, Type 
                            FROM  { SCP.MasterTables.DeliveryAgent } ORDER BY Agent_Name";
            var connection = SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_SCP_DATABASE);
            var reader = await SqlHelper.ExecuteReaderAsync(connection, CommandType.Text, query);
            if (!reader.HasRows)
            {
                return new List<DeliveryAgentDto>();
            }

            var table = new DataTable();
            table.Load(reader);

            var items = (from row in table.AsEnumerable()
                         select new DeliveryAgentDto
                         {
                             Code = row.Field<int>("Code"),
                             Name = row.Field<string>("Name"),
                             Description = row.Field<string>("Description"),
                             Country = row.Field<string>("Country"),
                             MobileNumber = row.Field<string>("Mobile"),
                             Biker = row.Field<int?>("Biker"),
                             Status = row.Field<string>("Status"),
                             Target = row.Field<int?>("Target"),
                             Email = row.Field<string>("Email"),
                             CC = row.Field<string>("CC"),
                             Type = row.Field<string>("Type")
                         }).ToList();
            return await Task.FromResult(items);
        }
    }
}
