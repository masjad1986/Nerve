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
    public class BrandRepository : IBrandRepository
    {
        private readonly IOptions<AppSettings> _settings;
        public BrandRepository(IOptions<AppSettings> settings)
        {
            _settings = settings;
        }

        public async Task<List<BrandDto>> GetAllByProductNameAsync(string productName)
        {
            var query = $@"SELECT BrandCode AS [Code], BrandCode AS [Name], ProductName FROM 
                            {RepositoryConstants.SchemaName}.{SCP.MasterTables.Brand} WHERE ProductName = @product_name 
                            GROUP BY BrandCode,ProductName ORDER BY BrandCode";
            var parameters = new SqlParameter[]
            {
                new SqlParameter
                {
                    ParameterName ="@product_name",
                    Value = productName
                }
            };

            var reader = await SqlHelper.ExecuteReaderAsync(SqlHelper.GetSqlConnectionAsync(_settings.Value.HAMI_SCP_DATABASE),
                CommandType.Text,
                query,
                parameters);

            if (!reader.HasRows)
                return new List<BrandDto>();

            var table = new DataTable();
            table.Load(reader);

            var brands = (from row in table.AsEnumerable()
                          select new BrandDto
                          {
                              Code = row.Field<string>("Code"),
                              Name = row.Field<string>("Name"),
                              ProductName = row.Field<string>("ProductName")
                          }).ToList();

            return brands;
        }

        public async Task<List<BrandDto>> GetAllAsync()
        {
            var query = $@"SELECT BrandCode AS [Code], BrandCode AS [Name], ProductName FROM 
                            {RepositoryConstants.SchemaName}.{SCP.MasterTables.Brand} 
                            GROUP BY BrandCode ORDER BY BrandCode";

            var reader = await SqlHelper.ExecuteReaderAsync(SqlHelper.GetSqlConnectionAsync(_settings.Value.HAMI_DATA_DATABASE),
                CommandType.Text,
                query);

            if (!reader.HasRows)
                return new List<BrandDto>();

            var table = new DataTable();
            table.Load(reader);

            var brands = (from row in table.AsEnumerable()
                          select new BrandDto
                          {
                              Code = row.Field<string>("Code"),
                              Name = row.Field<string>("Name"),
                              ProductName = row.Field<string>("ProductName")
                          }).ToList();

            return brands;
        }

        public Task<BrandDto> GetByIdAsync()
        {
            throw new NotImplementedException();
        }
    }
}
