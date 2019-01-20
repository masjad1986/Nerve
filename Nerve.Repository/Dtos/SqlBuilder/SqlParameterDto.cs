using Nerve.Repository.Enums;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Nerve.Repository.Dtos
{
    public class SqlParameterDto
    {
        public string ColumnName { get; set; }
        public string ParameterName { get; set; }
        public object ParameterValue { get; set; }
        public SqlDbType SqlDbType { get; set; }
        public SqlConditionType ConditionType { get; set; }
    }
}
