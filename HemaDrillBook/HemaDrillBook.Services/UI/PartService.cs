using HemaDrillBook.Models;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Tortuga.Anchor;
using Tortuga.Chain;

namespace HemaDrillBook.Services.UI
{
    public class PartService : ServiceBase
    {
        public PartService(SqlServerDataSource dataSource) : base(dataSource)
        {
        }

        public async Task<PartDetail> GetPartDetailAsync(string bookSlug, string partSlug, IUser? currentUser)
        {
            var ds = DataSource(currentUser);
            var cacheKey = $"{nameof(PartService)}.{nameof(GetPartDetailAsync)}:{bookSlug}:{partSlug}";
            var cachedResult = await ds.Cache.TryReadAsync<PartDetail>(cacheKey);
            if (cachedResult.KeyFound)
                return cachedResult.Value;

            var part = (await ds.From("Sources.PartDetail", new { bookSlug, partSlug })
                .ToObject<PartDetail>()
                .NeverNull()
                .ExecuteAsync());

            var flatList = await GetBookPartsAsync(part.BookKey, currentUser);
            var index = flatList.FindIndex(x => x.PartKey == part.PartKey);
            part.PreviousPart = (index > 0) ? flatList[index - 1] : null;
            part.NextPart = (index < flatList.Count - 1) ? flatList[index + 1] : null;
            part.Weapons.AddRange(await GetPartWeaponsAsync(part.PartKey, currentUser));
            part.Sections.AddRange(await GetPartSectionsAsync(part.PartKey, currentUser));
            part.Plays.AddRange(await GetPartPlaysAsync(part.PartKey, currentUser));
            part.Images.AddRange(await GetPartImagesAsync(part.PartKey, currentUser));
            part.Videos.AddRange(await GetPartVideosAsync(part.PartKey, currentUser));

            await ds.Cache.WriteAsync(cacheKey, part, DefaultCachePolicy());

            return part;
        }

        public async Task<List<PartDetail.ImageSummary>> GetPartImagesAsync(int partKey, IUser? currentUser)
        {
            var result = await DataSource(currentUser)
                .From("Images.ImagePartMap", new { PartKey = partKey })
                .ToCollection<PartDetail.ImageSummary>()
                .ReadOrCache($"{nameof(PartDetail.ImageSummary)}.{nameof(GetPartImagesAsync)}:{partKey}", DefaultCachePolicy())
                .ExecuteAsync();

            //Task-98: Sort the images tab on the Part page
            result = result.OrderBy(x => x.ImageName).ToList();

            return result;
        }

        public async Task<List<PlaySummary>> GetPartPlaysAsync(int partKey, IUser? currentUser)
        {
            var result = await DataSource(currentUser)
                .From("Interpretations.PlayDetail", new { PartKey = partKey })
                .ToCollection<PlaySummary>()
                .ReadOrCache($"{nameof(PartService)}.{nameof(GetPartPlaysAsync)}:{partKey}", DefaultCachePolicy())
                .ExecuteAsync();

            result = result.OrderBy(x => x.VariantName ?? x.SectionName).ToList();

            return result;
        }

        public async Task<List<VideoSummary>> GetPartVideosAsync(int partKey, IUser? currentUser)
        {
            var result = await DataSource(currentUser)
                .From("Interpretations.VideoDetail", new { PartKey = partKey })
                .ToCollection<VideoSummary>()
                .ReadOrCache($"{nameof(PartService)}.{nameof(GetPartVideosAsync)}:{partKey}", DefaultCachePolicy())
                .ExecuteAsync();

            return result;
        }

        async Task<List<SectionSummary>> GetPartSectionsAsync(int partKey, /*bool includeWeapons, bool includePlays,*/ IUser? currentUser)
        {
            var ds = DataSource(currentUser);
            var cacheKey = $"{nameof(PartService)}.{nameof(GetPartSectionsAsync)}:{partKey}";
            var cachedResult = await ds.Cache.TryReadAsync<List<SectionSummary>>(cacheKey);
            if (cachedResult.KeyFound)
                return cachedResult.Value;

            var filter = new { partKey };
            var sections = await ds.From("Sources.SectionDetail", filter)
                .WithSorting("DisplayOrder")
                .ToCollection<SectionSummary>()
                .ExecuteAsync();

            foreach (var section in sections)
                section.Subsections.AddRange(sections.Where(x => x.ParentSectionKey == section.SectionKey));

            var result = sections.Where(x => x.ParentSectionKey == null).ToList();
            //foreach (var section in result)
            //    section.Depth = 0;

            await ds.Cache.WriteAsync(cacheKey, result, DefaultCachePolicy());

            return result;
        }

        public Task<List<WeaponPairSummary>> GetPartWeaponsAsync(int partKey, IUser? currentUser)
        {
            return DataSource(currentUser)
                .From("Sources.PartWeaponMapDetail", new { PartKey = partKey })
                .WithSorting("PrimaryWeaponName", "SecondaryWeaponName")
                .ToCollection<WeaponPairSummary>()
                .ReadOrCache($"{nameof(PartService)}.{nameof(GetPartWeaponsAsync)}:{partKey}", DefaultCachePolicy())
                .ExecuteAsync();
        }

        public Task<List<PartSummary>> GetBookPartsAsync(int bookKey, IUser? currentUser)
        {
            return DataSource(currentUser)
                .From("Sources.PartDetail", new { BookKey = bookKey })
                .WithSorting("DisplayOrder")
                .ToCollection<PartSummary>()
                .ReadOrCache($"{nameof(PartService)}.{nameof(GetBookPartsAsync)}:{bookKey}", DefaultCachePolicy())
                .ExecuteAsync();
        }
    }
}
