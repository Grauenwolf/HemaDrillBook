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

        public Task<List<BookNameMap>> GetBookNameMapAsync(bool includeAlternateNames, IUser? currentUser)
        {
            var filter = includeAlternateNames ? "" : "IsAlternateName = 0";

            return DataSource(currentUser)
            .From("Sources.BookNameMap", filter)
            .WithSorting("BookName")
            .ToCollection<BookNameMap>()
            .ExecuteAsync();
        }

        public Task<List<PartSummary>> GetBookPartsAsync(int bookKey, IUser? currentUser)
        {
            return DataSource(currentUser)
                .From("Sources.PartDetail", new { BookKey = bookKey })
                .WithSorting("DisplayOrder")
                .ToCollection<PartSummary>()
                .ExecuteAsync();
        }

        public async Task<BookDetail> GetBookDetailAsync(string bookSlug, IUser? currentUser)
        {
            var result = (await DataSource(currentUser)
                .From("Sources.BookDetail", new { BookSlug = bookSlug })
                .ToObject<BookDetail>()
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
                .ToCollection<AuthorSummary>()
                .ExecuteAsync();
        }

        public Task<List<WeaponPairSummary>> GetBookWeaponsAsync(int bookKey, IUser? currentUser)
        {
            return DataSource(currentUser)
                .From("Sources.BookWeaponMapDetail", new { BookKey = bookKey })
                .WithSorting("PrimaryWeaponName", "SecondaryWeaponName")
                .ToCollection<WeaponPairSummary>()
                .ExecuteAsync();
        }

        public Task<List<WeaponPairSummary>> GetPartWeaponsAsync(int partKey, IUser? currentUser)
        {
            return DataSource(currentUser)
                .From("Sources.PartWeaponMapDetail", new { PartKey = partKey })
                .WithSorting("PrimaryWeaponName", "SecondaryWeaponName")
                .ToCollection<WeaponPairSummary>()
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

        public async Task<List<VideoSummary>> GetPartVideosAsync(int partKey, IUser? currentUser)
        {
            var result = await DataSource(currentUser)
                .From("Interpretations.VideoDetail", new { PartKey = partKey })
                .ToCollection<VideoSummary>()
                .ExecuteAsync();

            return result;
        }

        public async Task<PartDetail> GetPartDetailAsync(string bookSlug, string partSlug, IUser? currentUser)
        {
            var ds = DataSource(currentUser);
            var part = (await ds.From("Sources.PartDetail", new { bookSlug, partSlug }).ToObject<PartDetail>().ExecuteAsync())!; //Hack, NeverNull in Chain 3.1

            await GetPartDetailCore(currentUser, part);

            return part;
        }

        private async Task GetPartDetailCore(IUser? currentUser, PartDetail part)
        {
            var flatList = await GetBookPartsAsync(part.BookKey, currentUser);
            var index = flatList.FindIndex(x => x.PartKey == part.PartKey);
            part.PreviousPart = (index > 0) ? flatList[index - 1] : null;
            part.NextPart = (index < flatList.Count - 1) ? flatList[index + 1] : null;
            part.Weapons.AddRange(await GetPartWeaponsAsync(part.PartKey, currentUser));
            part.Sections.AddRange(await GetPartSectionsAsync(part.PartKey, currentUser));
            part.Plays.AddRange(await GetPartPlaysAsync(part.PartKey, currentUser));
            part.Videos.AddRange(await GetPartVideosAsync(part.PartKey, currentUser));
        }

        public Task<List<VideoDetail>> GetSectionVideosAsync(int sectionKey, IUser? currentUser)
        {
            return DataSource(currentUser)
                .From("Interpretations.VideoDetail", new { SectionKey = sectionKey })
                .WithSorting(new SortExpression("ModifiedDate", SortDirection.Descending))
                .ToCollection<VideoDetail>()
                .ExecuteAsync();
        }

        public Task<List<WeaponPairSummary>> GetSectionWeaponsAsync(int sectionKey, IUser? currentUser)
        {
            return DataSource(currentUser)
                .From("Sources.SectionWeaponMapDetail", new { SectionKey = sectionKey })
                .WithSorting("PrimaryWeaponName", "SecondaryWeaponName")
                .ToCollection<WeaponPairSummary>()
                .ExecuteAsync();
        }

        public async Task<SectionDetail> GetSectionDetailAsync(string bookSlug, string partSlug, string sectionSlug, IUser? currentUser)
        {
            var ds = DataSource(currentUser);
            //var filter = new { sectionKey };
            var section = (await ds.From("Sources.SectionDetail", new { bookSlug, partSlug, sectionSlug }).ToObject<SectionDetail>().ExecuteAsync())!; //Hack, NeverNull in Chain 3.1

            await GetSectionDetailCore(section, currentUser);

            return section;
        }

        private async Task GetSectionDetailCore(SectionDetail section, IUser? currentUser)
        {
            var (subsections, previousPage, nextPage, up, previousSection, nextSection, breadCrumb) = await GetSubsectionsAsync(section.PartKey, section.SectionKey, currentUser);

            breadCrumb.Insert(0, new AppLink() { Name = section.PartName, UrlFragment = section.PartUrlFragment });
            breadCrumb.Insert(0, new AppLink() { Name = section.BookName, UrlFragment = section.BookUrlFragment });

            section.Subsections.AddRange(subsections);
            section.PreviousPage = previousPage;
            section.NextPage = nextPage;
            section.Up = up;
            section.PreviousSection = previousSection;
            section.NextSection = nextSection;
            section.BreadCrumb = breadCrumb;

            section.Videos.AddRange(await GetSectionVideosAsync(section.SectionKey, currentUser));
            section.Weapons.AddRange(await GetSectionWeaponsAsync(section.SectionKey, currentUser));

            section.Plays.AddRange(await GetPlayDetailsForSectionAsync(section.SectionKey, currentUser));

            var (commentaries, note) = await GetCommentaryDetailsForSectionAsync(section.SectionKey, currentUser);
            section.Commentary.AddRange(commentaries);
            section.MyCommentary = note;

            if (section.MyCommentary == null && currentUser?.UserKey != null)
                section.MyCommentary = new CommentarySummary() { SectionKey = section.SectionKey, UserKey = currentUser.UserKey.Value };
        }

        public async Task<List<PlayDetail>> GetPlayDetailsForSectionAsync(int sectionKey, IUser? currentUser)
        {
            var filter = new { sectionKey };
            var dataSource = DataSource(currentUser);
            var plays = await dataSource.From("Interpretations.PlayDetail", filter).WithSorting("VariantName").ToCollection<PlayDetail>().ExecuteAsync();

            var steps = await dataSource.From("Interpretations.PlayStepDetail", filter).WithSorting("PlayKey", "TempoNumber", "Actor").ToCollection<PlayStepDetail>().ExecuteAsync();

            foreach (var play in plays)
                play.Steps.AddRange(steps.Where(x => x.PlayKey == play.PlayKey));

            return plays;
        }

        public async Task<(IEnumerable<CommentarySummary> commentaries, CommentarySummary? note)> GetCommentaryDetailsForSectionAsync(int sectionKey, IUser? currentUser)
        {
            //if user is null, only public notes will be returned
            var dataSource = DataSource(currentUser);
            var commentary = await dataSource.TableFunction("Interpretations.CommentaryDetailFiltered", new { currentUser?.UserKey })
                .WithFilter(new { sectionKey })
                .WithSorting(new SortExpression("ModifiedDate", SortDirection.Descending))
                .ToCollection<CommentarySummary>()
                .ExecuteAsync();

            return (commentary.Where(c => c.UserKey != currentUser?.UserKey), commentary.SingleOrDefault(c => c.UserKey == currentUser?.UserKey));
        }

        async Task<List<SectionSummary>> GetPartSectionsAsync(int partKey, /*bool includeWeapons, bool includePlays,*/ IUser? currentUser)
        {
            var ds = DataSource(currentUser);
            var filter = new { partKey };
            var sections = await ds.From("Sources.SectionDetail", filter).WithSorting("DisplayOrder").ToCollection<SectionSummary>().ExecuteAsync();

            foreach (var section in sections)
                section.Subsections.AddRange(sections.Where(x => x.ParentSectionKey == section.SectionKey));

            var result = sections.Where(x => x.ParentSectionKey == null).ToList();
            //foreach (var section in result)
            //    section.Depth = 0;

            return result;
        }

        async Task<(IList<SectionSummary> List, SectionSummary? PreviousPage, SectionSummary? NextPage, SectionSummary? Up, SectionSummary? NextSection, SectionSummary? PreviousSection, List<AppLink> BreadCrumb)> GetSubsectionsAsync(int partKey, int sectionKey, IUser? currentUser)
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
            var plays = await ds.From("Interpretations.PlayDetail", filter).ToCollection<PlaySummary>().ExecuteAsync();
            foreach (var section in sections)
                section.Plays.AddRange(plays.Where(x => x.SectionKey == section.SectionKey));
            //}

            //if (includeVideos)
            //{
            var videos = await ds.From("Interpretations.VideoDetail", filter).ToCollection<VideoSummary>().ExecuteAsync();
            foreach (var section in sections)
                section.Videos.AddRange(videos.Where(x => x.SectionKey == section.SectionKey));
            //}

            var flatList = Flatten(sections);
            var result = flatList.Single(x => x.SectionKey == sectionKey);
            var index = flatList.IndexOf(result);

            //foreach (var section in result.Subsections)
            //    section.Depth = 1;

            //Previous/Next page, regardless of depth
            var previousPage = (index > 0) ? flatList[index - 1] : null;
            var nextPage = (index < flatList.Count - 1) ? flatList[index + 1] : null;
            var up = (result.ParentSectionKey != null) ? flatList.Single(x => x.SectionKey == result.ParentSectionKey) : null;

            //Previous/Next at the same depth (e.g. chapters)
            IEnumerable<SectionSummary> mySiblings;
            if (up == null) //we're at the top
                mySiblings = sections.Where(s => s.ParentSectionKey == null).ToList();
            else
                mySiblings = up.Subsections;

            var previousSection = mySiblings.Where(s => s.DisplayOrder < result.DisplayOrder).OrderByDescending(s => s.DisplayOrder).FirstOrDefault();
            var nextSection = mySiblings.Where(s => s.DisplayOrder > result.DisplayOrder).OrderBy(s => s.DisplayOrder).FirstOrDefault();

            //Bread crumb
            var breadCrumb = new List<AppLink>();
            SectionSummary? current = up;

            while (current != null)
            {
                breadCrumb.Add(new AppLink() { Name = current.SectionName, UrlFragment = current.SectionUrlFragment });
                current = (current.ParentSectionKey != null) ? flatList.Single(x => x.SectionKey == current.ParentSectionKey) : null;
            }
            breadCrumb.Reverse();

            return (result.Subsections, previousPage, nextPage, up, previousSection, nextSection, breadCrumb);
        }

        /// <summary>
        /// Creates a flat list of sections in the correct order.
        /// </summary>
        /// <param name="sections">The sections.</param>
        /// <returns>List&lt;SectionSummary&gt;.</returns>
        List<SectionSummary> Flatten(List<SectionSummary> sections)
        {
            var result = new List<SectionSummary>(sections.Count);
            foreach (var section in sections.Where(s => s.ParentSectionKey == null))
            {
                AddWithChildern(section);
            }
            return result;

            /*************************/

            void AddWithChildern(SectionSummary section)
            {
                result.Add(section);
                foreach (var subsection in section.Subsections)
                {
                    AddWithChildern(subsection);
                }
            }
        }

        public async Task<SectionEdit> GetSectionEditAsync(string bookSlug, string partSlug, string sectionSlug, IUser? currentUser)
        {
            var ds = DataSource(currentUser);

            var section = (await ds.From("Sources.SectionDetail", new { bookSlug, partSlug, sectionSlug }).ToObject<SectionEdit>().ExecuteAsync())!; //Hack, NeverNull in Chain 3.1

            await CheckPermissionSectionAsync(section.SectionKey, currentUser);

            return section;
        }

        public async Task<List<SectionForLists>> PossibleParentsForSectionAsync(int partKey, int sectionKey, IUser? currentUser)
        {
            var ds = DataSource(currentUser);
            var filter = new { partKey };
            var sections = await ds.From("Sources.SectionDetail", filter).WithSorting("DisplayOrder").ToCollection<SectionForLists>().ExecuteAsync();

            foreach (var section in sections)
                section.Subsections.AddRange(sections.Where(x => x.ParentSectionKey == section.SectionKey));

            //flaten the list, but don't include the current section or it's children
            var result = new List<SectionForLists>(sections.Count);
            foreach (var section in sections.Where(s => s.ParentSectionKey == null && s.SectionKey != sectionKey))
            {
                section.Depth = 0;
                AddWithChildern(section, section.Depth + 1);
            }

            return result;

            /*************************/

            void AddWithChildern(SectionForLists section, int depth)
            {
                result.Add(section);
                foreach (var subsection in section.Subsections.Where(x => x.SectionKey != sectionKey))
                {
                    subsection.Depth = depth;
                    AddWithChildern(subsection, subsection.Depth + 1);
                }
            }
        }

        public async Task UpdateSectionEditAsync(SectionEdit newValues, IUser? currentUser)
        {
            var ds = DataSource(currentUser);

            var oldValues = (await ds.From("Sources.Section", new { newValues.SectionKey }).ToObject<SectionEdit>().ExecuteAsync())!; //Hack, NeverNull in Chain 3.1

            await CheckPermissionSectionAsync(oldValues.SectionKey, currentUser);
            if (oldValues.PartKey != newValues.PartKey)
                throw new InvalidOperationException("Cannot move section to a different part");

            if (string.IsNullOrWhiteSpace(newValues.PageReference))
                newValues.PageReference = null;

            await ds.Update("Sources.Section", newValues).ExecuteAsync();

            return;
        }

        public async Task<List<SectionForLists>> GetSectionsWithSameParentAsync(int partKey, int? parentSectionKey, IUser? currentUser)
        {
            var ds = DataSource(currentUser);
            if (parentSectionKey == null)
                return await ds.From("Sources.SectionDetail", new { partKey }).WithSorting("DisplayOrder").ToCollection<SectionForLists>().ExecuteAsync();
            else
                return await ds.From("Sources.SectionDetail", new { partKey, parentSectionKey }).WithSorting("DisplayOrder").ToCollection<SectionForLists>().ExecuteAsync();
        }
    }
}
