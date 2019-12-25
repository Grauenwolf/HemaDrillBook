using HemaDrillBook.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Tortuga.Anchor;
using Tortuga.Chain;

namespace HemaDrillBook.Services.UI
{
    public class BookService : ServiceBase
    {
        public BookService(SqlServerDataSource dataSource) : base(dataSource)
        {
        }

        public Task<List<PartSummary>> GetBookPartsAsync(int bookKey, IUser? currentUser)
        {
            return DataSource(currentUser)
                .From("Sources.PartDetail", new { BookKey = bookKey })
                .WithSorting("DisplayOrder")
                .ToCollection<PartSummary>()
                .ReadOrCache($"{nameof(BookService)}.{nameof(GetBookPartsAsync)}:{bookKey}", DefaultCachePolicy())
                .ExecuteAsync();
        }

        public Task<List<BookNameMap>> GetBookNameMapAsync(bool includeAlternateNames, IUser? currentUser)
        {
            var filter = includeAlternateNames ? "" : "IsAlternateName = 0";

            return DataSource(currentUser)
            .From("Sources.BookNameMap", filter)
            .WithSorting("BookName")
            .ToCollection<BookNameMap>()
            .ReadOrCache($"{nameof(BookService)}.{nameof(GetBookNameMapAsync)}:{includeAlternateNames}", DefaultCachePolicy())
            .ExecuteAsync();
        }

        public async Task<BookDetail> GetBookDetailAsync(string bookSlug, IUser? currentUser)
        {
            var ds = DataSource(currentUser);
            var cacheKey = $"{nameof(BookService)}.{nameof(GetBookDetailAsync)}:{bookSlug}";
            var cachedResult = await ds.Cache.TryReadAsync<BookDetail>(cacheKey);
            if (cachedResult.KeyFound)
                return cachedResult.Value;

            var result = (await ds.From("Sources.BookDetail", new { BookSlug = bookSlug })
                .ToObject<BookDetail>()
                .NeverNull()
                .ReadOrCache($"{nameof(BookService)}.{nameof(GetBookDetailAsync)}:{bookSlug}", DefaultCachePolicy())
                .ExecuteAsync());

            result.AlternateNames.AddRange(await GetBookAlternateNamesAsync(result.BookKey, currentUser));
            result.Authors.AddRange(await GetAuthorsByBookAsync(result.BookKey, currentUser));
            result.Parts.AddRange(await GetBookPartsAsync(result.BookKey, currentUser));
            result.Weapons.AddRange(await GetBookWeaponsAsync(result.BookKey, currentUser));

            await ds.Cache.WriteAsync(cacheKey, result, DefaultCachePolicy());

            return result;
        }

        public Task<List<string>> GetBookAlternateNamesAsync(int bookKey, IUser? currentUser)
        {
            return DataSource(currentUser)
                .From("Sources.AlternateBookName", new { BookKey = bookKey })
                .WithSorting("AlternateBookName")
                .ToStringList("AlternateBookName")
                .ReadOrCache($"{nameof(BookService)}.{nameof(GetBookAlternateNamesAsync)}:{bookKey}", DefaultCachePolicy())
                .ExecuteAsync()!;
        }

        public Task<List<AuthorSummary>> GetAuthorsByBookAsync(int bookKey, IUser? currentUser)
        {
            return DataSource(currentUser)
                .From("Sources.BookAuthorMapDetail", new { BookKey = bookKey })
                .WithSorting("AuthorName")
                .ToCollection<AuthorSummary>()
                .ReadOrCache($"{nameof(BookService)}.{nameof(GetAuthorsByBookAsync)}:{bookKey}", DefaultCachePolicy())
                .ExecuteAsync();
        }

        public Task<List<WeaponPairSummary>> GetBookWeaponsAsync(int bookKey, IUser? currentUser)
        {
            return DataSource(currentUser)
                .From("Sources.BookWeaponMapDetail", new { BookKey = bookKey })
                .WithSorting("PrimaryWeaponName", "SecondaryWeaponName")
                .ToCollection<WeaponPairSummary>()
                .ReadOrCache($"{nameof(BookService)}.{nameof(GetBookWeaponsAsync)}:{bookKey}", DefaultCachePolicy())
                .ExecuteAsync();
        }

        //public async Task<List<SectionForLists>> GetSectionsWithSameParentAsync(int partKey, int? parentSectionKey, IUser? currentUser)
        //{
        //    var ds = DataSource(currentUser);
        //    if (parentSectionKey == null)
        //        return await ds.From("Sources.SectionDetail", new { partKey }).WithSorting("DisplayOrder").ToCollection<SectionForLists>().ExecuteAsync();
        //    else
        //        return await ds.From("Sources.SectionDetail", new { partKey, parentSectionKey }).WithSorting("DisplayOrder").ToCollection<SectionForLists>().ExecuteAsync();
        //}
    }
}
