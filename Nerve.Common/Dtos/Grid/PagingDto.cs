using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Common.Dtos.Grid
{
    public class PaginationDto
    {
        public int PageSize { get; set; }
        public int PageIndex { get; set; }
        public string Search { get; set; }
    }
}
