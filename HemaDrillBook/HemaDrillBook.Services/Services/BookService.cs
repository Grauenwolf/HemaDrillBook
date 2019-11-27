using HemaDrillBook.Models;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Tortuga.Anchor;
using Tortuga.Chain;

namespace HemaDrillBook.Services
{
    public class BookService : ServiceBase
    {
        public BookService(SqlServerDataSource dataSource) : base(dataSource)
        {
        }

        public Task<List<BookNameMap>> GetBookNameMapAsync(IUser? currentUser)
        {
            return DataSource(currentUser)
                .From("Sources.BookNameMap")
                .WithSorting("BookName")
                .ToCollection<BookNameMap>(CollectionOptions.InferConstructor)
                .ExecuteAsync();
        }

        public Task<List<PartSummary>> GetBookPartsAsync(int bookKey, IUser? currentUser)
        {
            var ds = DataSource(currentUser);
            ds.DatabaseMetadata.PreloadViews();
            foreach (var item in ds.DatabaseMetadata.GetTablesAndViews())
            {
                Debug.WriteLine(item.Name);
            }

            return DataSource(currentUser)
                .From("Sources.PartDetail", new { BookKey = bookKey })
                .WithSorting("DisplayOrder")
                .ToCollection<PartSummary>(CollectionOptions.InferConstructor)
                .ExecuteAsync();
        }

        public async Task<BookDetail> GetBookDetailAsync(string bookSlug, IUser? currentUser)
        {
            var result = (await DataSource(currentUser)
                .From("Sources.BookDetail", new { BookSlug = bookSlug })
                .ToObject<BookDetail>(RowOptions.InferConstructor)
                //.NeverNull() //Hack: This is broken in Chain 3.0. It works in 3.1.
                .ExecuteAsync())!;

            result.AlternateNames.AddRange(await GetBookAlternateNamesAsync(result.BookKey, currentUser));
            result.Authors.AddRange(await GetAuthorsByBookAsync(result.BookKey, currentUser));
            result.Parts.AddRange(await GetBookPartsAsync(result.BookKey, currentUser));
            result.Weapons.AddRange(await GetBookWeaponsAsync(result.BookKey, currentUser));

            return result;
        }

        public Task<List<string>> GetBookAlternateNamesAsync(int bookKey, IUser? currentUser)
        {
            return DataSource(currentUser)
                .From("Sources.AlternateBookName", new { BookKey = bookKey })
                .WithSorting("AlternateBookName")
                .ToStringList("AlternateBookName")
                .ExecuteAsync()!;
        }

        public Task<List<AuthorSummary>> GetAuthorsByBookAsync(int bookKey, IUser? currentUser)
        {
            return DataSource(currentUser)
                .From("Sources.BookAuthorMapDetail", new { BookKey = bookKey })
                .WithSorting("AuthorName")
                .ToCollection<AuthorSummary>(CollectionOptions.InferConstructor)
                .ExecuteAsync();
        }

        public Task<List<WeaponPairSummary>> GetBookWeaponsAsync(int bookKey, IUser? currentUser)
        {
            return DataSource(currentUser)
                .From("Sources.BookWeaponMapDetail", new { BookKey = bookKey })
                .WithSorting("PrimaryWeaponName", "SecondaryWeaponName")
                .ToCollection<WeaponPairSummary>(CollectionOptions.InferConstructor)
                .ExecuteAsync();
        }

        public Task<List<WeaponPairSummary>> GetPartWeaponsAsync(int partKey, IUser? currentUser)
        {
            return DataSource(currentUser)
                .From("Sources.PartWeaponMapDetail", new { PartKey = partKey })
                .WithSorting("PrimaryWeaponName", "SecondaryWeaponName")
                .ToCollection<WeaponPairSummary>(CollectionOptions.InferConstructor)
                .ExecuteAsync();
        }

        public async Task<List<PlaySummary>> GetPartPlaysAsync(int partKey, IUser? currentUser)
        {
            var result = await DataSource(currentUser)
                .From("Interpretations.PlayDetail", new { PartKey = partKey })
                .ToCollection<PlaySummary>()
                .ExecuteAsync();

            result = result.OrderBy(x => x.VariantName ?? x.SectionName).ToList();

            return result;
        }

        public async Task<PartDetail> GetPartDetailAsync(string bookSlug, string partSlug, IUser? currentUser)
        {
            var ds = DataSource(currentUser);
            var part = (await ds.From("Sources.PartDetail", new { bookSlug, partSlug }).ToObject<PartDetail>().ExecuteAsync())!; //Hack, NeverNull in Chain 3.1

            var flatList = await GetBookPartsAsync(part.BookKey, currentUser);
            var index = flatList.FindIndex(x => x.PartKey == part.PartKey);
            part.Previous = (index > 0) ? flatList[index - 1] : null;
            part.Next = (index < flatList.Count - 1) ? flatList[index + 1] : null;
            part.Weapons.AddRange(await GetPartWeaponsAsync(part.PartKey, currentUser));

            part.Sections.AddRange(await GetPartSectionsAsync(part.PartKey, currentUser));

            part.Plays.AddRange(await GetPartPlaysAsync(part.PartKey, currentUser));

            return part;
        }

        public Task<List<WeaponPairSummary>> GetSectionWeaponsAsync(int sectionKey, IUser currentUser)
        {
            return DataSource(currentUser)
                .From("Sources.SectionWeaponMapDetail", new { SectionKey = sectionKey })
                .WithSorting("PrimaryWeaponName", "SecondaryWeaponName")
                .ToCollection<WeaponPairSummary>(CollectionOptions.InferConstructor)
                .ExecuteAsync();
        }

        public async Task<SectionDetail> GetSectionDetailAsync(int sectionKey, /*bool includeSubsectionWeapons, bool includeSubsectionPlays,*/ IUser currentUser)
        {
            var ds = DataSource(currentUser);
            var filter = new { sectionKey };
            var section = (await ds.From("Sources.SectionDetail", filter).ToObject<SectionDetail>().ExecuteAsync())!; //Hack, NeverNull in Chain 3.1

            var (subsections, previous, next, up) = await GetSubsectionsAsync(section.PartKey, section.SectionKey, /*includeSubsectionWeapons, includeSubsectionPlays,*/ currentUser);
            section.Subsections.AddRange(subsections);
            section.Previous = previous;
            section.Next = next;
            section.Up = up;

            //section.Videos.AddRange(await ds.From("Interpretations.Video", filter).ToCollection<Video>().ExecuteAsync());
            section.Weapons.AddRange(await GetSectionWeaponsAsync(section.SectionKey, currentUser));

            //section.Plays.AddRange(await m_PlayService.GetPlayDetailsForSectionAsync(sectionKey, currentUser));

            //section.Translations.AddRange(await ds.From("Translations.SectionTranslationDetail", filter).ToCollection<SectionTranslationDetail>().ExecuteAsync());

            //section.CanEdit = await CanEditBookAsync(section.BookKey, currentUser);

            return section;
        }

        async Task<List<SectionSummary>> GetPartSectionsAsync(int partKey, /*bool includeWeapons, bool includePlays,*/ IUser? currentUser)
        {
            var ds = DataSource(currentUser);
            var filter = new { partKey };
            var sections = await ds.From("Sources.SectionDetail", filter).WithSorting("DisplayOrder").ToCollection<SectionSummary>().ExecuteAsync();

            foreach (var section in sections)
                section.Subsections.AddRange(sections.Where(x => x.ParentSectionKey == section.SectionKey));

            var result = sections.Where(x => x.ParentSectionKey == null).ToList();
            foreach (var section in result)
                section.Depth = 0;

            return result;
        }

        async Task<(List<SectionSummary> List, SectionSummary? Next, SectionSummary? Previous, SectionSummary? Up)> GetSubsectionsAsync(int partKey, int sectionKey, /*bool includeWeapons, bool includePlays,*/ IUser currentUser)
        {
            //This could be more efficient using a recursive CTE

            var ds = DataSource(currentUser);
            var filter = new { partKey };
            var sections = await ds.From("Sources.SectionDetail", filter).WithSorting("DisplayOrder").ToCollection<SectionSummary>().ExecuteAsync();

            foreach (var section in sections)
                section.Subsections.AddRange(sections.Where(x => x.ParentSectionKey == section.SectionKey));

            //if (includeWeapons)
            //{
            //    var weapons = await ds.From("Sources.SectionWeaponMapDetail", filter).ToCollection<WeaponPairSectionSummary>().ExecuteAsync();
            //    foreach (var section in sections)
            //        section.Weapons.AddRange(weapons.Where(x => x.SectionKey == section.SectionKey));
            //}

            //if (includePlays)
            //{
            //    var plays = await ds.From("Interpretations.PlayDetail", filter).ToCollection<PlaySummary>().ExecuteAsync();
            //    foreach (var section in sections)
            //        section.Plays.AddRange(plays.Where(x => x.SectionKey == section.SectionKey));
            //}

            var flatList = Flatten(sections);

            var result = flatList.Single(x => x.SectionKey == sectionKey);
            var index = flatList.IndexOf(result);

            foreach (var section in result.Subsections)
                section.Depth = 1;

            var previous = (index > 0) ? flatList[index - 1] : null;
            var next = (index < flatList.Count - 2) ? flatList[index + 1] : null;
            var up = (result.ParentSectionKey != null) ? flatList.Single(x => x.SectionKey == result.ParentSectionKey) : null;
            return (result.Subsections, previous, next, up);
        }

        /// <summary>
        /// Creates a flat list of sections in the correct order.
        /// </summary>
        /// <param name="sections">The sections.</param>
        /// <returns>List&lt;SectionSummary&gt;.</returns>
        List<SectionSummary> Flatten(List<SectionSummary> sections)
        {
            var result = new List<SectionSummary>(sections.Count);
            var roots = sections.Where(s => s.ParentSectionKey == null).ToList();
            foreach (var section in roots)
            {
                AddWithChildern(section);
            }
            return result;

            void AddWithChildern(SectionSummary section)
            {
                result.Add(section);
                foreach (var subsection in section.Subsections)
                {
                    AddWithChildern(subsection);
                }
            }
        }

        /*
        private readonly PlayService m_PlayService;

        public BookService(SqlServerDataSource dataSource, PlayService playService) : base(dataSource)
        {
            m_PlayService = playService ?? throw new System.ArgumentNullException(nameof(playService));
        }
        */

        /*

        public Task<List<BookAuthorDetail>> GetBooksAndAuthorsAsync(IUser currentUser)
        {
            return DataSource(currentUser).From("Sources.BookAuthorDetail").WithSorting("BookName", "AuthorName").ToCollection<BookAuthorDetail>().ExecuteAsync();
        }

        */

        /*
        public Task<List<BookSummary>> GetBooksAsync(IUser currentUser)
        {
            return DataSource(currentUser).From("Sources.Book").WithSorting("BookName").ToCollection<BookSummary>().ExecuteAsync();
        }

        public Task<BookSummary> GetBookSummaryAsync(int bookKey, IUser currentUser)
        {
            var filter = new { bookKey };
            return DataSource(currentUser).From("Sources.Book", filter).ToObject<BookSummary>().ExecuteAsync();
        }

        public async Task<SectionDetail> GetSectionDetailAsync(int sectionKey, bool includeSubsectionWeapons, bool includeSubsectionPlays, IUser currentUser)
        {
            var ds = DataSource(currentUser);
            var filter = new { sectionKey };
            var section = await ds.From("Sources.SectionDetail", filter).ToObject<SectionDetail>().ExecuteAsync();

            var (subsections, previous, next, up) = await GetSubsectionsAsync(section.BookKey, section.SectionKey, includeSubsectionWeapons, includeSubsectionPlays, currentUser);
            section.Subsections.AddRange(subsections);
            section.Previous = previous;
            section.Next = next;
            section.Up = up;

            section.Videos.AddRange(await ds.From("Interpretations.Video", filter).ToCollection<Video>().ExecuteAsync());
            section.Weapons.AddRange(await ds.From("Sources.SectionWeaponMapDetail", filter).ToCollection<WeaponVersus>().ExecuteAsync());

            section.Plays.AddRange(await m_PlayService.GetPlayDetailsForSectionAsync(sectionKey, currentUser));

            section.Translations.AddRange(await ds.From("Translations.SectionTranslationDetail", filter).ToCollection<SectionTranslationDetail>().ExecuteAsync());

            section.CanEdit = await CanEditBookAsync(section.BookKey, currentUser);

            return section;
        }

        private async Task<List<SectionSummary>> GetSectionsAsync(int bookKey, bool includeWeapons, IUser currentUser)
        {
            var ds = DataSource(currentUser);
            var filter = new { bookKey };
            var sections = await ds.From("Sources.SectionDetail", filter).WithSorting("DisplayOrder").ToCollection<SectionSummary>().ExecuteAsync();

            foreach (var section in sections)
                section.Subsections.AddRange(sections.Where(x => x.ParentSectionKey == section.SectionKey));

            if (includeWeapons)
            {
                var weapons = await ds.From("Sources.SectionWeaponMapDetail", filter).ToCollection<WeaponVersusSummary>().ExecuteAsync();
                foreach (var section in sections)
                    section.Weapons.AddRange(weapons.Where(x => x.SectionKey == section.SectionKey));
            }

            var result = sections.Where(x => x.ParentSectionKey == null).ToList();
            foreach (var section in result)
                section.Depth = 1;
            return result;
        }

        async Task<(SectionSummaryCollection List, SectionSummary Next, SectionSummary Previous, SectionSummary Up)> GetSubsectionsAsync(int bookKey, int sectionKey, bool includeWeapons, bool includePlays, IUser currentUser)
        {
            //This could be more efficient using a recursive CTE

            var ds = DataSource(currentUser);
            var filter = new { bookKey };
            var sections = await ds.From("Sources.SectionDetail", filter).WithSorting("DisplayOrder").ToCollection<SectionSummary>().ExecuteAsync();

            foreach (var section in sections)
                section.Subsections.AddRange(sections.Where(x => x.ParentSectionKey == section.SectionKey));

            if (includeWeapons)
            {
                var weapons = await ds.From("Sources.SectionWeaponMapDetail", filter).ToCollection<WeaponVersusSummary>().ExecuteAsync();
                foreach (var section in sections)
                    section.Weapons.AddRange(weapons.Where(x => x.SectionKey == section.SectionKey));
            }

            if (includePlays)
            {
                var plays = await ds.From("Interpretations.PlayDetail", filter).ToCollection<PlaySummary>().ExecuteAsync();
                foreach (var section in sections)
                    section.Plays.AddRange(plays.Where(x => x.SectionKey == section.SectionKey));
            }

            var flatList = Flatten(sections);

            var result = flatList.Single(x => x.SectionKey == sectionKey);
            var index = flatList.IndexOf(result);

            foreach (var section in result.Subsections)
                section.Depth = 1;

            var previous = (index > 0) ? flatList[index - 1] : null;
            var next = (index < flatList.Count - 2) ? flatList[index + 1] : null;
            var up = (result.ParentSectionKey != null) ? flatList.Single(x => x.SectionKey == result.ParentSectionKey) : null;
            return (result.Subsections, previous, next, up);
        }

        /// <summary>
        /// Creates a flat list of sections in the correct order.
        /// </summary>
        /// <param name="sections">The sections.</param>
        /// <returns>List&lt;SectionSummary&gt;.</returns>
        List<SectionSummary> Flatten(List<SectionSummary> sections)
        {
            var result = new List<SectionSummary>(sections.Count);
            var roots = sections.Where(s => s.ParentSectionKey == null).ToList();
            foreach (var section in roots)
            {
                AddWithChildern(section);
            }
            return result;

            void AddWithChildern(SectionSummary section)
            {
                result.Add(section);
                foreach (var subsection in section.Subsections)
                {
                    AddWithChildern(subsection);
                }
            }
        }
        */
    }
}
