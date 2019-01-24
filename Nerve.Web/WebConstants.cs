using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Nerve.Web
{
    public class WebConstants
    {
        public class SessionKeys
        {
            public const string User = "user";
            public const string UserMenus = "menus";
            public const string UserName = "username";
            public const string GroupId = "group";
            public const string ModuleId = "module";
            public const string Language = "language";
            public const string DefaultStockLocation = "location";
            public const string DefaultDealer = "dealer";
            public const string PersianFont = "css";
        }

        public class NotifyMessage
        {
            public const string NoLanguageResourceFound = "No language resrouce file found";
            public const string InvalidLanguageResourceFile = "Unable to read language resource file.";
        }

        public class ViewPages
        {
            public const string DeviceLogin = "Views/FrontDesk/Device/Index.cshtml";
        }
    }
}
