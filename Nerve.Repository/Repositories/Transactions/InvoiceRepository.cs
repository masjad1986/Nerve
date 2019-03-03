using Microsoft.Extensions.Options;
using Nerve.Common.Enums;
using Nerve.Common.Extensions;
using Nerve.Common.Models;
using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

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
        public async Task<List<DealerInvoiceDto>> GetDealerInvoiceAsync(int? searchInvoice)
        {
            var query = $@"SELECT  
	                            i.t AS Id, i.Invoiceno AS [InvoiceNumber], i.DeliveryAgent, 
	                            i.PreparedDate [InvoiceDate], i.ReqRef AS [RequestReference],
	                            i.LocPrefix AS [LocationPrefix], i.DCustomerName AS [CollectionPointName],
	                            i.AWBNo AS [AirwayBillNumber], i.SlipReceived, i.DeliveryID AS [DeliveryId],
	                            i.GRVReturn, i.GRVReturn_SupplierName, i.Remarks, i.COSMOSREF AS [CosmosReference],
	                            i.USERID AS [UserId], d.Product, d.Brand, d.CollRef AS [RmaNumber], sw.SwapIMEINo, d.FinalWarranty AS [Warranty],
                                id.Del_AWBNo AS [ShipmentDetails], id.LocationCode, id.Jobno AS [JobNumber], id.ID AS [InvoiceDetailId], d.LoginType,
                                ISNULL(id.Delivered, 0) AS [Delivered]
                            FROM  [{ RepositoryConstants.SchemaName }].[{ SCP.TransactionTables.DealerInvoice }] i
                            LEFT JOIN [{ RepositoryConstants.SchemaName }].[{ SCP.TransactionTables.DealerInvoiceDetail }] id ON i.Invoiceno = id.Invoiceno
                            LEFT JOIN [{ RepositoryConstants.SchemaName }].[{ SCP.TransactionTables.DealerLog }] d on d.Docno=id.TrackingNo
                            LEFT JOIN [{ RepositoryConstants.HamiDatabase}].[{RepositoryConstants.SchemaName}].[{HAMI.TransactionTables.SwapInvoice}] sw ON sw.TrackingNo=id.TrackingNo
                            WHERE (@search IS NULL OR (@search IS NOT NULL AND i.Invoiceno LIKE '%'+@search+'%'))
                            ORDER BY i.Invoiceno";

            var parameters = new SqlParameter[] {
                new SqlParameter { ParameterName = "@search", Value = searchInvoice }
            };
            var connection = SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_SCP_DATABASE);
            var reader = await SqlHelper.ExecuteReaderAsync(connection, CommandType.Text, query, parameters);
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
                             InvoiceDetailId = row.Field<int?>("InvoiceDetailId"),
                             LocationCode = row.Field<string>("LocationCode"),
                             ProductName = row.Field<string>("Product"),
                             BrandName = row.Field<string>("Brand"),
                             Model = row.Field<string>("Model"),
                             SwapImeiNumber = row.Field<string>("SwapIMEINo"),
                             WarrantyType = row.Field<int>("Warranty"),
                             WarrantyTypeText = row.Field<int?>("Warranty") != null ? Enum.GetName(typeof(WarrantyType), row.Field<int?>("Warranty")) : string.Empty,
                             AllocatedTo = row.Field<string>("DeliveryAgent"),
                             RmaNumber = row.Field<string>("RmaNumber"),
                             LoginType = row.Field<string>("LoginType"),
                             ShipmentDetails = row.Field<string>("ShipmentDetails"),
                             Delivery = Convert.ToBoolean(row.Field<int>("Delivered")),
                             UserId = row.Field<string>("UserId"),
                         }).ToList();

            return items;
        }

        /// <summary>
        /// Get list of dealer invoice by imei or tracking number and delivery agent.
        /// </summary>
        /// <param name="searchInvoice"></param>
        /// <returns></returns>
        public async Task<List<DealerInvoiceDto>> GetDealerInvoiceByParamAsync(string imeiOrTrackingNumber, int? deliveryAgent)
        {
            var baseQuery = await GetDealerInvoiceQueryAsync();
            var query = $@"{baseQuery}
                        WHERE d.JobStatus = @jobStatus
                        AND ISNULL(d.QRS, 0) = 0 AND ISNULL(d.ReceivedFrom_RC, 0) = @true 
                        AND ISNULL(r.Rep_TC_Received, 0) = @true
                        AND (@imei_or_tracking_number IS NULL OR (@imei_or_tracking_number IS NOT NULL AND (r.IMEINo like '%'+ @imei_or_tracking_number +'%' OR r.ProdigyRef LIKE '%'+@imei_or_tracking_number+'%' )))
                        AND (@delivery_agent IS NULL OR (@delivery_agent IS NOT NULL AND r.DeliveryAgent= @delivery_agent))";

            var parameters = new SqlParameter[]
            {
                new SqlParameter { ParameterName = "@jobStatus", Value = 30 },
                new SqlParameter { ParameterName = "@true", Value = 1},
                new SqlParameter { ParameterName = "@it_tag", Value = HAMI.BcgMasterTag.Model},
                new SqlParameter { ParameterName = "@imei_or_tracking_number", Value = imeiOrTrackingNumber },
                new SqlParameter { ParameterName = "@delivery_agent", Value = deliveryAgent }
            };

            var connection = SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_DATA_DATABASE);
            var reader = await SqlHelper.ExecuteReaderAsync(connection, CommandType.Text, query, parameters);
            if (!reader.HasRows)
            {
                return new List<DealerInvoiceDto>();
            }

            var table = new DataTable();
            table.Load(reader);

            var items = (from row in table.AsEnumerable()
                         select new DealerInvoiceDto
                         {
                             //Id = row.Field<int>("Id"),
                             InvoiceNumber = row.Field<decimal>("InvoiceNumber"),
                             InvoiceDate = row.Field<DateTime?>("InvoiceDate"),
                             CollectionPointName = row.Field<string>("CollectionPointName"),
                             CollectionPoint = row.Field<string>("CollectionPoint"),
                             JobNumber = row.Field<string>("JobNumber"),
                             ImeiNumber = row.Field<string>("ImeiNumber"),
                             TrackingNumber = row.Field<string>("TrackingNumber"),
                             //AirwayBillNumber = row.Field<string>("AirwayBillNumber"),
                             DeliveryAgent = row.Field<string>("DeliveryAgent"),
                             //DeliveryId = row.Field<string>("DeliveryId"),
                             //GrvReturn = row.Field<int?>("GRVReturn"),
                             //GrvReturnSupplierName = row.Field<string>("GRVReturn_SupplierName"),
                             //Remarks = row.Field<string>("Remarks"),
                             //SlipReceived = row.Field<int?>("SlipReceived"),
                             //PreparedDate = row.Field<DateTime?>("PreparedDate"),
                             //CosmosReference = row.Field<string>("CosmosReference"),
                             LocationCode = row.Field<string>("LocationCode"),
                             ProductName = row.Field<string>("Product"),
                             BrandName = row.Field<string>("Brand"),
                             Model = row.Field<string>("Model"),
                             SwapImeiNumber = row.Field<string>("SwapImeiNumber"),
                             WarrantyType = Convert.ToInt32(row.Field<string>("Warranty")),
                             WarrantyTypeText = Convert.ToInt32(row.Field<string>("Warranty")) > 0 ? Enum.GetName(typeof(WarrantyType), Convert.ToInt32(row.Field<string>("Warranty"))) : string.Empty,
                             AllocatedTo = row.Field<string>("DeliveryAgentName"),
                             RmaNumber = row.Field<string>("RmaNumber"),
                             LoginType = row.Field<string>("LoginType"),
                             //ShipmentDetails = row.Field<string>("ShipmentDetails"),
                             Delivery = row.Field<bool>("Delivery"),
                             Cost = row.Field<decimal?>("Cost"),
                             VendorPercent = row.Field<decimal?>("VendorPercent"),
                             CalculatedCost = row.Field<decimal?>("CalculatedCost")
                         }).ToList();

            return items;
        }

        /// <summary>
        /// Get list of dealer invoice by imei or tracking number and delivery agent.
        /// </summary>
        /// <param name="searchInvoice"></param>
        /// <returns></returns>
        public async Task<List<DealerInvoiceDto>> GetDealerInvoiceBytTrackingNumbersAsync(List<string> trackingNumbers)
        {
            var baseQuery = await GetDealerInvoiceQueryAsync();
            var query = $@"{baseQuery}
                        WHERE d.JobStatus = @jobStatus
                        AND ISNULL(d.QRS, 0) = 0 AND ISNULL(d.ReceivedFrom_RC, 0) = @true 
                        AND ISNULL(r.Rep_TC_Received, 0) = @true
                        AND r.ProdigyRef IN ({string.Join(',', trackingNumbers.ToSingleQuoteList())})";

            var parameters = new SqlParameter[]
            {
                new SqlParameter { ParameterName = "@jobStatus", Value = 30 },
                new SqlParameter { ParameterName = "@true", Value = 1},
                new SqlParameter { ParameterName = "@it_tag", Value = HAMI.BcgMasterTag.Model}
            };

            var connection = SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_DATA_DATABASE);
            var reader = await SqlHelper.ExecuteReaderAsync(connection, CommandType.Text, query, parameters);
            if (!reader.HasRows)
            {
                return new List<DealerInvoiceDto>();
            }

            var table = new DataTable();
            table.Load(reader);

            var items = (from row in table.AsEnumerable()
                         select new DealerInvoiceDto
                         {
                             InvoiceNumber = row.Field<decimal>("InvoiceNumber"),
                             InvoiceDate = row.Field<DateTime?>("InvoiceDate"),
                             CollectionPointName = row.Field<string>("CollectionPointName"),
                             CollectionPoint = row.Field<string>("CollectionPoint"),
                             JobNumber = row.Field<string>("JobNumber"),
                             ImeiNumber = row.Field<string>("ImeiNumber"),
                             TrackingNumber = row.Field<string>("TrackingNumber"),
                             //AirwayBillNumber = row.Field<string>("AirwayBillNumber"),
                             DeliveryAgent = row.Field<string>("DeliveryAgent"),
                             LocationCode = row.Field<string>("LocationCode"),
                             ProductName = row.Field<string>("Product"),
                             BrandName = row.Field<string>("Brand"),
                             Model = row.Field<string>("Model"),
                             SwapImeiNumber = row.Field<string>("SwapImeiNumber"),
                             WarrantyType = Convert.ToInt32(row.Field<string>("Warranty")),
                             WarrantyTypeText = Convert.ToInt32(row.Field<string>("Warranty")) > 0 ? Enum.GetName(typeof(WarrantyType), Convert.ToInt32(row.Field<string>("Warranty"))) : string.Empty,
                             AllocatedTo = row.Field<string>("DeliveryAgentName"),
                             RmaNumber = row.Field<string>("RmaNumber"),
                             LoginType = row.Field<string>("LoginType"),
                             //ShipmentDetails = row.Field<string>("ShipmentDetails"),
                             Delivery = row.Field<bool>("Delivery"),
                             Cost = row.Field<decimal?>("Cost"),
                             VendorPercent = row.Field<decimal?>("VendorPercent"),
                             CalculatedCost = row.Field<decimal?>("CalculatedCost")
                         }).ToList();

            return items;
        }

        /// <summary>
        /// Save dispatch note details.
        /// </summary>
        /// <param name="dealerInvoices"></param>
        /// <param name="dispatchNoteDto"></param>
        /// <returns></returns>
        public async Task<bool> SaveDispatchNoteAsync(List<DealerInvoiceDto> dealerInvoices, DispatchNoteDto dispatchNoteDto, string userId)
        {
            var isCompleted = false;
            SqlTransaction transaction = null;
            try
            {
                var query = $@" DECLARE @invoice_number NUMERIC(18,0)
			                SELECT @invoice_number = ISNULL(MAX(Invoiceno),10000) + 1 
                            FROM [{ RepositoryConstants.SchemaName }].[{SCP.TransactionTables.DealerInvoice}] WITH(TABLOCKX)  

			                INSERT INTO [{ RepositoryConstants.SchemaName }].[{SCP.TransactionTables.DealerInvoice}] 
                            (Invoiceno,InvoiceDate,DeliveryAgent, awbno,SlipReceived,PreparedDate) VALUES
                            (@invoice_number,@invoice_date, @delivery_agent, @airway_bill_number, @slip_received,@prepared_date)

			                SELECT @invoice_number AS [InvoiceNumber]";

                var parameters = new List<SqlParameter>
                {
                new SqlParameter { ParameterName = "@invoice_date", Value = dispatchNoteDto.InvoiceDate },
                new SqlParameter { ParameterName = "@delivery_agent", Value = dispatchNoteDto.DeliveryAgent },
                new SqlParameter { ParameterName = "@airway_bill_number", Value = dispatchNoteDto.AirwayBillNumber },
                new SqlParameter { ParameterName = "@slip_received", Value = 1 },
                new SqlParameter { ParameterName = "@prepared_date", Value = dispatchNoteDto.InvoiceDate },
                new SqlParameter { ParameterName = "@delivered", Value = 1 }
                };

                var connection = SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_SCP_DATABASE);
                await connection.OpenAsync().ConfigureAwait(false);
                transaction = connection.BeginTransaction();

                var invoiceNumber = (decimal) await SqlHelper.ExecuteScalarAsync(transaction, CommandType.Text, query, parameters.ToArray());
                parameters.Add(new SqlParameter { ParameterName = "@invoice_number", Value = invoiceNumber });
                if (dealerInvoices != null && dealerInvoices.Any())
                {
                    query = $@"
                    INSERT INTO [{ RepositoryConstants.SchemaName }].[{SCP.TransactionTables.DealerInvoiceDetail}]
				    (
					    Invoiceno,DcustomerID,DcustomerName,trackingno,
					    Locationcode,Jobno,IMEINo,Model,deliveryagent,
					    MasterID,Delivered,DeliveryconfirmDate,DeliveryUSER,
					    del_awbno,Delivery_Confirmation
				    ) ";

                    dealerInvoices.ForEach(invoice =>
                    {
                        query += $@"SELECT
                            @invoice_number, '{ invoice.CollectionPoint }', '{ invoice.CollectionPointName}', '{ invoice.TrackingNumber }',
					        '{ invoice.LocationCode }','{ invoice.JobNumber }','{ invoice.ImeiNumber }', '{ invoice.Model }', {invoice.DeliveryAgent },
					        @invoice_number, @delivered, @invoice_date, '{ userId }', @airway_bill_number, @delivered
                            UNION ";
                    });

                    query = query.TrimEnd("UNION ".ToCharArray());
                    await SqlHelper.ExecuteNonQueryAsync(transaction, CommandType.Text, query, parameters.ToArray());
                }

                transaction.Commit();
                isCompleted = true;
            }
            catch (Exception ex)
            {
                if (transaction != null)
                    transaction.Rollback();
                throw ex;
            }
            return isCompleted;
        }

        private async Task<string> GetDealerInvoiceQueryAsync()
        {
            var query = $@"SELECT
	                        r.ProdigyRef AS [TrackingNumber],r.LocationCode, CAST(r.Jobno AS VARCHAR(30)) AS [JobNumber],
	                        r.IMEINo AS [ImeiNumber],r.DeliveryAgent,d.LoginType, da.Agent_Name [DeliveryAgentName],
	                        ISNULL(d.repair_status,0) AS [RepairStatus],ISNULL(i.PurRate,0) AS [PurRate],
	                        ISNULL(b.VENDOR_PERC,0) AS [VendorPercent],ISNULL(vs.COST1,0) AS [Cost],
	                        d.DCustomerID AS [CollectionPoint], d.DCustomerName AS [CollectionPointName], d.RMANo AS [RmaNumber],
	                        d.Product, d.Brand, d.Model,d.DOA, sw.SwapIMEINo AS [SwapImeiNumber], CAST(0 As bit) AS Delivery,
	                        d.WARRANTY AS [Warranty], d.JobStatus, sw.InvoiceNo AS [InvoiceNumber], sw.InvoiceDate,
	                        ROUND(CASE WHEN ISNULL(b.VENDOR_PERC,0) > 0 THEN ISNULL(vs.COST1,0) * (ISNULL(b.VENDOR_PERC,0) /100) ELSE ISNULL(vs.COST1,0) END, 0) AS [CalculatedCost]
                        FROM [{ RepositoryConstants.ScpDatabase }].[{ RepositoryConstants.SchemaName }].[{SCP.TransactionTables.ReceiptDetail}] r 
                        LEFT JOIN [{ RepositoryConstants.SchemaName }].[{HAMI.Views.Jobs}] d On d.LocationCode = r.LocationCode AND d.JOBNO=r.Jobno
                        LEFT JOIN [{ RepositoryConstants.SchemaName }].[{HAMI.TransactionTables.SwapInvoice}] sw ON sw.TrackingNo=r.ProdigyRef
                        LEFT JOIN [{ RepositoryConstants.SchemaName }].[{HAMI.MasterTables.ITMaster}] i ON I.ITCODE=d.MODEL
                        LEFT JOIN [{ RepositoryConstants.ScpDatabase }].[{ RepositoryConstants.SchemaName }].[{SCP.MasterTables.DeliveryAgent}] da ON da.Agent_Code = d.DeliveryAgent 
                        LEFT JOIN [{ RepositoryConstants.SchemaName }].[{HAMI.MasterTables.BcgMaster}] b ON b.ITCODE=d.MODEL AND b.ITTAG=@it_tag
                        LEFT JOIN [{ RepositoryConstants.SchemaName }].[{HAMI.MasterTables.JobParts}] p ON p.JOBNO=d.JOBNO AND p.STKLOC=d.CCODE AND p.CODE=d.Model
                        LEFT JOIN [{ RepositoryConstants.SchemaName }].[{HAMI.Views.SwapCashBack}] vs ON d.collref='DOA-'+vs.FTRACKINGNO";

            return await Task.FromResult(query);
        }
    }
}
