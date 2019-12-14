using HemaDrillBook.Services;
using HemaDrillBook.Services.UI;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace HemaDrillBook.Services.UI
{
    public class SectionDetail
    {
        public string SectionUrlFragment => $"/b/{BookSlug}/p/{PartSlug}/s/{SectionSlug}";
        public string PartUrlFragment => $"/b/{BookSlug}/p/{PartSlug}";
        public string BookUrlFragment => $"/b/{BookSlug}";

        //public int BookKey { get; set; }
        public string? BookName { get; set; }

        //public bool CanEdit { get; set; }

        /// <summary>
        /// Gets or sets the next section, which may be at any depth.
        /// </summary>
        /// <value>The next page.</value>
        [NotMapped]
        public SectionSummary? NextPage { get; set; }

        /// <summary>
        /// Gets or sets the next section at the same depth.
        /// </summary>
        /// <value>The next section.</value>
        [NotMapped]
        public SectionSummary? NextSection { get; set; }

        //public string? PageReference { get; set; }
        //public int? ParentSectionKey { get; set; }
        public int PartKey { get; set; }

        public string? PartName { get; set; }
        public string? BookSlug { get; set; }
        public string? PartSlug { get; set; }
        public string? SectionSlug { get; set; }

        public List<PlayDetail> Plays { get; } = new List<PlayDetail>();
        public List<CommentarySummary> Commentary { get; } = new List<CommentarySummary>();

        public int CommentaryCount => Commentary.Count + ((MyCommentary?.PublicNotes != null) ? 1 : 0);

        [NotMapped]
        public CommentarySummary? MyCommentary { get; set; }

        /// <summary>
        /// Gets or sets the previous section, which may be at any depth.
        /// </summary>
        /// <value>The previous page.</value>
        [NotMapped]
        public SectionSummary? PreviousPage { get; set; }

        /// <summary>
        /// Gets or sets the previous section at the same depth.
        /// </summary>
        /// <value>The previous section.</value>
        [NotMapped]
        public SectionSummary? PreviousSection { get; set; }

        public int SectionKey { get; set; }
        public string? SectionName { get; set; }

        public string? PageReference { get; set; }

        public string? SectionNameFull => Formatter.MultiPart(SectionName, PageReference);

        public SectionSummaryCollection Subsections { get; } = new SectionSummaryCollection();

        [NotMapped]
        public SectionSummary? Up { get; set; }

        public int TotalPlayCount => Plays.Count + Subsections.ChildPlays().Count();
        public int TotalVideoCount => Videos.Count + Subsections.ChildVideos().Count();

        //public List<SectionTranslationDetail> Translations { get; } = new List<SectionTranslationDetail>();
        //public int VideoCount { get; set; }
        public List<VideoDetail> Videos { get; } = new List<VideoDetail>();

        public List<WeaponPairSummary> Weapons { get; } = new List<WeaponPairSummary>();

        [NotMapped]
        public List<AppLink> BreadCrumb { get; set; } = new List<AppLink>();
    }
}
