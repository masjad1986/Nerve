using Nerve.Repository.Dtos;
using Nerve.Repository.Enums;
using Nerve.Repository.Helpers;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Data.SqlClient;
using System.Threading.Tasks;
using Microsoft.Extensions.Options;

namespace Nerve.Repository
{
    public class UserRepository : IUserRepository
    {
        private readonly IOptions<AppSettings> _appSettings;
        private readonly IDynamicSqlBuilderHelper _dynamicSqlBuilderHelper;
        public UserRepository(IOptions<AppSettings> appSettings, IDynamicSqlBuilderHelper dynamicSqlBuilderHelper)
        {
            _dynamicSqlBuilderHelper = dynamicSqlBuilderHelper;
            _appSettings = appSettings;
        }

        /// <summary>
        /// Authenticate user for login.
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public async Task<User> AuthenticateAsync(string username, string password, int moduleId)
        {
            var parameters = new SqlParameter[]
            {
                new SqlParameter { ParameterName = "@username", Value = username },
                new SqlParameter { ParameterName = "@password", Value = password },
                new SqlParameter { ParameterName = "@module", Value = moduleId}
            };
            var query = $"SELECT * FROM [{RepositoryConstants.SchemaName}].[{SCP.MasterTables.UserMaster}] WHERE TRIM(USERNAME) = @username AND PASSWORD = @password AND USER_MODULE = @module";
            var reader = await SqlHelper.ExecuteReaderAsync(SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_SCP_DATABASE),
                CommandType.Text,
                query, parameters);

            if (!reader.HasRows)
                return null;

            var table = new DataTable();
            table.Load(reader);

            var user = (from row in table.AsEnumerable()
                        select new User
                        {
                            Id = row.Field<int>("T"),
                            UserId = row.Field<string>("USERID"),
                            Username = row.Field<string>("USERNAME"),
                            CustomerId = row.Field<string>("CUSTOMERID"),
                            LocPrefix = row.Field<string>("LOCPREFIX"),
                            Email = row.Field<string>("EMAIL"),
                            EmailCc = row.Field<string>("EmailCC"),
                            EmailTo = row.Field<string>("ToEmail"),
                            TCLoc = row.Field<string>("TCLOC"),
                            Brand = row.Field<string>("BRAND"),
                            Location = row.Field<string>("Location"),
                            Emirate = row.Field<string>("Emirate"),
                            Country = row.Field<string>("Country"),
                            CollectedBy = row.Field<string>("CollectedBy"),
                            CustomerType = row.Field<string>("CustomerType"),
                            DeliveryAgent = row.Field<string>("DeliveryAgent"),
                            Backenduser = row.Field<int?>("Backenduser"),
                            UserType = row.Field<int?>("UserType"),
                            FsUserType = row.Field<int?>("FS_UserType"),
                            BBOffer = row.Field<int?>("BBOffer"),
                            HTCOffer = row.Field<int?>("HTCOffer"),
                            NOKIAOffer = row.Field<int?>("NOKIAOffer"),
                            SiemensOffer = row.Field<int?>("SiemensOffer"),
                            MotorolaOffer = row.Field<int?>("MotorolaOffer"),
                            GenericOffer = row.Field<int?>("GenericOffer"),
                            AppleOffer = row.Field<int?>("AppleOffer"),
                            LaptopOffer = row.Field<int?>("LaptopOffer"),
                            IPadOffer = row.Field<int?>("IPADOffer"),
                            ThoshibaOffer = row.Field<int?>("ThoshibaOffer"),
                            SonyOffer = row.Field<int?>("SonyOffer"),
                            Camera = row.Field<int?>("Camera"),
                            Mp3Player = row.Field<int?>("MP3Player"),
                            GameConsole = row.Field<int?>("GameConsole"),
                            MainPartnerCode = row.Field<string>("MainPartnercode"),
                            MainSPartnerCode = row.Field<string>("MainSPartnercode"),
                            SubPartner = row.Field<int?>("SubPartner"),
                            LastLabelId = row.Field<string>("LastLabelID"),
                            CurrencyCode = row.Field<string>("CurrCode"),
                            ExchangeRate = row.Field<decimal?>("ExchRate"),
                            LaptopLocationName = row.Field<string>("Laptop_LocationName"),
                            CFLocationCode = row.Field<string>("CF_LocationCode"),
                            LaptopMasterLocation = row.Field<string>("Laptop_MasterLocation"),
                            CFPrefix = row.Field<string>("CF_Prefix"),
                            Region = row.Field<string>("Region"),
                            MainPartnerCode1 = row.Field<string>("MainPartnerCode1"),
                            LoginType = row.Field<string>("LoginType"),
                            CosmosUserId = row.Field<string>("COSMOSUSERID"),
                            SendEmail = row.Field<byte?>("SendEmail"),
                            Branch = row.Field<string>("Branch"),
                            LanguageId = row.Field<int?>("Language_ID"),
                            MultipleLocation = row.Field<string>("MultipleLocation"),
                            Inactive = row.Field<int?>("Inactive"),
                            Loc = row.Field<string>("LOC"),
                            LaptopVenderId = row.Field<int?>("Laptop_VenderID"),
                            GroupId = row.Field<int?>("GroupID"),
                            IsCollectionRequired = row.Field<bool?>("CollectionRequired"),
                            DiscountPercent = row.Field<decimal?>("DiscPer"),
                            DefaultPageMenuId = row.Field<int?>("DefaultFormMenuID"),
                            Type = row.Field<string>("Type"),
                            MenuType = row.Field<int?>("MenuType"),
                            EngineerCode = row.Field<string>("EnggCode"),
                            DefaultCollectionPoint = row.Field<string>("DefaultCollectionPoint"),
                            DefaultLocationCode = row.Field<string>("DefaultLocationCode"),
                            CashPercent = row.Field<decimal?>("CashPer"),
                            CPIncharge = row.Field<decimal?>("CP_INCHARGE"),
                            UserModule = row.Field<int?>("USER_MODULE")
                        }).FirstOrDefault();

            return user;
        }

        /// <summary>
        /// Get 
        /// </summary>
        /// <param name="groupId"></param>
        /// <param name="moduleId"></param>
        /// <returns></returns>
        public async Task<List<UserMenuAccess>> GetUserAccessPermissionsAsync(int groupId, int moduleId)
        {
            var query = @"
                SELECT 
	                u.ID, u.GroupID, u.ModuleID, u.MenuID, u.ViewOption, u.SaveOption
	                , u.UpdateOption, u.DeleteOption, u.PrintOption, u.Deleted
	                , m.MenuId, m.MenuName, m.MenuLink, m.ParentMenuID, m.ModuleName
	                , m.Active, m.OrderBy, m.LanguageId, m.LanguageKey
                FROM [dbo].[WEB_USERRIGHTS] u 
                JOIN [dbo].[WEB_MENUMASTER] m ON u.MenuId = m.MenuId AND u.ModuleID = m.ModuleID
                WHERE u.GroupID = @groupId
                AND u.ModuleID = @moduleId
                AND u.ViewOption = @status
                ORDER BY m.OrderBy
            ";

            var parameters = new SqlParameter[]
            {
                new SqlParameter { ParameterName = "@groupId", Value = groupId },
                new SqlParameter { ParameterName = "@moduleId", Value = moduleId },
                new SqlParameter { ParameterName = "@status", Value = StatusType.Active }
            };

            var reader = await SqlHelper.ExecuteReaderAsync(SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_SCP_DATABASE),
                CommandType.Text,
                query,
                parameters);

            if (!reader.HasRows)
                return null;

            var table = new DataTable();
            table.Load(reader);

            var output = (from row in table.AsEnumerable()
                          select new UserMenuAccess
                          {
                              ID = row.Field<int>("ID"),
                              GroupId = row.Field<int>("GroupID"),
                              ModuleId = row.Field<int>("ModuleID"),
                              ViewOption = row.Field<string>("ViewOption"),
                              SaveOption = row.Field<string>("SaveOption"),
                              UpdateOption = row.Field<string>("UpdateOption"),
                              DeleteOption = row.Field<string>("DeleteOption"),
                              PrintOption = row.Field<string>("PrintOption"),
                              Deleted = row.Field<string>("Deleted"),
                              MenuId = row.Field<int>("MenuId"),
                              MenuName = row.Field<string>("MenuName"),
                              MenuLink = row.Field<string>("MenuLink"),
                              ParentMenuId = row.Field<int>("ParentMenuID"),
                              ModuleName = row.Field<string>("ModuleName"),
                              Active = row.Field<bool>("Active"),
                              OrderBy = row.Field<int>("OrderBy"),
                              LanguageId = row.Field<int>("LanguageId"),
                              LanguageKey = row.Field<string>("LanguageKey")
                          }).ToList();

            return output;
        }

        public async Task<TempLocationPrefixDto> GetTrackingPrefixByUserIdAsync(string userId)
        {
            var query = $@"SELECT USERID AS [UserId], USERNAME AS [UserName], LOCPREFIX AS [LocationPrefix], BRTRACKING_PREFIX AS [TrackingPrefix]
                        FROM [{RepositoryConstants.SchemaName}].[{SCP.TemporaryTables.TempLocationPrefix}] 
                        WHERE userid=@user_id";
            var parameters = new SqlParameter[]
            {
                new SqlParameter { ParameterName ="@user_id", Value = userId }
            };

            var reader = await SqlHelper.ExecuteReaderAsync(SqlHelper.GetSqlConnectionAsync(_appSettings.Value.HAMI_SCP_DATABASE),
                CommandType.Text,
                query,
                parameters);

            if (!reader.HasRows)
                return new TempLocationPrefixDto();

            var table = new DataTable();
            table.Load(reader);

            var prefix = (from row in table.AsEnumerable()
                               select new TempLocationPrefixDto
                               {
                                   UserId = row.Field<string>("UserId"),
                                   UserName = row.Field<string>("UserName"),
                                   LocationPrefix = row.Field<string>("LocationPrefix"),
                                   TrackingPrefix = row.Field<string>("TrackingPrefix"),
                               }).FirstOrDefault();
            return prefix;
        }
    }
}
