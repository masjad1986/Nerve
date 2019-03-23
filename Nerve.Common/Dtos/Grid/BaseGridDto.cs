using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Common.Dtos.Grid
{
    public class BaseGridDto<T> where T : class
    {
        public BaseGridDto()
        {
            PageSizes = new Dictionary<int, String> {
                { 10, "10" },
                { 20, "20" },
                { 50, "50" },
                { 100, "100" },
                { 500, "500" }
            };
        }

        public bool AllowMultipleSelection { get; set; }
        public int Count { get; set; }
        public List<T> DataSource { get; set; }
        public PaginationDto Pagination { get; set; }
        public Dictionary<int, string> PageSizes { get; set; }

    }
}
