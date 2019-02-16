using Nerve.Common.Enums;
using System.Data;

namespace Nerve.Common.Dtos
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
