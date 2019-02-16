using Nerve.Common.Dtos;
using Nerve.Common.Enums;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Common.Helpers
{
    public interface IDynamicSqlBuilderHelper
    {
        Task<SqlCommand> SelectAsync<TEntity>(string schemaName, List<SqlColumnDto> columns, List<SqlParameterDto> whereConditions = null, int? takeRows = 0);
        Task<SqlCommand> SelectManyAsync<TEntity>(string schemaName, List<SqlParameterDto> whereConditions = null, int? takeRows = 0);
        Task<SqlCommand> InsertAsync<TEntity>(string schemaName, List<SqlColumnDto> columns, List<SqlParameterDto> parameters);
    }

    /// <summary>
    /// Generate dynamic sql script for given table name.
    /// It will allow you to generate the basis query like SELECT, INSERT, UPDATE AND DELETE.
    /// It will help to create SELECT TOP, CONDITIONAL QUERY AND MANY MORE.
    /// </summary>
    public class DynamicSqlBuilderHelper : IDynamicSqlBuilderHelper
    {
        /// <summary>
        /// Select all columns from given table.
        /// </summary>
        /// <typeparam name="TEntity">Provide entity with decorated sql table.</typeparam>
        /// <param name="schemaName"></param>
        /// <param name="whereConditions"></param>
        /// <param name="takeRows"></param>
        /// <returns></returns>
        public async Task<SqlCommand> SelectManyAsync<TEntity>(string schemaName, List<SqlParameterDto> whereConditions = null, int? takeRows = 0)
        {
            var selectQuery = await PrepareSelectAsync<TEntity>(schemaName, new List<SqlColumnDto>(), takeRows);
            var whereClauseQuery = await PrepareWhereClauseAsync(whereConditions);

            var command = new SqlCommand
            {
                CommandType = CommandType.Text,
                CommandText = selectQuery + " " + whereClauseQuery
            };

            return command;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="TEntity">Provide entity with decorated sql table.</typeparam>
        /// <param name="schemaName"></param>
        /// <param name="columns"></param>
        /// <param name="whereConditions"></param>
        /// <param name="takeRows"></param>
        /// <returns></returns>
        public async Task<SqlCommand> SelectAsync<TEntity>(string schemaName, List<SqlColumnDto> columns, List<SqlParameterDto> whereConditions = null, int? takeRows = 0)
        {
            var selectQuery = await PrepareSelectAsync<TEntity>(schemaName, columns, takeRows);
            var whereClauseQuery = await PrepareWhereClauseAsync(whereConditions);

            var command = new SqlCommand
            {
                CommandType = CommandType.Text,
                CommandText = selectQuery + " " + whereClauseQuery.Key
            };
            command.Parameters.AddRange(whereClauseQuery.Value.ToArray());
            return command;
        }

        /// <summary>
        /// Prepare insert query for single record.
        /// </summary>
        /// <typeparam name="TEntity">Provide entity with decorated sql table.</typeparam>
        /// <param name="schemaName"></param>
        /// <param name="columns"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        public async Task<SqlCommand> InsertAsync<TEntity>(string schemaName, List<SqlColumnDto> columns, List<SqlParameterDto> parameters)
        {
            var insertQuery = await PrepareInsertQueryAsync<TEntity>(schemaName, columns);
            var valuesQuery = await PrepareInsertValueQueryAsync(parameters);
            var command = new SqlCommand
            {
                CommandType = CommandType.Text,
                CommandText = insertQuery + " " + valuesQuery.Key
            };
            command.Parameters.AddRange(valuesQuery.Value.ToArray());
            return command;
        }

        /// <summary>
        /// Select query builder based on parameters.
        /// </summary>
        /// <typeparam name="TEntity">Provide entity with decorated sql table.</typeparam>
        /// <param name="schemaName">Database schema name associated with table. Default will be dbo. schema.</param>
        /// <param name="columns">List of column with alias name.</param>
        /// <param name="takeRows">Provide number to take top record in select query.</param>
        /// <returns></returns>
        private async Task<string> PrepareSelectAsync<TEntity>(string schemaName, List<SqlColumnDto> columns, int? takeRows = 0)
        {
            var queryBuilder = new StringBuilder();
            var tableName = nameof(TEntity);
            var query = string.Empty;
            if (!columns.Any())
            {
                // prepare select all columns
                if (takeRows != null)
                    queryBuilder.AppendLine($"SELECT TOP {takeRows} * FROM [{schemaName}].[{tableName}");
                else
                    queryBuilder.AppendLine($"SELECT * FROM [{schemaName}].[{tableName}");

                query = queryBuilder.ToString();
            }
            else
            {
                // prepare select selected columns
                if (takeRows != null)
                    queryBuilder.AppendLine($"SELECT TOP {takeRows} ");
                else
                    queryBuilder.AppendLine(@"SELECT ");

                columns.ForEach(column =>
                {
                    var aliasName = string.IsNullOrEmpty(column.AliasName) ? column.Name : column.AliasName;
                    queryBuilder.AppendLine($"{column.Name} AS [{aliasName}],");
                });

                query = $"{queryBuilder.ToString().TrimEnd(',')} FROM [{schemaName}].[{ tableName}";
            }

            return await Task.FromResult(query);
        }

        /// <summary>
        /// Prepare where clause based on required condition.
        /// </summary>
        /// <param name="columns"></param>
        /// <returns></returns>
        private async Task<KeyValuePair<string, List<SqlParameter>>> PrepareWhereClauseAsync(List<SqlParameterDto> conditionColumns)
        {
            var queryBuilder = new StringBuilder();
            var sqlParameters = new List<SqlParameter>();
            var index = 0;
            if (conditionColumns.Any())
            {
                queryBuilder.Append(@" WHERE ");

                conditionColumns.ForEach((column) =>
                {
                    // apply conditional operator for 
                    if (index > 0 && column.ConditionType != SqlConditionType.None)
                    {
                        queryBuilder.AppendLine($" {nameof(column.ConditionType)} [{column.ColumnName}] = ");
                    }
                    else
                    {
                        queryBuilder.AppendLine($"[{column.ColumnName}] =");
                    }

                    if (!string.IsNullOrEmpty(column.ParameterName))
                    {
                        queryBuilder.Append($"{column.ParameterName}");
                        // add sql parameter
                        sqlParameters.Add(new SqlParameter
                        {
                            ParameterName = column.ParameterName,
                            Value = column.ParameterValue,
                            SqlDbType = column.SqlDbType
                        });
                    }
                    else if (string.IsNullOrEmpty(column.ParameterName)
                        && (column.SqlDbType == SqlDbType.VarChar || column.SqlDbType == SqlDbType.Decimal))
                    {
                        queryBuilder.Append($"'{column.ParameterValue}'");
                    }
                    else
                    {
                        queryBuilder.Append($"{column.ParameterValue}");
                    }
                });
            }

            var result = new KeyValuePair<string, List<SqlParameter>>(queryBuilder.ToString(), sqlParameters);

            return await Task.FromResult(result);
        }
        /// <summary>
        /// Select query builder based on parameters.
        /// </summary>
        /// <typeparam name="TEntity">Provide entity with decorated sql table.</typeparam>
        /// <param name="schemaName">Database schema name associated with table. Default will be dbo. schema.</param>
        /// <param name="columns">List of column with alias name.</param>
        /// <param name="takeRows">Provide number to take top record in select query.</param>
        /// <returns></returns>
        private async Task<string> PrepareInsertQueryAsync<TEntity>(string schemaName, List<SqlColumnDto> columns)
        {
            var queryBuilder = new StringBuilder();
            var tableName = nameof(TEntity);
            var query = string.Empty;
            if (!columns.Any())
            {
                query = $"INSERT INTO [{schemaName}].[{tableName}]";
            }
            else
            {
                queryBuilder.AppendLine($"INSERT INTO [{schemaName}].[{tableName}] (");

                columns.ForEach(column =>
                {
                    queryBuilder.AppendLine($"{column.Name},");
                });

                query = $"{queryBuilder.ToString().TrimEnd(',')})";
            }

            return await Task.FromResult(query);
        }

        /// <summary>
        /// Prepare insert values based on parameter or values.
        /// </summary>
        /// <param name="columns"></param>
        /// <returns></returns>
        private async Task<KeyValuePair<string, List<SqlParameter>>> PrepareInsertValueQueryAsync(List<SqlParameterDto> values)
        {
            var queryBuilder = new StringBuilder();
            var sqlParameters = new List<SqlParameter>();
            var query = string.Empty;
            if (values.Any())
            {
                queryBuilder.Append(" VALUES ");

                values.ForEach((column) =>
                {
                    if (!string.IsNullOrEmpty(column.ParameterName))
                    {
                        queryBuilder.Append($"{column.ParameterName}");
                        // add sql parameter
                        sqlParameters.Add(new SqlParameter
                        {
                            ParameterName = column.ParameterName,
                            Value = column.ParameterValue,
                            SqlDbType = column.SqlDbType
                        });
                    }
                    else if (string.IsNullOrEmpty(column.ParameterName)
                        && (column.SqlDbType == SqlDbType.VarChar || column.SqlDbType == SqlDbType.Decimal))
                    {
                        queryBuilder.Append($"'{column.ParameterValue}'");
                    }
                    else
                    {
                        queryBuilder.Append($"{column.ParameterValue}");
                    }

                    queryBuilder.Append(",");
                });

                query = queryBuilder.ToString().TrimEnd(',');
            }

            var result = new KeyValuePair<string, List<SqlParameter>>(query, sqlParameters);
            return await Task.FromResult(result);
        }
    }
}
