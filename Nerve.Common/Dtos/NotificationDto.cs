using Nerve.Common.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Nerve.Common.Dtos
{
    public class NotificationDto
    {
        public NotificationType Type { get; set; }
        public string Message { get; set; }
        public string Title { get; set; }
        public bool AutoDissmised { get; set; }
    }
}
