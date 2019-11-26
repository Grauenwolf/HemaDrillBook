using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using Tortuga.Chain;

namespace DevTools
{
    class Program
    {
        static void Main(string[] args)
        {
            const string videoConnectionString = @"Server=.;Database=HemaVideoDB;User Id=HemaWeb;Password=tqgWpP$yxzkq}yxoBSvtsmsFT7_&#$!~<vVtynywf{tyI;MultipleActiveResultSets=true";
            const string drillBookConnectionString = @"Server=.;Database=HemaDrillBookDB;User Id=HemaWeb;Password=tqgWpP$yxzkq}yxoBSvtsmsFT7_&#$!~<vVtynywf{tyI;MultipleActiveResultSets=true";

            var videoDS = new SqlServerDataSource(videoConnectionString);
            var drillBookDS = new SqlServerDataSource(drillBookConnectionString);
            videoDS.TestConnection();
            drillBookDS.TestConnection();

            ExportTable(videoDS, "Tags.Footwork");
            ExportTable(videoDS, "Tags.Guard");
            ExportTable(videoDS, "Tags.GuardModifier");
            ExportTable(videoDS, "Tags.Measure");
            ExportTable(videoDS, "Tags.Target");
            ExportTable(videoDS, "Tags.Weapon");
            ExportTable(videoDS, "Tags.Technique");
        }

        static string ValueToSqlValue(object value, SqlDbType? dbType)
        {
            switch (value)
            {
                case string s:
                    {
                        switch (dbType)
                        {
                            case SqlDbType.Char:
                            case SqlDbType.VarChar:
                            case SqlDbType.Text:
                                return "'" + s.Replace("'", "''", StringComparison.OrdinalIgnoreCase) + "'";

                            case SqlDbType.NChar:
                            case SqlDbType.NVarChar:
                            case SqlDbType.NText:
                                return "N'" + s.Replace("'", "''", StringComparison.OrdinalIgnoreCase) + "'";

                            default: //Assume Unicode
                                return "N'" + s.Replace("'", "''", StringComparison.OrdinalIgnoreCase) + "'";
                        }
                    }

                default:
                    {
                        switch (value)
                        {
                            case DBNull _:
                            case System.Reflection.Missing _:
                            case null:
                                return "NULL";

                            case byte _:
                            case sbyte _:
                            case short _:
                            case ushort _:
                            case int _:
                            case uint _:
                            case long _:
                            case ulong _:
                            case decimal _:
                            case float _:
                            case double _:
                                return value.ToString();

                            case string s:
                                return "'" + s.Replace("'", "''", StringComparison.Ordinal) + "'";

                            case DateTime d:
                                return "'" + d.ToString("O", CultureInfo.InvariantCulture) + "'"; //ISO 8601

                            case DateTimeOffset d:
                                return "'" + d.ToString("O", CultureInfo.InvariantCulture) + "'"; //ISO 8601

                            case TimeSpan ts:
                                return "'" + ts.ToString("hh:mm:ss.fffffff", CultureInfo.InvariantCulture) + "'"; //ISO 8601

                            default:
                                if (dbType.HasValue)
                                    throw new NotSupportedException($"Converting a value of type {value.GetType().Name} into a string of type {dbType.ToString()} is not supported. Try filing a bug report.");
                                else
                                    throw new NotSupportedException($"Converting a value of type {value.GetType().Name} is not supported. Try supplying a dbType or filing a bug report.");
                        }
                    }
            }
        }

        static void ExportTable(SqlServerDataSource dataSource, string tableName)
        {
            var table = dataSource.DatabaseMetadata.GetTableOrView(tableName);
            var data = dataSource.From(tableName).ToTable().Execute();
            var columnsOfInterest = table.Columns.Where(c => c.SqlName != "SysStartTime" &&
c.SqlName != "SysEndTime").ToList();
            var primaryColumn = columnsOfInterest.Single(c => c.IsPrimaryKey);
            var dataColumns = columnsOfInterest.Where(c => !c.IsPrimaryKey).ToList();

            var output = new System.Text.StringBuilder();

            output.AppendLine(@$"
DECLARE @{table.Name.Name} TABLE
(");
            foreach (var column in columnsOfInterest)
            {
                output.Append(column.SqlName + " " + column.FullTypeName);
                if (column.IsNullable == true)
                    output.Append(" NULL");
                else if (column.IsNullable == true)
                    output.Append(" NOT NULL");
                if (column.IsPrimaryKey)
                    output.Append(" PRIMARY KEY");

                if (column != columnsOfInterest.Last())
                    output.Append(",");
                output.Append("\r\n");
            }
            output.AppendLine(@$"
);

INSERT INTO @{table.Name.Name}
(  { string.Join(",\r\n", columnsOfInterest.Select(c => c.SqlName)) } )
VALUES

{ string.Join(",\r\n", data.Rows.Select(
    r => "(" + string.Join(", ", columnsOfInterest.Select(c => ValueToSqlValue(r[c.ClrName], c.DbType))) + ")"

    ))}

;");

            output.AppendLine($@"
SET IDENTITY_INSERT {table.Name} ON;

MERGE INTO {table.Name} t
USING @{table.Name.Name} s
ON t.{primaryColumn.SqlName} = s.{primaryColumn.SqlName}
WHEN NOT MATCHED THEN
    INSERT
(  { string.Join(",\r\n", columnsOfInterest.Select(c => c.SqlName)) } )
    VALUES
    (  { string.Join(",\r\n", columnsOfInterest.Select(c => "s." + c.SqlName)) } )
WHEN MATCHED THEN
    UPDATE SET  { string.Join(",\r\n", dataColumns.Select(c => c.SqlName + " = s." + c.SqlName)) };

SET IDENTITY_INSERT {table.Name} ON;
");

            File.WriteAllText(tableName + ".sql", output.ToString());
        }
    }
}
