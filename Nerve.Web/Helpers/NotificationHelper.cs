using Nerve.Web.Enums;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Nerve.Web.Helpers
{
    public class NotificationHelper
    {

        /// <summary>
        /// Get notification object.
        /// </summary>
        /// <param name="title"></param>
        /// <param name="message"></param>
        /// <param name="notificationType"></param>
        /// <param name="autoDissmised"></param>
        /// <returns></returns>
        public static Notification GetNotification(string title, string message, NotificationType notificationType, bool autoDissmised = false)
        {
            return new Notification
            {
                Type = notificationType,
                Title = title,
                Message = message,
                AutoDissmised = autoDissmised
            };
        }

        /// <summary>
        /// Get notification json string.
        /// </summary>
        /// <param name="title"></param>
        /// <param name="message"></param>
        /// <param name="notificationType"></param>
        /// <param name="autoDissmised"></param>
        /// <returns></returns>
        public static string GetJsonNotification(string title, string message, NotificationType notificationType, bool autoDissmised = false)
        {
            var notification = new Notification
            {
                Type = notificationType,
                Title = title,
                Message = message,
                AutoDissmised = autoDissmised
            };

            return JsonConvert.SerializeObject(notification, new JsonSerializerSettings { ContractResolver = new CamelCasePropertyNamesContractResolver()});
        }
    }
}
