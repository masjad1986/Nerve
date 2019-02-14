using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Repository.Dtos
{
    public class TempLocationPrefixDto
    {
        public string UserId { get; set; }
        public string UserName { get; set; }
        public string LocationPrefix { get; set; }
        public string TrackingPrefix { get; set; }
    }
}
