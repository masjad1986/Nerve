using Nerve.Common.Dtos;
using Nerve.Common.Enums;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;

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
        public static NotificationDto GetNotification(string title, string message, NotificationType notificationType, bool autoDissmised = false)
        {
            return new NotificationDto
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
            var notification = new NotificationDto
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
