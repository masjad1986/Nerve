using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Repository.Dtos
{
    public class SqlColumnDto
    {
        public string Name { get; set; }
        public string AliasName { get; set; }
        public bool IsConversion { get; set; }
        public string ConversionType { get; set; }
    }
}
