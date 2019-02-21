using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.Options;
using Nerve.Common.Models;
using Nerve.Repository.Dtos;

namespace Nerve.Repository
{
    public class InvoiceRepository : IInvoiceRepository
    {
        private readonly IOptions<AppSettings> _appSettings;
        public InvoiceRepository(IOptions<AppSettings> appSettings)
        {
            _appSettings = appSettings;
        }

        /// <summary>
        /// Get list of dealer invoice.
        /// </summary>
        /// <param name="searchInvoice"></param>
        /// <returns></returns>
        public async Task<List<DealerInvoiceDto>> GetDealerInvoiceAsync(string searchInvoice)
        {
            var query = $@"SELECT  
	                            [t] AS Id, Invoiceno AS [InvoiceNumber], DeliveryAgent, 
	                            PreparedDate [InvoiceDate], ReqRef AS [RequestReference],
	                            LocPrefix AS [LocationPrefix], DCustomerName AS [CollectionPointName],
	                            AWBNo AS [AirwayBillNumber], SlipReceived, PreparedDate, DeliveryID AS [DeliveryId],
	                            GRVReturn, GRVReturn_SupplierName, Remarks, COSMOSREF AS [CosmosReference],
	                            USERID AS [UserId]
                            FROM [{ RepositoryConstants.SchemaName }].[{ SCP.TransactionTables.DealerInvoice }] 
                            WHERE (@search IS NULL OR (@search IS NOT NULL && Invoiceno LIKE '%'+@search+'%'))
                            ORDER BY Invoiceno";

            var connection = SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_SCP_DATABASE);
            var reader = await SqlHelper.ExecuteReaderAsync(connection, CommandType.Text, query);
            if (!reader.HasRows)
            {
                return new List<DealerInvoiceDto>();
            }

            var table = new DataTable();
            table.Load(reader);

            var items = (from row in table.AsEnumerable()
                         select new DealerInvoiceDto
                         {
                             Id = row.Field<int>("Id"),
                             InvoiceNumber = row.Field<int>("InvoiceNumber"),
                             InvoiceDate = row.Field<DateTime?>("InvoiceDate"),
                             CollectionPointName = row.Field<string>("CollectionPointName"),
                             LocationPrefix = row.Field<string>("LocationPrefix"),
                             RequestReference = row.Field<string>("RequestReference"),
                             AirwayBillNumber = row.Field<string>("AirwayBillNumber"),
                             DeliveryAgent = row.Field<string>("DeliveryAgent"),
                             DeliveryId = row.Field<string>("DeliveryId"),
                             GrvReturn = row.Field<int?>("GRVReturn"),
                             GrvReturnSupplierName = row.Field<string>("GRVReturn_SupplierName"),
                             Remarks = row.Field<string>("Remarks"),
                             SlipReceived = row.Field<int?>("SlipReceived"),
                             PreparedDate = row.Field<DateTime?>("PreparedDate"),
                             CosmosReference = row.Field<string>("CosmosReference"),
                             UserId = row.Field<string>("UserId"),
                         }).ToList();

            return await Task.FromResult(items);
        }
    }
}
