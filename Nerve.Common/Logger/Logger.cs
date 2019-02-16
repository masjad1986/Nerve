using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Nerve.Common
{
    public class Logger: ILogger
    {
        public Logger()
        {
        }

        /// <summary>
        /// Write messsage to error log.
        /// </summary>
        /// <param name="controller">Name of the controller.</param>
        /// <param name="action">Controller action name.</param>
        /// <param name="message">Log message to write.</param>
        public void Log(string controller, string action, string message)
        {

        }

        /// <summary>
        /// Write complete exception to error log
        /// </summary>
        /// <param name="controller">Name of the controller.</param>
        /// <param name="action">Controller action name.</param>
        /// <param name="exception">Log exception to write.</param>
        public void Log(string controller, string action, Exception exception)
        {

        }

        private static void WriteLog(string controller, string action, Exception exception, bool isLogMessageOnly)
        {
            try
            {
                //var logFilePath = "";
                //var logFileName = "";

                var logTimeStamp = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                var logMessage = @"[${controller}][${action}][${logTimeStamp}]: ";

                if (isLogMessageOnly)
                {
                    logMessage += @"${exception.Message}";
                }
                else
                {
                    logMessage += @"Message: ${exception.Message} | StackTrace : ${exception.StackTrace}";
                }

            }
            finally
            {

            }
        }
    }
}
