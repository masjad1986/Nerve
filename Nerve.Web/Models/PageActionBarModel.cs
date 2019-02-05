using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Nerve.Web
{
    public class PageActionBarModel
    {
        public int MenuId { get; set; }
        public string ActionPrefix { get; set; }
        public string HasDeleteActionAccess { get; set; }
        public string ActionName { get; set; }
        public string ControllerName { get; set; }
}
}
