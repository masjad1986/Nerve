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

        public async Task<IEnumerable<ProductModelDto>> GetAllProductModelAsync()
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

        public async Task<IEnumerable<ProductModelDto>> GetProductModelAsync(string productName)
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

        public async Task<IEnumerable<ProductModelDto>> GetProductModelByNameAndBrandAsync(string productName, string brandName)
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

        #region Service Centres

        
        #endregion

        #region Collection Point
        public async Task<IEnumerable<CollectionPointDto>> GetCollectionPointByUserIdAsync(string userId, string searchAccount)
        {
            var query = $@"SELECT TRIM(A.accode) AS [Id], TRIM(A.name) AS [Name] 
                            FROM [{RepositoryConstants.SchemaName}].[{HAMI.MasterTables.AccountMaster}] A
                            JOIN [{RepositoryConstants.ScpDatabase}].[{RepositoryConstants.SchemaName}].[{SCP.MasterTables.UserMaster}] UM ON A.accode = UM.USERID AND ISNULL(UM.Inactive, 0) = 0
                            JOIN [{RepositoryConstants.ScpDatabase}].[{RepositoryConstants.SchemaName}].[{SCP.MasterTables.LaptopVendorMaster}] VM ON UM.Laptop_VenderID = VM.ID
                            JOIN [{RepositoryConstants.ScpDatabase}].[{RepositoryConstants.SchemaName}].[{SCP.MasterTables.UserMasterDetail}] UMD ON VM.ID = UMD.ServiceCentreID AND UMD.Deleted = 'N'
                            WHERE A.grpcd = @gr_code
                            AND A.accode NOT LIKE @exclude_acc_code+'%'
                            AND TRIM(UM.USERID) = @user_id
                            AND (@search IS NULL OR (@search IS NOT NULL AND (A.accode LIKE '%'+@search+'%' OR A.name LIKE '%'+@search+'%')))
                            GROUP BY A.accode,A.name ORDER BY A.name";

            var parameters = new SqlParameter[]
            {
                new SqlParameter {ParameterName="@user_id",Value=userId},
                new SqlParameter {ParameterName="@search",Value=searchAccount},
                new SqlParameter {ParameterName="@gr_code",Value="SDD02"},
                new SqlParameter {ParameterName="@exclude_acc_code",Value="MLDS"}
            };

            var reader = await SqlHelper.ExecuteReaderAsync(SqlHelper.GetSqlConnectionAsync(_settings.Value.HAMI_DATA_DATABASE),
                CommandType.Text,
                query,
                parameters);

            if (!reader.HasRows)
                return new List<CollectionPointDto>();

            var table = new DataTable();
            table.Load(reader);

            var collections = (from row in table.AsEnumerable()
                               select new CollectionPointDto
                               {
                                   Id = row.Field<string>("Id"),
                                   Name = row.Field<string>("Name")
                               }).ToList();

            return collections;
        }
        #endregion

        #region Fault Codes

        public async Task<IEnumerable<FaultDetailDto>> GetFaultCodesByBrandAsync(string brandName)
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

        #region Accessories
        public async Task<IEnumerable<AccessoryDto>> GetAccessoriesByProductAndBrandAsync(string productName, string brandCode)
        {
            var query = $@"SELECT AD.AccessoryID AS [Id], A.AccessoryDesc [Description], CAST(0 AS BIT) AS [IsSelected], 
	                        AD.AccessoryDetailID,  AD.ProductID, AD.DetailID, BD.ProductName, BD.BrandCode 
                        FROM [{RepositoryConstants.SchemaName}].[{SCP.MasterTables.AccessoryDetailMaster}] AS AD 
                        LEFT OUTER JOIN [{RepositoryConstants.SchemaName}].[{SCP.MasterTables.BrandDetail}] AS BD ON AD.ProductID = BD.ProductID And AD.DetailID = BD.DetailID
                        LEFT OUTER JOIN [{RepositoryConstants.SchemaName}].[{SCP.MasterTables.AccessoryMaster}] AS A ON AD.AccessoryID = A.AccessoryID
                        WHERE BD.ProductName=@product_name AND BD.BrandCode=@brand_code 
                        ORDER BY A.AccessoryDesc";

            var parameters = new SqlParameter[]
            {
                new SqlParameter {ParameterName="@brand_code", Value = brandCode},
                new SqlParameter {ParameterName="@product_name", Value = productName}
            };

            var reader = await SqlHelper.ExecuteReaderAsync(SqlHelper.GetSqlConnectionAsync(_settings.Value.HAMI_SCP_DATABASE),
                CommandType.Text,
                query,
                parameters);

            if (!reader.HasRows)
                return new List<AccessoryDto>();

            var table = new DataTable();
            table.Load(reader);

            var accessories = (from row in table.AsEnumerable()
                               select new AccessoryDto
                               {
                                   Id = row.Field<int>("Id"),
                                   Description = row.Field<string>("Description"),
                                   AccessoryDetailId = row.Field<int>("AccessoryDetailId"),
                                   DetailId = row.Field<int>("DetailId"),
                                   ProductId = row.Field<int>("ProductId"),
                                   ProductName = row.Field<string>("ProductName"),
                                   BrandCode = row.Field<string>("BrandCode"),
                                   IsSelected = row.Field<bool>("IsSelected")
                               }).ToList();

            return accessories;
        }
        #endregion

        #region Physical Condition
        public async Task<IEnumerable<PhysicalConditionDto>> GetPhysicalConditionsAsync()
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
                           WITH(TABLOCKX) WHERE TRTYPE='TRAK' AND ML_YEAR=@year
                            
                           UPDATE [{RepositoryConstants.SchemaName}].[{SCP.MasterTables.ReferenceMaster}] 
                           SET CURRNO=@currno WHERE TRTYPE=@trtype AND ML_YEAR=@year

                           SELECT TRIM(@prefix)+'-'+SUBSTRING(TRIM(@year),3,2)+'-'+REPLICATE('0', 6 - LEN(@currno)) + TRIM(STR(@currno)) AS [DocumentNumber]
                           ";

            var parameters = new SqlParameter[]
            {
                new SqlParameter { ParameterName = "@trtype", Value = "TRAK"},
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
