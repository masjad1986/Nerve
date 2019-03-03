using Microsoft.Extensions.Options;
using Nerve.Common.Models;
using Newtonsoft.Json;
using System;
using System.IO;

namespace Nerve.Common
{
    public class Logger: ILogger
    {
        private readonly IOptions<AppSettings> _appSettings;
        public Logger(IOptions<AppSettings> appSettings)
        {
            _appSettings = appSettings;
        }

        /// <summary>
        /// Write message to error log.
        /// </summary>
        /// <param name="controller">Name of the controller.</param>
        /// <param name="action">Controller action name.</param>
        /// <param name="message">Log message to write.</param>
        public void Log(string controller, string action, string message)
        {
            WriteLog(controller, action, new Exception(message), true);
        }

        /// <summary>
        /// Write complete exception to error log
        /// </summary>
        /// <param name="controller">Name of the controller.</param>
        /// <param name="action">Controller action name.</param>
        /// <param name="exception">Log exception to write.</param>
        public void Log(string controller, string action, Exception exception)
        {
            WriteLog(controller, action, exception, false);
        }

        private void WriteLog(string controller, string action, Exception exception, bool isLogMessageOnly)
        {
            try
            {
                var logFilePath = string.Concat(_appSettings.Value.ERROR_LOG_FILEPATH, DateTime.Now.ToString("dd-MMM-yyyy"));
                if (!Directory.Exists(logFilePath))
                {
                    Directory.CreateDirectory(logFilePath);
                }
                var logFileName = $"{logFilePath}\\Nerve.log";

                var logTimeStamp = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                var logMessage = $"[{controller}][{action}][{logTimeStamp}]: ";

                if (isLogMessageOnly)
                {
                    logMessage += $"{exception.Message}";
                }
                else
                {
                    logMessage += $"Message: {exception.Message} | StackTrace : {exception.StackTrace}";
                }

                using (var fileStream = new FileStream(logFileName, FileMode.Append))
                {
                    using (var streamWriter = new StreamWriter(fileStream))
                    {
                        streamWriter.WriteLine(logMessage);
                        streamWriter.Flush();
                    }
                }

            }
            finally
            {

            }
        }
    }
}
