using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Repository
{
    public class DeviceRepository : IDeviceRepository
    {
        private readonly AppSettings _appSettings;
        public DeviceRepository(IOptions<AppSettings> appSettings)
        {
            _appSettings = appSettings.Value;
        }

        /// <summary>
        /// Authenticate device for any pending job is in process or not.
        /// </summary>
        /// <param name="ImeiNumber">Pass device IMEI number.</param>
        /// <param name="databaseConnectionType">Database connection type to connect.</param>
        /// <returns></returns>
        public async Task<bool> DeviceAuthenticationAsync(string imeiNumber)
        {
            var query = $"";
            var parameters = new SqlParameter[]
            {
                new SqlParameter
                {
                    ParameterName = "@imei_number",
                    Value = imeiNumber
                }
            };
            var connection = SqlHelper.GetSqlConnectionAsync(_appSettings.HAMI_DATA_DATABASE);
            var result = (bool)await SqlHelper.ExecuteScalarAsync(connection,
                CommandType.Text,
                query,
                parameters);

            return result;
        }
    }
}
