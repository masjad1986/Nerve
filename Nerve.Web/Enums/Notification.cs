using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Nerve.Web.Enums
{
    public enum NotificationType
    {
        Error,
        Information,
        Success,
        Warning
    }

    public class Notification
    {
        public NotificationType Type { get; set; }
        public string Message { get; set; }
        public string Title { get; set; }
        public bool AutoDissmised { get; set; }
    }
}
