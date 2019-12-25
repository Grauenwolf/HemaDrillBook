using Microsoft.Extensions.Configuration;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Auth;
using Microsoft.WindowsAzure.Storage.Blob;
using SixLabors.ImageSharp;
using SixLabors.ImageSharp.Processing;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tortuga.Chain;

namespace DevTools
{
    class Program
    {
        static void PrintStrings(List<string> list)
        {
            foreach (var item in list)
                Console.WriteLine("\t" + item);
        }

        async static Task Main(string[] args)
        {
            var configuration = new ConfigurationBuilder().SetBasePath(AppContext.BaseDirectory).AddJsonFile("appsettings.json").AddEnvironmentVariables().Build();

            const string videoConnectionString = @"Server=.;Database=HemaVideoDB;Integrated Security=True;Persist Security Info=False;Pooling=False;MultipleActiveResultSets=False;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False";
            const string drillBookConnectionString = @"Server=.;Database=HemaDrillBookDB;Integrated Security=True;Persist Security Info=False;Pooling=False;MultipleActiveResultSets=False;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False";

            string productionConnectionString = configuration["ProdConnectionString"];

            var videoDS = new SqlServerDataSource(videoConnectionString);
            var drillBookDS = new SqlServerDataSource(drillBookConnectionString);
            var prodDS = new SqlServerDataSource(productionConnectionString);
            videoDS.TestConnection();
            drillBookDS.TestConnection();
            prodDS.TestConnection();

            //ExportTable(videoDS, "Tags.Footwork");

            //ExportTable(videoDS, "Sources.Author");
            //ExportTable(videoDS, "Sources.Book");
            //ExportTable(videoDS, "Sources.BookAuthor");
            //ExportTable(videoDS, "Sources.AlternateBookName");
            //ExportTable(videoDS, "Interpretations.VideoService");

            //const string sectionWeaponFilter = @"EXISTS (SELECT * FROM Sources.Section s WHERE s.BookKey = @BookKey AND SectionWeaponMap.SectionKey = s.SectionKey)";
            //const string sectionPlayFilter = @"EXISTS (SELECT * FROM Sources.Section s WHERE s.BookKey = @BookKey AND Play.SectionKey = s.SectionKey)";
            //const string playStepFilter = @"EXISTS (SELECT * FROM Interpretations.Play p INNER JOIN Sources.Section s ON p.SectionKey = s.SectionKey WHERE PlayStep.PlayKey = p.PlayKey AND s.BookKey = @BookKey)";
            //const string videoFilter = @"SectionKey IN (SELECT s.SectionKey FROM Sources.Section s WHERE s.BookKey = @BookKey)";
            //const string sectionTranslationFilter = @"SectionKey IN (SELECT s.SectionKey FROM Sources.Section s WHERE s.BookKey = @BookKey)";

            //ExportTable(videoDS, "Translations.Translator");

            //foreach (var bookKey in videoDS.From("Sources.Book").ToInt32List("BookKey").Execute())
            //{
            //    ExportTable(videoDS, "Sources.Section", null, new { BookKey = bookKey }, $"Sources.Section.{bookKey}.sql");
            //    ExportTable(videoDS, "Sources.SectionWeaponMap", sectionWeaponFilter, new { BookKey = bookKey }, $"Sources.SectionWeaponMap.{bookKey}.sql");
            //    ExportTable(videoDS, "Interpretations.Play", sectionPlayFilter, new { BookKey = bookKey }, $"Interpretations.Play.{bookKey}.sql");
            //    ExportTable(videoDS, "Interpretations.PlayStep", playStepFilter, new { BookKey = bookKey }, $"Interpretations.PlayStep.{bookKey}.sql");

            //    ExportTable(videoDS, "Interpretations.Video", videoFilter, new { BookKey = bookKey }, $"Interpretations.Video.{bookKey}.sql");

            //    ExportTable(videoDS, "Translations.Translation", null, new { BookKey = bookKey }, $"Translations.Translation.{bookKey}.sql");
            //    ExportTable(videoDS, "Translations.SectionTranslation", sectionTranslationFilter, new { BookKey = bookKey }, $"Translations.SectionTranslation.{bookKey}.sql");
            //}

            ////ExportTable(drillBookDS, "Sources.Part");

            //var partMax = drillBookDS.Sql("SELECT MAX(PartKey) FROM Sources.Part").ToInt32().Execute();

            //for (var i = 1; i <= partMax; i++)
            //{
            //    ExportTable_Sections(drillBookDS, new { PartKey = i }, $"Sources.Section.Part.{i}.sql");
            //}

            //ExportTable(videoDS, "Tags.Guard");
            //ExportTable(videoDS, "Tags.GuardModifier");
            //ExportTable(videoDS, "Tags.Measure");
            //ExportTable(videoDS, "Tags.Target");
            //ExportTable(videoDS, "Tags.Weapon");
            //ExportTable(videoDS, "Tags.Technique");

            var devContainer = GetBlobContainer(configuration["ImageStorageUserName"], configuration["ImageStorageKey"], "devimages");
            var devThumbnailContainer = GetBlobContainer(configuration["ImageStorageUserName"], configuration["ImageStorageKey"], "devimages240");

            var prodContainer = GetBlobContainer(configuration["ImageStorageUserName"], configuration["ImageStorageKey"], "images");
            var prodThumbnailContainer = GetBlobContainer(configuration["ImageStorageUserName"], configuration["ImageStorageKey"], "images240");

            //await DeleteAllImagesAsync(devContainer);
            //await DeleteAllImagesAsync(devThumbnailContainer);

            //Console.WriteLine("**************************************");
            //PrintStrings(await ListBlobNamesAsync(devContainer));
            //Console.WriteLine("**************************************");
            //PrintStrings(await ListBlobNamesAsync(devThumbnailContainer));
            //Console.WriteLine("**************************************");
            //PrintStrings(await ListBlobNamesAsync(prodContainer));
            //Console.WriteLine("**************************************");
            //PrintStrings(await ListBlobNamesAsync(prodThumbnailContainer));
            //Console.WriteLine("**************************************");

            //var folder = new DirectoryInfo(@"D:\Dropbox\Fencing\Agrippa Tradition\L'Ange\Images");
            //await UploadLangeImages(folder, drillBookDS, devContainer, devThumbnailContainer);
            //await UploadLangeImages(folder, prodDS, prodContainer, prodThumbnailContainer);
        }

        static async Task DeleteAllImagesAsync(CloudBlobContainer devContainer)
        {
            foreach (CloudBlockBlob item in await ListBlobsAsync(devContainer))
            {
                await item.DeleteAsync();
            }
        }

        public static async Task<List<string>> ListBlobNamesAsync(CloudBlobContainer container)
        {
            var blobs = await ListBlobsAsync(container);
            return blobs.Cast<CloudBlockBlob>().Select(b => b.Name).ToList();

            //Alternate version
            //return blobs.Select(b => b.Uri.ToString()).Select(s => s.Substring(s.LastIndexOf('/') + 1)).ToList();
        }

        public static async Task<List<IListBlobItem>> ListBlobsAsync(CloudBlobContainer container)
        {
            BlobContinuationToken continuationToken = null; //start at the beginning
            var results = new List<IListBlobItem>();
            do
            {
                var response = await container.ListBlobsSegmentedAsync(continuationToken);
                continuationToken = response.ContinuationToken;
                results.AddRange(response.Results);
            }

            while (continuationToken != null); //when this is null again, we've reached the end
            return results;
        }

        private static async Task UploadLangeImages(DirectoryInfo folder, SqlServerDataSource dataSource, CloudBlobContainer imageContainer, CloudBlobContainer thumbnailContainer)
        {
            foreach (var imageFile in folder.GetFiles())
            {
                if (string.Equals(imageFile.Extension, ".png", StringComparison.InvariantCultureIgnoreCase))
                {
                    Console.Write(imageFile.Name);
                    using (var trans = dataSource.BeginTransaction())
                    {
                        var record = new
                        {
                            ImageName = Path.GetFileNameWithoutExtension(imageFile.Name),
                            FileName = imageFile.Name,
                            FileSize = imageFile.Length,
                            CreatedByUserKey = -1,
                            ModifiedByUserKey = -1,
                            ImageSetKey = 1,
                        };
                        Console.Write("...database");
                        var imageKey = await dataSource.Insert("Images.Image", record).ToInt32().ExecuteAsync();
                        var storageName = await dataSource.From("Images.ImageDetail", new { imageKey }).ToString("StorageFileName").ExecuteAsync();

                        Console.Write("...storage");
                        using var stream = imageFile.OpenRead();
                        await UploadFileToStorageAsync(stream, storageName, imageContainer);

                        Console.Write("...more storage");
                        using var stream2 = CreateThumbnail(imageFile);
                        await UploadFileToStorageAsync(stream2, storageName, thumbnailContainer);

                        trans.Commit(); //Don't commit unless we were able to also upload the file
                        Console.WriteLine("...done!");
                    }
                }
            }
        }

        static MemoryStream CreateThumbnail(FileInfo file)
        {
            using var fileStream = file.OpenRead();
            return CreateThumbnail(fileStream);
        }

        static MemoryStream CreateThumbnail(Stream imageStream)
        {
            var result = new MemoryStream();

            using var image = (Image)Image.Load(imageStream);

            var (originalWidth, originalHeight) = image.Size();
            var largerDimension = Math.Max(originalWidth, originalHeight);

            var sizeFactor = (largerDimension > 240) ? largerDimension / 240.00 : 1.00;
            var newWidth = (int)(image.Width / sizeFactor);
            var newHeight = (int)(image.Height / sizeFactor);

            image.Mutate(x => x.Resize(newWidth, newHeight));

            image.SaveAsPng(result);

            result.Seek(0, SeekOrigin.Begin); //return to start
            return result;
        }

        public static async Task<bool> UploadFileToStorageAsync(Stream fileStream, string fileName, CloudBlobContainer container)
        {
            // Get the reference to the block blob from the container
            var blockBlob = container.GetBlockBlobReference(fileName);

            // Upload the file
            await blockBlob.UploadFromStreamAsync(fileStream);

            return await Task.FromResult(true);
        }

        private static CloudBlobContainer GetBlobContainer(string azureAccountName, string azureAccountKey, string containerName)
        {
            var storageCredentials = new StorageCredentials(azureAccountName, azureAccountKey);

            // Create cloud storage account by passing the storage credentials
            var storageAccount = new CloudStorageAccount(storageCredentials, true);

            // Create the blob client.
            var blobClient = storageAccount.CreateCloudBlobClient();

            // Get reference to the blob container by passing the name by reading the value from the configuration (appsettings.json)
            return blobClient.GetContainerReference(containerName);
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
                                return "'" + ts.ToString(@"hh\:mm\:ss\.fffffff", CultureInfo.InvariantCulture) + "'"; //ISO 8601

                            default:
                                if (dbType.HasValue)
                                    throw new NotSupportedException($"Converting a value of type {value.GetType().Name} into a string of type {dbType.ToString()} is not supported. Try filing a bug report.");
                                else
                                    throw new NotSupportedException($"Converting a value of type {value.GetType().Name} is not supported. Try supplying a dbType or filing a bug report.");
                        }
                    }
            }
        }

        static void ExportTable_Sections(SqlServerDataSource dataSource, object filterObject, string fileName)
        {
            var tableName = "Sources.Section";
            var data = dataSource.From(tableName, filterObject).ToTable().Execute();

            if (data.Rows.Count == 0)
                return;

            //Sort Sections
            var rows = new List<Dictionary<string, object>>();
            foreach (var row in data.Rows.Where(r => r["ParentSectionKey"] is null).OrderBy(r => r["DisplayOrder"]))
            {
                rows.Add(new Dictionary<string, object>(row));
                AddChildern(row, data, rows);
            }

            //Fix Slugs
            foreach (var row in rows.Where(r => r["SectionSlug"] == null))
            {
                var name = (string)row["SectionName"];
                var slug = new StringBuilder(name.Length);

                var isSkipping = false;
                foreach (var c in name)
                {
                    if (c == '(')
                        isSkipping = true;
                    else if (c == ')')
                        isSkipping = false;
                    else if (!isSkipping)
                        slug.Append(c);
                }

                row["SectionSlug"] = slug.ToString().Trim().Replace("  ", "-").Replace(" ", "-");
            }

            GenerateSql(dataSource, tableName, fileName, rows);
        }

        static void ExportTable(SqlServerDataSource dataSource, string tableName, string filterSql = null, object filterObject = null, string fileName = null)
        {
            Table data;
            if (filterSql != null)
                data = dataSource.From(tableName, filterSql, filterObject).ToTable().Execute();
            else if (filterObject != null)
                data = dataSource.From(tableName, filterObject).ToTable().Execute();
            else
                data = dataSource.From(tableName).ToTable().Execute();

            if (data.Rows.Count == 0)
                return;

            GenerateSql(dataSource, tableName, fileName, data.Rows);
        }

        static void AddChildern(Row row, Table data, List<Dictionary<string, object>> target)
        {
            foreach (var childRow in data.Rows.Where(r => object.Equals(r["ParentSectionKey"], row["SectionKey"])).OrderBy(r => r["DisplayOrder"]))
            {
                target.Add(new Dictionary<string, object>(childRow));
                AddChildern(childRow, data, target);
            }
        }

        private static void GenerateSql(SqlServerDataSource dataSource, string tableName, string filename, IReadOnlyList<IReadOnlyDictionary<string, object>> rows)
        {
            var table = dataSource.DatabaseMetadata.GetTableOrView(tableName);
            var columnsOfInterest = table.Columns.Where(c => c.SqlName != "SysStartTime" && c.SqlName != "SysEndTime" && c.SqlName != "ModifiedDate").ToList();
            var primaryColumns = columnsOfInterest.Where(c => c.IsPrimaryKey).ToList();
            var dataColumns = columnsOfInterest.Where(c => !c.IsPrimaryKey).ToList();
            var hasIdentity = columnsOfInterest.Any(c => c.IsIdentity);

            var output = new System.Text.StringBuilder();

            output.AppendLine(@$"IF $(OneTimeLoad) = 1
BEGIN

DECLARE @{table.Name.Name} TABLE
(");
            foreach (var column in columnsOfInterest)
            {
                output.Append(column.SqlName + " " + column.FullTypeName);
                if (column.IsNullable == true)
                    output.Append(" NULL");
                else if (column.IsNullable == false)
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

{ string.Join(",\r\n", rows.Select(
        r => "(" + string.Join(", ", columnsOfInterest.Select(c => ValueToSqlValue(r[c.ClrName], c.DbType))) + ")"

        ))}

;");
            if (hasIdentity)
                output.AppendLine($@"SET IDENTITY_INSERT {table.Name} ON;");

            output.AppendLine($@"

MERGE INTO {table.Name} t
USING @{table.Name.Name} s
ON {string.Join(" AND ", primaryColumns.Select(c => $"t.{c.SqlName} = s.{c.SqlName}")) }
WHEN NOT MATCHED THEN
    INSERT
(  { string.Join(",\r\n", columnsOfInterest.Select(c => c.SqlName)) } )
    VALUES
    (  { string.Join(",\r\n", columnsOfInterest.Select(c => "s." + c.SqlName)) } )
WHEN MATCHED THEN
    UPDATE SET  { string.Join(",\r\n", dataColumns.Select(c => c.SqlName + " = s." + c.SqlName)) };
");

            if (hasIdentity)
                output.AppendLine($@"SET IDENTITY_INSERT {table.Name} OFF;");

            output.AppendLine("END;");
            output.AppendLine("GO");

            File.WriteAllText(filename ?? (tableName + ".sql"), output.ToString());
        }
    }
}
