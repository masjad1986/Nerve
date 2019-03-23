using Microsoft.Extensions.Options;
using Nerve.Common.Models;
using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Repository
{
    class ProductModelRepository: IProductModelRepository
    {
        private readonly IOptions<AppSettings> _appSettings;
        public ProductModelRepository(IOptions<AppSettings> appSettings)
        {
            _appSettings = appSettings;
        }


        public async Task<List<ProductModelDto>> GetAllAsync()
        {
            var query = $@"SELECT DISTINCT ITCODE [Code], ITDESC AS [Name], ITBRAND AS [BrandName], PRODUCTTYPE AS [ProductName]
                            FROM {RepositoryConstants.SchemaName}.{HAMI.MasterTables.BcgMaster} WHERE ITTAG = @tag 
                            AND producttype = @product_name
                            ORDER BY ITDESC";

            var parameters = new SqlParameter[]
            {
                new SqlParameter {ParameterName = "@tag", Value = HAMI.BcgMasterTag.Model}
            };

            var reader = await SqlHelper.ExecuteReaderAsync(SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_DATA_DATABASE),
                CommandType.Text,
                query,
                parameters);

            if (!reader.HasRows)
                return new List<ProductModelDto>();

            var table = new DataTable();
            table.Load(reader);

            var models = (from row in table.AsEnumerable()
                          select new ProductModelDto
                          {
                              Code = row.Field<string>("Code"),
                              Name = row.Field<string>("Name"),
                              ProductName = row.Field<string>("ProductName"),
                              BrandName = row.Field<string>("BrandName")
                          }).ToList();

            return models;
        }

        public async Task<List<ProductModelDto>> GetByProductNameAsync(string productName)
        {
            var query = $@"SELECT DISTINCT ITCODE [Code], ITDESC AS [Name], ITBRAND AS [BrandName], PRODUCTTYPE AS [ProductName]
                            FROM {RepositoryConstants.SchemaName}.{HAMI.MasterTables.BcgMaster} WHERE ITTAG = @tag 
                            AND producttype = @product_name
                            ORDER BY ITDESC";

            var parameters = new SqlParameter[]
            {
                new SqlParameter {ParameterName = "@tag", Value = HAMI.BcgMasterTag.Model},
                new SqlParameter {ParameterName="@product_name", Value = productName}
            };

            var reader = await SqlHelper.ExecuteReaderAsync(SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_DATA_DATABASE),
                CommandType.Text,
                query,
                parameters);

            if (!reader.HasRows)
                return new List<ProductModelDto>();

            var table = new DataTable();
            table.Load(reader);

            var models = (from row in table.AsEnumerable()
                          select new ProductModelDto
                          {
                              Code = row.Field<string>("Code"),
                              Name = row.Field<string>("Name"),
                              ProductName = row.Field<string>("ProductName"),
                              BrandName = row.Field<string>("BrandName")
                          }).ToList();

            return models;
        }

        public async Task<List<ProductModelDto>> GetByProductNameAndBrandNameAsync(string productName, string brandName)
        {
            var query = $@"SELECT ITCODE [Code], ITDESC AS [Name], ITBRAND AS [BrandName], PRODUCTTYPE AS [ProductName]
                            FROM {RepositoryConstants.SchemaName}.{HAMI.MasterTables.BcgMaster} WHERE ITTAG = @tag 
                            AND ITBRAND = @brand_name
                            AND producttype = @product_name
                            ORDER BY ITDESC";

            var parameters = new SqlParameter[]
            {
                new SqlParameter {ParameterName = "@tag", Value = HAMI.BcgMasterTag.Model},
                new SqlParameter {ParameterName="@brand_name", Value = brandName},
                new SqlParameter {ParameterName="@product_name", Value = productName}
            };

            var reader = await SqlHelper.ExecuteReaderAsync(SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_DATA_DATABASE),
                CommandType.Text,
                query,
                parameters);

            if (!reader.HasRows)
                return new List<ProductModelDto>();

            var table = new DataTable();
            table.Load(reader);

            var models = (from row in table.AsEnumerable()
                          select new ProductModelDto
                          {
                              Code = row.Field<string>("Code"),
                              Name = row.Field<string>("Name"),
                              ProductName = row.Field<string>("ProductName"),
                              BrandName = row.Field<string>("BrandName")
                          }).ToList();

            return models;
        }
    }
}
