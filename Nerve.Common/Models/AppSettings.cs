using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Common.Models
{
    public class AppSettings
    {
        public string LANGUAGE_RESOURCE_FILEPATH { get; set; }
        public string ERROR_LOG_FILEPATH { get; set; }
        public string HAMI_DATA_DATABASE { get; set; }
        public string HAMI_SCP_DATABASE { get; set; }
        public string HAMI_VM_DATABASE { get; set; }
        public bool DISPLAY_PAGE_ERROR { get; set; }
    }
}
