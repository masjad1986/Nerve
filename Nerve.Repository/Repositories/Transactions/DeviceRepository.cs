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
    public class DeviceRepository : IDeviceRepository
    {
        private readonly IOptions<AppSettings> _appSettings;
        public DeviceRepository(IOptions<AppSettings> appSettings)
        {
            _appSettings = appSettings;
        }

        /// <summary>
        /// Authenticate device for any pending job is in process or not.
        /// </summary>
        /// <param name="ImeiNumber">Pass device IMEI number.</param>
        /// <param name="databaseConnectionType">Database connection type to connect.</param>
        /// <returns></returns>
        public async Task<bool> DeviceAuthenticationAsync(string imeiNumber)
        {
            var query = $@"SELECT 1 AS [Pending] FROM [{RepositoryConstants.SchemaName}].[{SCP.Views.Jobs}] j 
                        WHERE(IMEINO = @imei_number OR msnno = @imei_number)
                        AND(ISNULL(Dispatched, 0) = 0 OR ISNULL(JobStatus, 0) = 0 OR ISNULL(REPAIR_STATUS, 0) = 0)";
            var parameters = new SqlParameter[]
            {
                new SqlParameter
                {
                    ParameterName = "@imei_number",
                    Value = imeiNumber
                }
            };
            var connection = SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_DATA_DATABASE);
            var result = await SqlHelper.ExecuteScalarAsync(connection,
                CommandType.Text,
                query,
                parameters);

            return result != null;
        }

        public async Task<bool> SaveAsync(string userId, DeviceDto deviceDto, IEnumerable<AccessoryDto> accessories)
        {
            var isSaved = false;
            var connection = SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_SCP_DATABASE);
            await connection.OpenAsync().ConfigureAwait(false);
            var transaction = connection.BeginTransaction();
            try
            {
                /*
                    insert into T_DealerLog_Main(DocNo,DCustomerID,DCustomerName,Prefix,DocDate,IMEINO)  
                    values( @DocNo,@DCustomerID,@DCustomerName,@Prefix,@DocDate,@IMEINO)
                */

                var baseParameters = new SqlParameter[]
                {
                    new SqlParameter { ParameterName = "@imei_number", Value = deviceDto.ImeiNumber },
                    new SqlParameter { ParameterName = "@prefix", Value = deviceDto.Prefix },
                    new SqlParameter { ParameterName = "@doc_no", Value = deviceDto.TrackingNumber },
                    new SqlParameter { ParameterName = "@doc_date", Value = deviceDto.TrackingDate },
                    new SqlParameter { ParameterName = "@d_customer_name", Value = deviceDto.CollectionPointName},
                    new SqlParameter { ParameterName = "@d_customer_id", Value = deviceDto.CollectionPoint},
                    new SqlParameter { ParameterName = "@job_number", Value = deviceDto.AutoJobNumber },
                    new SqlParameter { ParameterName = "@job_reference_number", Value = deviceDto.AutoJobReferenceNumber }
                };

                var query = $@"INSERT INTO [{RepositoryConstants.SchemaName}].[{SCP.TransactionTables.DealerLogMain}]
                           (DocNo,DCustomerID,DCustomerName,Prefix,DocDate,IMEINO)  
                           VALUES(@doc_no,@d_customer_id,@d_customer_name,@prefix,@doc_date,@imei_number)";

                //insert data into T_DealerLog_Main
                await SqlHelper.ExecuteNonQueryAsync(transaction,
                    CommandType.Text,
                    query,
                    baseParameters);

                var parameters = new List<SqlParameter>();

                //insert data to DealerLog
                /*
                 insert into DealerLog(
                     DCustomerID,DCustomerName,IMEINO,msnno,DocNo,  
                     DocDate,Prefix,Collref,Product,Brand,  
                     Model,CustomerName,LastName,Mobile,SMSLanguage ,  
                     farsicustname,Phycondition,Password,vista,purcdate,  
                     ExpiryDate,expirymonths,deliveryagent,forwardagent,AwBNo,  
                     warranty,TypeOfWarranty,UnitDroppedDate,phone,rmano,  
                     NationalID,EcoCode,PostalCode,farsidate,Transfer_To,  
                     locationname,servicecenter,locationcode,loc,detailid,faultcode,  
                     faultdetails,remarks,phonetype,country,UnitsReceived_TC,UnitsReceived_TC_Date ,  
                        UnitsAllocated_To,RC_LogDate,TCCollectedDate,userid,FinalWarranty,DirectCustomer ,  
                        backend,logintype,jobstatus,rbrand,RMODEL,  
                     RIMEINO,repldescr,rb0,rb1,rb2,rc1,rc2,ro1,ro2,RC_Logged,  
                     CPerson,CustAddress,doa,qrs  
                  )  
                  values( @DCustomerID,@DCustomerName,@IMEINO,@msnno,@DocNo,  
                    @DocDate,@Prefix,@Collref,@Product,@Brand,  
                    ltrim(rtrim(@Model)),@CustomerName,@LastName,@Mobile,@SMSLanguage,  
                    @farsicustname,@Phycondition,@Password,@vista,@purcdate,  
                    @ExpiryDate,@expirymonths,@DeliveryAgent,@forwardagent,@AwBNo,  
                    @warranty,@TypeOfWarranty,@UnitDroppedDate,@phone,@rmano,  
                    @NationalID,@EcoCode,@PostalCode,@farsidate,@Transfer_To,  
                    @locationname,@servicecenter,@locationcode,@loc,@detailid,@faultcode,  
                    @faultdetails,@remarks,@phonetype,@country,@UnitsReceived_TC,@UnitsReceived_TC_Date,  
                    @UnitsAllocated_To,@RC_LogDate,@TCCollectedDate,@userid,@FinalWarranty,@DirectCustomer,  
                    @backend,@logintype,@jobstatus,@rbrand,@RMODEL,  
                    @RIMEINO,@repldescr,@rb0,@rb1,@rb2,@rc1,@rc2,@ro1,@ro2,@RC_Logged,  
                    @email,@CustAddress,@doa,@qrs  
                  )
                 */
                query = $@"INSERT INTO [{RepositoryConstants.SchemaName}].[{SCP.TransactionTables.DealerLog}]
                    (
	                    DCustomerID,DCustomerName,IMEINO, DocNo, DocDate,Prefix,
	                    Product,Brand, Model,CustomerName,LastName,Mobile,
	                    farsicustname,Phycondition,purcdate,ExpiryDate,expirymonths,
	                    deliveryagent,forwardagent,FinalWarranty,TypeOfWarranty,UnitDroppedDate,
	                    phone,rmano, NationalID,EcoCode,PostalCode,farsidate,Transfer_To,
	                    locationname,servicecenter,locationcode,loc,detailid,faultcode,
	                    faultdetails,CPerson,CustAddress,TCCollectedDate,userid,
	                    phonetype,DirectCustomer,logintype,jobstatus,
	                    UnitsReceived_TC,UnitsReceived_TC_Date,remarks,Warranty,
	                    UnitsAllocated_To,RC_LogDate,backend
                    )
                    VALUES 
                    (
	                    @d_customer_id,@d_customer_name,@imei_number,@doc_no, @doc_date,@prefix,
	                    @product,@brand,@model,@customer_name,@last_name, @mobile_number,
	                    @farsi_customer_name,@physical_condition,@pop_date, @expiry_date,@expirymonths,
	                    @delivery_agent,@delivery_agent,@warranty_text, @type_of_warranty,@unit_dropped_date,
	                    @phone,@rma_number, @national_id,@eco_code,@postal_code,@farsidate,@transfer_to, 
	                    @location_name,@servicecenter,@location_code, @loc,@detail_id,@fault_code, 
	                    @fault_details,@email,@customer_address,@collected_date,@user_id,
	                    @phone_type,@direct_customer,@login_type,@job_status,
	                    @units_received_tc,@units_received_tc_date,@notes, @warranty,
	                    @units_allocated, @tracking_date, @backend
                    )";


                parameters.Add(new SqlParameter { ParameterName = "@product", Value = deviceDto.Product });
                parameters.Add(new SqlParameter { ParameterName = "@brand", Value = deviceDto.BrandCode });
                parameters.Add(new SqlParameter { ParameterName = "@model", Value = deviceDto.Model.Trim() });
                parameters.Add(new SqlParameter { ParameterName = "@customer_name", Value = deviceDto.CustomerName });
                parameters.Add(new SqlParameter { ParameterName = "@last_name", Value = deviceDto.LastName });
                parameters.Add(new SqlParameter { ParameterName = "@mobile_number", Value = deviceDto.MobileNumber });
                parameters.Add(new SqlParameter { ParameterName = "@farsi_customer_name", Value = deviceDto.FarsiName });
                parameters.Add(new SqlParameter { ParameterName = "@physical_condition", Value = deviceDto.PhysicalCondition });
                parameters.Add(new SqlParameter { ParameterName = "@pop_date", Value = deviceDto.PopDate });
                parameters.Add(new SqlParameter { ParameterName = "@expiry_date", Value = deviceDto.ExpiryDate });
                parameters.Add(new SqlParameter { ParameterName = "@expirymonths", Value = 0 });
                parameters.Add(new SqlParameter { ParameterName = "@delivery_agent", Value = deviceDto.Forwarder });
                parameters.Add(new SqlParameter { ParameterName = "@warranty_text", Value = deviceDto.WarrantyTypeText });
                parameters.Add(new SqlParameter { ParameterName = "@type_of_warranty", Value = deviceDto.Type });
                parameters.Add(new SqlParameter { ParameterName = "@unit_dropped_date", Value = deviceDto.UnitDroppedDate });
                parameters.Add(new SqlParameter { ParameterName = "@phone", Value = deviceDto.MobileNumber }); //No telephone fields input
                parameters.Add(new SqlParameter { ParameterName = "@rma_number", Value = deviceDto.VendorRmaNumber });
                parameters.Add(new SqlParameter { ParameterName = "@national_id", Value = deviceDto.NationalId });
                parameters.Add(new SqlParameter { ParameterName = "@eco_code", Value = deviceDto.EcoCode });
                parameters.Add(new SqlParameter { ParameterName = "@postal_code", Value = deviceDto.PostalCode });
                parameters.Add(new SqlParameter { ParameterName = "@farsidate", Value = deviceDto.FarsiDate });
                parameters.Add(new SqlParameter { ParameterName = "@transfer_to", Value = deviceDto.TransferTo });
                parameters.Add(new SqlParameter { ParameterName = "@location_name", Value = deviceDto.LocationName });
                parameters.Add(new SqlParameter { ParameterName = "@servicecenter", Value = deviceDto.CollectionPoint });
                parameters.Add(new SqlParameter { ParameterName = "@location_code", Value = deviceDto.LocationCode });
                parameters.Add(new SqlParameter { ParameterName = "@loc", Value = deviceDto.LocationCode });
                parameters.Add(new SqlParameter { ParameterName = "@detail_id", Value = deviceDto.DetailId });
                parameters.Add(new SqlParameter { ParameterName = "@fault_code", Value = deviceDto.FaultCode.Trim() });
                parameters.Add(new SqlParameter { ParameterName = "@fault_details", Value = deviceDto.FaultDetail.Trim() });
                parameters.Add(new SqlParameter { ParameterName = "@email", Value = deviceDto.Email });
                parameters.Add(new SqlParameter { ParameterName = "@customer_address", Value = deviceDto.CustomerAddress });
                parameters.Add(new SqlParameter { ParameterName = "@collected_date", Value = deviceDto.CollectionDate });
                parameters.Add(new SqlParameter { ParameterName = "@user_id", Value = userId });
                parameters.Add(new SqlParameter { ParameterName = "@phone_type", Value = deviceDto.PhoneType });
                parameters.Add(new SqlParameter { ParameterName = "@direct_customer", Value = deviceDto.DirectCustomer });
                parameters.Add(new SqlParameter { ParameterName = "@login_type", Value = deviceDto.LoginType });
                parameters.Add(new SqlParameter { ParameterName = "@job_status", Value = deviceDto.JobStatus });
                parameters.Add(new SqlParameter { ParameterName = "@units_received_tc", Value = deviceDto.UnitReceived });
                parameters.Add(new SqlParameter { ParameterName = "@units_received_tc_date", Value = deviceDto.UnitReceivedDate });
                parameters.Add(new SqlParameter { ParameterName = "@notes", Value = deviceDto.Notes });
                parameters.Add(new SqlParameter { ParameterName = "@warranty", Value = deviceDto.WarrantyType });
                parameters.Add(new SqlParameter { ParameterName = "@units_allocated", Value = deviceDto.UnitAllocated });
                parameters.Add(new SqlParameter { ParameterName = "@tracking_date", Value = deviceDto.TrackingDate });
                parameters.Add(new SqlParameter { ParameterName = "@backend", Value = deviceDto.Backend });
                parameters.Add(new SqlParameter { ParameterName = "@doa", Value = deviceDto.DoA });
                parameters.Add(new SqlParameter { ParameterName = "@qrs", Value = 0 });
                
                //insert data into DealerLog
                parameters.AddRange(baseParameters.ToList());
                await SqlHelper.ExecuteNonQueryAsync(transaction,
                    CommandType.Text,
                    query,
                    parameters.ToArray());

                /*
                 SELECT @jobno = isnull(MAX(jobno),100000)+1 FROM hami_data.dbo.jbrepair WITH(TABLOCKX) where ccode=@locationcode   
                   select @jobref= rtrim(locprefix) + '-' + ltrim(str(@jobno)) from hami_data.dbo.glumast where locode=@locationcode   

                   insert into hami_data.dbo.jbrepair_mAIN(jobno,ccode,jobref,indt,dealerref)  
                   values(@jobno,@locationcode,@jobref,@DocDate,@DocNo)   

                   insert into hami_data.dbo.jbrepair (jobno,yrcd,imeino,jobtype,   
                     clcode,ccode,ccode_trf,collectionref,  
                     brand,model,name,dealerref,  
                     dealer_customername,dealer_mobile,jbfaultcode,unitdroppeddate,  
                     UnitRecieved_TCDate,rcmobile,indt,wrtype,wrtype1,wrtype2,  
                     voflt,warrtype,USER1,PHONETYPE,  
                     tc_collecteddate,Product,LoginType,LOC,  
                     typeofwarranty,jobref,doa,qrs,mobile,phone)  
                   values(@jobno,'A',@IMEINO,'D',  
                    @dcustomerid,@locationcode,@trflocationcode,@DocNo,  
                    @Brand, ltrim(rtrim(@Model)),@dCustomerName,@DocNo,  
                    @CustomerName,@Mobile,@faultcode,@UnitDroppedDate,  
                    @DocDate,'1',@DocDate,@jwarrantytype,@jwarrantytype,@jwarrantytype,  
                    @Phycondition,@TypeOfWarranty,@userid,'P',  
                    @DocDate,@Product,@logintype,@loc,  
                    @TypeOfWarranty,@jobref,@doa,@qrs,@Mobile,@phone  
                 */

                //JOB REPAIR INSERT
                query = $@"INSERT INTO [{RepositoryConstants.HamiDatabase}].[{RepositoryConstants.SchemaName}].[{HAMI.MasterTables.JobRepairMain}] (jobno,ccode,jobref,indt,dealerref)  
                           VALUES(@job_number, @location_code, @job_reference_number, @doc_date, @doc_no)
                         
                        INSERT INTO [{RepositoryConstants.HamiDatabase}].[{RepositoryConstants.SchemaName}].[{HAMI.MasterTables.JobRepair}] 
                        (
                            jobno,yrcd,imeino,jobtype, clcode, ccode, ccode_trf,collectionref, brand, model, name, dealerref,  
                            dealer_customername,dealer_mobile,jbfaultcode,unitdroppeddate,  
                            UnitRecieved_TCDate,rcmobile,indt,wrtype,wrtype1,wrtype2, voflt,warrtype,USER1,PHONETYPE,  
                            tc_collecteddate,Product,LoginType,LOC, typeofwarranty,jobref,doa,qrs,mobile,phone
                        )
                        VALUES
                        (
                            @job_number,'A',@imei_number,'D',  
                            @d_customer_id,@location_code,@location_code,@doc_no,  
                            @brand, @model,@d_customer_name,@doc_no,  
                            @customer_name,@mobile_number,@fault_code,@unit_dropped_date,  
                            @doc_date,'1',@doc_date,@warranty,@warranty,@warranty,  
                            @physical_condition,@type_of_warranty,@user_id,'P',  
                            @doc_date,@product,@login_type,@location_code,  
                            @type_of_warranty,@job_reference_number,@doa,@qrs,@mobile_number,@phone
                        )";

                //insert data into JBREPAIR
                parameters.AddRange(baseParameters.ToList());
                await SqlHelper.ExecuteNonQueryAsync(transaction,
                    CommandType.Text,
                    query,
                    parameters.Distinct().ToArray());

                /*
                 SELECT @documentno = isnull(MAX(documentno),10000)+1 FROM T_ReceiptTCDetail WITH(TABLOCKX) where locationcode=@locationcode   
                   insert into T_ReceiptTCDetail (documentno,imeino,received,receivedby,   
                     receiveddate,issued,issuedby,issueddate,  
                     dc_received,dc_receivedby,dc_receiveddate,locationcode,  
                     jobno,csocreated,csocreatedby,csocreateddate,  
                     deliveryagent,prodigyref,agent)  
                   values (@documentno,@IMEINO,1,@userid,  
                    @DocDate,1,@userid,@DocDate,  
                    1,@userid,@DocDate,@locationcode,  
                    @jobno,1,@userid,@DocDate,  
                    @forwardagent,@DocNo,@forwardagent  
                  )  
                 */

                //RECEIPT DETAIL
                query = $@"DECLARE @document_number_detail INT
                           SELECT @document_number_detail = ISNULL(MAX(documentno),10000) + 1 FROM 
                           [{RepositoryConstants.SchemaName}].[{SCP.TransactionTables.ReceiptDetail}] WITH(TABLOCKX) 
                           WHERE locationcode=@location_code

                           INSERT INTO [{RepositoryConstants.SchemaName}].[{SCP.TransactionTables.ReceiptDetail}]
                           (
                                documentno,imeino,received,receivedby,   
                                receiveddate,issued,issuedby,issueddate, dc_received,dc_receivedby,dc_receiveddate,locationcode,  
                                jobno,csocreated,csocreatedby,csocreateddate, deliveryagent,prodigyref,agent)
                           VALUES 
                           (
                                @document_number_detail,@imei_number, 1, @user_id,  
                                @doc_date, 1,@user_id, @doc_date, 1,@user_id, @doc_date, @location_code,  
                                @job_number, 1, @user_id, @doc_date, @delivery_agent,@doc_no,@delivery_agent
                           )

                           UPDATE [{RepositoryConstants.HamiDatabase}].[{RepositoryConstants.SchemaName}].[{HAMI.MasterTables.JobRepair}]
                                SET BatchRef=@document_number_detail 
                           WHERE jobno=@job_number AND CCODE=@location_code 

                           UPDATE [{RepositoryConstants.SchemaName}].[{SCP.TransactionTables.DealerLog}]
                                SET BatchRef=@document_number_detail, csoref=@job_number, jobref= @job_reference_number
                           WHERE DOCNO=@doc_no";

                //insert data into T_ReceiptTCDetail AND Update JBRepair and DealerLog
                parameters.AddRange(baseParameters.ToList());
                await SqlHelper.ExecuteNonQueryAsync(transaction,
                    CommandType.Text,
                    query,
                    parameters.Distinct().ToArray());

                //UPDATE BATCH REFERENCE
                /*
                 update jbrepair set BatchRef=@documentno where jobno=@jobno and CCODE=@locationcode  
                 update dealerlog set BatchRef=@documentno,csoref=@jobno,jobref=@jobref where DOCNO=@DocNo  

                 */

                if (accessories != null && accessories.Any())
                {
                    query = $@"INSERT INTO [{RepositoryConstants.SchemaName}].[{SCP.TransactionTables.AccessoriesDetail}] (trackingno,accessoryid,deleted) VALUES ";
                    accessories.ToList().ForEach(accessory =>
                    {
                        query += $" (@doc_no, {accessory.Id}, '{accessory.Deleted}'),";
                    });

                    query = query.TrimEnd(',');

                   await SqlHelper.ExecuteNonQueryAsync(transaction,
                   CommandType.Text,
                   query,
                   parameters.FirstOrDefault(x => x.ParameterName == "@doc_no"));
                }

                transaction.Commit();
                isSaved = true;
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                throw ex;
            }

            return isSaved;
        }
    }
}
