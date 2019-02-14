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
    public class ProductRepository : IProductRepository
    {
        private readonly IOptions<AppSettings> _settings;
        public ProductRepository(IOptions<AppSettings> settings)
        {
            _settings = settings;
        }

        public async Task<List<ProductDto>> GetAllAsync()
        {
            var query = $@"SELECT ProductID AS [Id], ProductName AS [Name] FROM 
                            {RepositoryConstants.SchemaName}.{SCP.MasterTables.Product} 
                            ORDER BY ProductName";

            var reader = await SqlHelper.ExecuteReaderAsync(SqlHelper.GetSqlConnectionAsync(_settings.Value.HAMI_SCP_DATABASE),
                CommandType.Text,
                query);

            if (!reader.HasRows)
                return new List<ProductDto>();

            var table = new DataTable();
            table.Load(reader);

            var products = (from row in table.AsEnumerable()
                            select new ProductDto
                            {
                                Id = row.Field<int>("Id"),
                                Name = row.Field<string>("Name")
                            }).ToList();

            return products;
        }

        public async Task<ProductDto> GetByIdAsync(int productId)
        {
            var query = $@"SELECT ProductID AS [Id], ProductName AS [Name] FROM 
                            {RepositoryConstants.SchemaName}.{SCP.MasterTables.Product} 
                            WHERE ProductID = @product_id
                            ORDER BY ProductName";

            var parameters = new SqlParameter[]
            {
                new SqlParameter
                {
                    ParameterName = "@product_id",
                    Value = productId
                }
            };

            var reader = await SqlHelper.ExecuteReaderAsync(SqlHelper.GetSqlConnectionAsync(_settings.Value.HAMI_DATA_DATABASE),
                CommandType.Text,
                query,
                parameters);

            if (!reader.HasRows)
                return new ProductDto();

            var table = new DataTable();
            table.Load(reader);

            var product = (from row in table.AsEnumerable()
                          select new ProductDto
                          {
                              Id = row.Field<int>("Id"),
                              Name = row.Field<string>("Name")
                          }).FirstOrDefault();

            return product;
        }

        public Task<BrandDto> GetByIdAsync()
        {
            throw new NotImplementedException();
        }
    }
}
