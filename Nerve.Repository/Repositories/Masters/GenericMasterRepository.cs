using Microsoft.Extensions.Options;
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
    public class GenericMasterRepository : IGenericMasterRepository
    {
        private readonly IOptions<AppSettings> _settings;
        public GenericMasterRepository(IOptions<AppSettings> settings)
        {
            _settings = settings;
        }

        #region Product Model

        public async Task<List<ProductModelDto>> GetAllProductModelAsync()
        {
            var query = $@"SELECT DISTINCT ITCODE [Code], ITDESC AS [Name], ITBRAND AS [BrandName], PRODUCTTYPE AS [ProductName]
                            FROM {RepositoryConstants.SchemaName}.{HAMI.MasterTables.BcgMaster} WHERE ITTAG = @tag 
                            AND producttype = @product_name
                            ORDER BY ITDESC";

            var parameters = new SqlParameter[]
            {
                new SqlParameter {ParameterName = "@tag", Value = HAMI.BcgMasterTag.Model}
            };

            var reader = await SqlHelper.ExecuteReaderAsync(SqlHelper.GetSqlConnectionAsync(_settings.Value.HAMI_DATA_DATABASE),
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

        public async Task<List<ProductModelDto>> GetProductModelAsync(string productName)
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

            var reader = await SqlHelper.ExecuteReaderAsync(SqlHelper.GetSqlConnectionAsync(_settings.Value.HAMI_DATA_DATABASE),
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

        public async Task<List<ProductModelDto>> GetProductModelByNameAndBrandAsync(string productName, string brandName)
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

            var reader = await SqlHelper.ExecuteReaderAsync(SqlHelper.GetSqlConnectionAsync(_settings.Value.HAMI_DATA_DATABASE),
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

        #endregion
        
        #region Fault Codes

        public async Task<List<FaultDetailDto>> GetFaultCodesByBrandAsync(string brandName)
        {
            var query = $@"SELECT ITCODE [Code], ITDESC AS [Name], ITBRAND AS [BrandName]
                            FROM {RepositoryConstants.SchemaName}.{HAMI.MasterTables.BcgMaster} WHERE ITTAG = @tag 
                            AND ITBRAND = @brand_name
                            ORDER BY ITDESC";

            var parameters = new SqlParameter[]
            {
                new SqlParameter {ParameterName = "@tag", Value = HAMI.BcgMasterTag.FaultCode},
                new SqlParameter {ParameterName="@brand_name", Value = brandName}
            };

            var reader = await SqlHelper.ExecuteReaderAsync(SqlHelper.GetSqlConnectionAsync(_settings.Value.HAMI_DATA_DATABASE),
                CommandType.Text,
                query,
                parameters);

            if (!reader.HasRows)
                return new List<FaultDetailDto>();

            var table = new DataTable();
            table.Load(reader);

            var models = (from row in table.AsEnumerable()
                          select new FaultDetailDto
                          {
                              Code = row.Field<string>("Code"),
                              Name = row.Field<string>("Name"),
                              BrandName = row.Field<string>("BrandName")
                          }).ToList();

            return models;
        }

        #endregion
        
        #region Physical Condition
        public async Task<List<PhysicalConditionDto>> GetPhysicalConditionsAsync()
        {
            var query = $@"SELECT Id, PhysicalCondition AS [Description],
                               PhyConditionOtherLang [FarsiDescription] 
                            FROM [{RepositoryConstants.SchemaName}].[{SCP.MasterTables.PhysicalConditionMaster}]
                            ORDER BY PhysicalCondition";

            var reader = await SqlHelper.ExecuteReaderAsync(SqlHelper.GetSqlConnectionAsync(_settings.Value.HAMI_SCP_DATABASE),
                CommandType.Text,
                query);

            if (!reader.HasRows)
                return new List<PhysicalConditionDto>();

            var table = new DataTable();
            table.Load(reader);

            var conditions = (from row in table.AsEnumerable()
                              select new PhysicalConditionDto
                              {
                                  Id = row.Field<int>("Id"),
                                  Description = row.Field<string>("Description"),
                                  FarsiDescription = row.Field<string>("FarsiDescription")
                              }).ToList();

            return conditions;
        }

        #endregion

        #region Document Number
        public async Task<string> GetAutoGeneratedDocumentNumberAsync(int year, string prefix)
        {
            /*
                 SELECT @ndocno = isnull(currno,100000)+1 FROM ref WITH(TABLOCKX) where TRTYPE='TRAK' and ML_YEAR=@mlyear  
                 update ref set currno=@ndocno where TRTYPE='TRAK'  
                 SET @DocNo = rtrim(@Prefix)+'-'+substring(rtrim(@mlyear),3,2)+'-'+REPLICATE('0', 6 - LEN(@ndocno)) + ltrim(str(@nDocNo))  

            */
            var query = $@"DECLARE @currno INT
                           SELECT @currno = ISNULL(CURRNO,{RepositoryConstants.DefaultDocumentNumber}) + 1 
                           FROM [{RepositoryConstants.SchemaName}].[{SCP.MasterTables.ReferenceMaster}] 
                           WITH(TABLOCKX) WHERE TRTYPE=@type AND ML_YEAR=@year
                            
                           UPDATE [{RepositoryConstants.SchemaName}].[{SCP.MasterTables.ReferenceMaster}] 
                           SET CURRNO=@currno WHERE TRTYPE=@type AND ML_YEAR=@year

                           SELECT TRIM(@prefix)+'-'+RIGHT(@year,2)+'-'+REPLICATE('0', 6 - LEN(@currno)) + TRIM(STR(@currno)) AS [DocumentNumber]
                           ";

            var parameters = new SqlParameter[]
            {
                new SqlParameter { ParameterName = "@type", Value = "TRAK"},
                new SqlParameter { ParameterName = "@prefix", Value = prefix},
                new SqlParameter { ParameterName = "@year", Value = year}
            };

            var number = (string) await SqlHelper.ExecuteScalarAsync(SqlHelper.GetSqlConnectionAsync(_settings.Value.HAMI_SCP_DATABASE),
                CommandType.Text,
                query,
                parameters);

            return number;
        }
        #endregion
    }
}
