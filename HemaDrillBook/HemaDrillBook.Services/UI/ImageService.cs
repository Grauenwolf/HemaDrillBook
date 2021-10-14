using HemaDrillBook.Models;
using Microsoft.Extensions.Options;
using System.Threading.Tasks;
using Tortuga.Chain;

namespace HemaDrillBook.Services.UI
{
    public class ImageService : ServiceBase
    {
        public ImageService(SqlServerDataSource dataSource, IOptions<BlobStorageOptions> settings) : base(dataSource)
        {
            Settings = settings.Value;
        }

        BlobStorageOptions Settings { get; }

        public async Task<ImageDetail> GetImageDetail(int imageKey, IUser? currentUser)
        {
            var ds = DataSource(currentUser);
            var cacheKey = $"{nameof(ImageService)}.{nameof(GetImageDetail)}:{imageKey}";
            var cachedResult = await ds.Cache.TryReadAsync<ImageDetail>(cacheKey);
            if (cachedResult.KeyFound)
                return cachedResult.Value;

            var result = (await ds.From("Images.ImageDetail", new { imageKey })
                .ToObject<ImageDetail>()
                .ExecuteAsync());

            result.StorageBaseUrl = Settings.StorageBaseUrl;
            result.ImageStorageContainer = Settings.ImageStorageContainer;
            result.ThumbnailStorageContainer = Settings.ThumbnailStorageContainer;

            result.Sections.AddRange(await ds.From("Images.ImageSectionMapDetail", new { imageKey }).ToCollection<ImageDetail.SectionSummary>().ExecuteAsync());

            await ds.Cache.WriteAsync(cacheKey, result, DefaultCachePolicy());

            return result;
        }
    }
}
