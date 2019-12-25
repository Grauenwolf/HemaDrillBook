using HemaDrillBook.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Tortuga.Anchor;
using Tortuga.Chain;

namespace HemaDrillBook.Services.UI
{
    public class SectionService : ServiceBase
    {
        public SectionService(SqlServerDataSource dataSource) : base(dataSource)
        {
        }

        public async Task<int> AddVideoAsync(VideoInput video, IUser currentUser)
        {
            CheckPermissionLoggedIn(currentUser);

            if (video == null)
                throw new ArgumentNullException(nameof(video), $"{nameof(video)} is null.");
            if (video.Url == null)
                throw new ArgumentNullException(nameof(video), $"{nameof(video)}.{video.Url} is null.");

            //https://www.youtube.com/watch?v=6ISOK-XtvYs

            if (video.Url.Contains("www.youtube.com") || video.Url.Contains("youtu.be"))
            {
                var uri = new Uri(video.Url);
                var query = HttpUtility.ParseQueryString(uri.Query);

                if (query.AllKeys.Contains("v"))
                {
                    video.VideoServiceVideoId = query["v"];
                }
                else
                {
                    video.VideoServiceVideoId = uri.Segments.Last();
                }

                if (video.StartTime == null && query.AllKeys.Contains("t"))
                {
                    if (int.TryParse(query["t"], out var seconds))
                        video.StartTime = TimeSpan.FromSeconds(seconds);
                }

                video.VideoServiceKey = 1;
            }
            else if (video.Url.Contains("vimeo.com"))
            {
                var uri = new Uri(video.Url);
                video.VideoServiceVideoId = uri.Segments.Last();
                video.VideoServiceKey = 2;
            }
            else
            {
                video.VideoServiceKey = 0;
            }

            if (string.IsNullOrWhiteSpace(video.Description))
                video.Description = null;
            if (string.IsNullOrWhiteSpace(video.Url))
                video.Url = null;
            if (string.IsNullOrWhiteSpace(video.Author))
                video.Author = null;

            return await DataSource(currentUser).Insert("Interpretations.Video", video).ToInt32().ClearCache().ExecuteAsync();
        }

        public async Task CreateSectionAsync(SectionEdit newValues, IUser? currentUser)
        {
            var ds = DataSource(currentUser);

            await CheckPermissionPartAsync(newValues.PartKey, currentUser);

            if (newValues.ParentSectionKey.HasValue)
            {
                var parentPartKey = await ds.From("Sources.Section", new { SectionKey = newValues.ParentSectionKey }).ToInt32("PartKey").ExecuteAsync();
                if (parentPartKey != newValues.PartKey)
                    throw new InvalidOperationException("Parent Section is not in the same book/part as this section.");
            }

            if (string.IsNullOrWhiteSpace(newValues.PageReference))
                newValues.PageReference = null;

            await ds.Insert("Sources.Section", newValues).AsNonQuery().ClearCache().ExecuteAsync();

            return;
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

        public async Task<SectionDetail> GetSectionDetailAsync(string bookSlug, string partSlug, string sectionSlug, IUser? currentUser)
        {
            var ds = DataSource(currentUser);

            //Cannot cache this one because it has user commentary
            var section = (await ds.From("Sources.SectionDetail", new { bookSlug, partSlug, sectionSlug })
                .ToObject<SectionDetail>()
                .NeverNull()
                .ExecuteAsync());

            var (subsections, previousPage, nextPage, up, previousSection, nextSection, breadCrumb) = await GetSubsectionsAsync(section.PartKey, section.SectionKey, currentUser);

            var breadCrumbCopy = breadCrumb.ToList(); //needed to avoid fouling the cached copy
            breadCrumbCopy.Insert(0, new AppLink() { Name = section.PartName, UrlFragment = section.PartUrlFragment });
            breadCrumbCopy.Insert(0, new AppLink() { Name = section.BookName, UrlFragment = section.BookUrlFragment });
            section.Subsections.AddRange(subsections);
            section.PreviousPage = previousPage;
            section.NextPage = nextPage;
            section.Up = up;
            section.PreviousSection = previousSection;
            section.NextSection = nextSection;
            section.BreadCrumb = breadCrumbCopy;
            section.Videos.AddRange(await GetSectionVideosAsync(section.SectionKey, currentUser));
            section.Weapons.AddRange(await GetSectionWeaponsAsync(section.SectionKey, currentUser));
            section.Plays.AddRange(await GetPlayDetailsForSectionAsync(section.SectionKey, currentUser));
            section.Images.AddRange(await GetSectionImagesAsync(section.SectionKey, currentUser));

            var (commentaries, note) = await GetCommentaryDetailsForSectionAsync(section.SectionKey, currentUser);
            section.Commentary.AddRange(commentaries);
            section.MyCommentary = note;

            if (section.MyCommentary == null && currentUser?.UserKey != null)
                section.MyCommentary = new CommentarySummary() { SectionKey = section.SectionKey, UserKey = currentUser.UserKey.Value };

            return section;
        }

        public async Task<SectionEdit> GetSectionEditAsync(string bookSlug, string partSlug, string sectionSlug, IUser? currentUser)
        {
            var ds = DataSource(currentUser);

            var section = (await ds.From("Sources.SectionDetail", new { bookSlug, partSlug, sectionSlug }).ToObject<SectionEdit>().NeverNull().ExecuteAsync());

            if (section.SectionKey.HasValue)
                await CheckPermissionSectionAsync(section.SectionKey.Value, currentUser);
            else
                await CheckPermissionPartAsync(section.PartKey, currentUser);

            return section;
        }

        public async Task<List<SectionForLists>> PossibleParentsForSectionAsync(int partKey, int? sectionKey, IUser? currentUser)
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

        public async Task UpdateCommentaryAsync(CommentaryInput commentaryInput, IUser currentUser)
        {
            commentaryInput.UserKey = currentUser.UserKey!.Value;
            //Hack: Why is UserKey nullable?
            //Hack: Chain fails to Upsert when there are multiple PKs and one of them comes from the current user instead of the model

            //Null out empty string.
            if (commentaryInput.PublicNotes == "") commentaryInput.PublicNotes = null;
            if (commentaryInput.PrivateNotes == "") commentaryInput.PrivateNotes = null;

            //Don't need to clear the cache because we don't cache commentary
            await DataSource(currentUser).Upsert("Interpretations.Commentary", commentaryInput).ExecuteAsync();
        }

        public async Task UpdateSectionEditAsync(SectionEdit newValues, IUser? currentUser)
        {
            var ds = DataSource(currentUser);

            var oldValues = (await ds.From("Sources.Section", new { newValues.SectionKey }).ToObject<SectionEdit>().NeverNull().ExecuteAsync());

            await CheckPermissionSectionAsync(oldValues.SectionKey!.Value, currentUser);
            if (oldValues.PartKey != newValues.PartKey)
                throw new InvalidOperationException("Cannot move section to a different book/part.");

            if (newValues.ParentSectionKey.HasValue)
            {
                var parentPartKey = await ds.From("Sources.Section", new { SectionKey = newValues.ParentSectionKey }).ToInt32("PartKey").ExecuteAsync();
                if (parentPartKey != newValues.PartKey)
                    throw new InvalidOperationException("Parent Section is not in the same book/part as this section.");
            }

            if (string.IsNullOrWhiteSpace(newValues.PageReference))
                newValues.PageReference = null;

            await ds.Update("Sources.Section", newValues).AsNonQuery().ClearCache().ExecuteAsync();

            return;
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

        async Task<List<PlayDetail>> GetPlayDetailsForSectionAsync(int sectionKey, IUser? currentUser)
        {
            var ds = DataSource(currentUser);
            var cacheKey = $"{nameof(SectionService)}.{nameof(GetPlayDetailsForSectionAsync)}:{sectionKey}";
            var cachedResult = await ds.Cache.TryReadAsync<List<PlayDetail>>(cacheKey);
            if (cachedResult.KeyFound)
                return cachedResult.Value;

            var filter = new { sectionKey };
            var dataSource = DataSource(currentUser);
            var plays = await dataSource.From("Interpretations.PlayDetail", filter)
                .WithSorting("VariantName")
                .ToCollection<PlayDetail>()
                .ExecuteAsync();

            var steps = await dataSource.From("Interpretations.PlayStepDetail", filter)
                .WithSorting("PlayKey", "TempoNumber", "Actor")
                .ToCollection<PlayStepDetail>()
                .ExecuteAsync();

            foreach (var play in plays)
                play.Steps.AddRange(steps.Where(x => x.PlayKey == play.PlayKey));

            await ds.Cache.WriteAsync(cacheKey, plays, DefaultCachePolicy());

            return plays;
        }

        Task<List<SectionDetail.ImageSummary>> GetSectionImagesAsync(int sectionKey, IUser? currentUser)
        {
            return DataSource(currentUser)
                .From("Images.ImageSectionMapDetail", new { SectionKey = sectionKey })
                .WithSorting(new SortExpression("IsPrimaryImage", SortDirection.Descending), new SortExpression("ImageName", SortDirection.Ascending))
                .ToCollection<SectionDetail.ImageSummary>()
                .ReadOrCache($"{nameof(SectionService)}.{nameof(GetSectionImagesAsync)}:{sectionKey}", DefaultCachePolicy())
                .ExecuteAsync();
        }

        Task<List<SectionDetail.VideoSummary>> GetSectionVideosAsync(int sectionKey, IUser? currentUser)
        {
            return DataSource(currentUser)
                .From("Interpretations.VideoDetail", new { SectionKey = sectionKey })
                .WithSorting(new SortExpression("ModifiedDate", SortDirection.Descending))
                .ToCollection<SectionDetail.VideoSummary>()
                .ReadOrCache($"{nameof(SectionService)}.{nameof(GetSectionVideosAsync)}:{sectionKey}", DefaultCachePolicy())
                .ExecuteAsync();
        }

        Task<List<WeaponPairSummary>> GetSectionWeaponsAsync(int sectionKey, IUser? currentUser)
        {
            return DataSource(currentUser)
                .From("Sources.SectionWeaponMapDetail", new { SectionKey = sectionKey })
                .WithSorting("PrimaryWeaponName", "SecondaryWeaponName")
                .ToCollection<WeaponPairSummary>()
                .ReadOrCache($"{nameof(SectionService)}.{nameof(GetSectionWeaponsAsync)}:{sectionKey}", DefaultCachePolicy())
                .ExecuteAsync();
        }

        async Task<SubsectionsResult> GetSubsectionsAsync(int partKey, int sectionKey, IUser? currentUser)
        {
            var ds = DataSource(currentUser);
            var cacheKey = $"{nameof(SectionService)}.{nameof(GetSubsectionsAsync)}:{partKey}:{sectionKey}";
            var cachedResult = await ds.Cache.TryReadAsync<SubsectionsResult>(cacheKey);
            if (cachedResult.KeyFound)
                return cachedResult.Value;

            //This could be more efficient using a recursive CTE

            var filter = new { partKey };
            var sections = await ds.From("Sources.SectionDetail", filter)
                .WithSorting("DisplayOrder")
                .ToCollection<SectionSummary>()
                .ExecuteAsync();

            foreach (var section in sections)
                section.Subsections.AddRange(sections.Where(x => x.ParentSectionKey == section.SectionKey));

            var plays = await ds.From("Interpretations.PlayDetail", filter).ToCollection<PlaySummary>().ExecuteAsync();
            foreach (var section in sections)
                section.Plays.AddRange(plays.Where(x => x.SectionKey == section.SectionKey));

            var videos = await ds.From("Interpretations.VideoDetail", filter).ToCollection<VideoSummary>().ExecuteAsync();
            foreach (var section in sections)
                section.Videos.AddRange(videos.Where(x => x.SectionKey == section.SectionKey));

            var flatList = Flatten(sections);
            var result = flatList.Single(x => x.SectionKey == sectionKey);
            var index = flatList.IndexOf(result);

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

            var finalResult = new SubsectionsResult(result.Subsections, previousPage, nextPage, up, previousSection, nextSection, breadCrumb);
            await ds.Cache.WriteAsync(cacheKey, finalResult, DefaultCachePolicy());

            return finalResult;
        }

        class SubsectionsResult
        {
            public SubsectionsResult(IList<SectionSummary> list, SectionSummary? previousPage, SectionSummary? nextPage, SectionSummary? up, SectionSummary? nextSection, SectionSummary? previousSection, List<AppLink> breadCrumb)
            {
                List = list;
                PreviousPage = previousPage;
                NextPage = nextPage;
                Up = up;
                NextSection = nextSection;
                PreviousSection = previousSection;
                BreadCrumb = breadCrumb;
            }

            public List<AppLink> BreadCrumb { get; set; }

            public IList<SectionSummary> List { get; set; }

            public SectionSummary? NextPage { get; set; }

            public SectionSummary? NextSection { get; set; }

            public SectionSummary? PreviousPage { get; set; }

            public SectionSummary? PreviousSection { get; set; }

            public SectionSummary? Up { get; set; }

            public void Deconstruct(out IList<SectionSummary> list, out SectionSummary? previousPage, out SectionSummary? nextPage, out SectionSummary? up, out SectionSummary? nextSection, out SectionSummary? previousSection, out List<AppLink> breadCrumb)
            {
                list = List;
                previousPage = PreviousPage;
                nextPage = NextPage;
                up = Up;
                nextSection = NextSection;
                previousSection = PreviousSection;
                breadCrumb = BreadCrumb;
            }
        }
    }
}
