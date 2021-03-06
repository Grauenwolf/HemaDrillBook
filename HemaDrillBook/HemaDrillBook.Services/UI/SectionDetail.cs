﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace HemaDrillBook.Services.UI
{
    public class SectionDetail
    {
        public string? BookName { get; set; }

        public string? BookSlug { get; set; }
        public string BookUrlFragment => $"/b/{BookSlug}";

        [NotMapped]
        public List<AppLink> BreadCrumb { get; set; } = new List<AppLink>();

        public List<CommentarySummary> Commentary { get; } = new List<CommentarySummary>();
        public int CommentaryCount => Commentary.Count + ((MyCommentary?.PublicNotes != null) ? 1 : 0);
        public List<ImageSummary> Images { get; } = new List<ImageSummary>();

        [NotMapped]
        public CommentarySummary? MyCommentary { get; set; }

        /// <summary>
        /// Gets or sets the next section, which may be at any depth.
        /// </summary>
        /// <value>The next page.</value>
        [NotMapped]
        public SectionSummary? NextPage { get; set; }

        //public bool CanEdit { get; set; }
        /// <summary>
        /// Gets or sets the next section at the same depth.
        /// </summary>
        /// <value>The next section.</value>
        [NotMapped]
        public SectionSummary? NextSection { get; set; }

        public string? PageReference { get; set; }

        public int PartKey { get; set; }

        public string? PartName { get; set; }
        public string? PartSlug { get; set; }
        public string PartUrlFragment => $"/b/{BookSlug}/p/{PartSlug}";
        public List<PlayDetail> Plays { get; } = new List<PlayDetail>();

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

        public string? PrimaryImageFileName { get; set; }
        public string? PrimaryImageName { get; set; }
        public int? PrimaryImageKey { get; set; }
        public int SectionKey { get; set; }
        public string? SectionName { get; set; }
        public string? SectionNameFull => Formatter.MultiPart(SectionName, PageReference);
        public string? SectionSlug { get; set; }
        public string SectionUrlFragment => $"/b/{BookSlug}/p/{PartSlug}/s/{SectionSlug}";
        public SectionSummaryCollection Subsections { get; } = new SectionSummaryCollection();

        public int TotalPlayCount => Plays.Count + Subsections.ChildPlays().Count();

        public int TotalVideoCount => Videos.Count + Subsections.ChildVideos().Count();

        [NotMapped]
        public SectionSummary? Up { get; set; }

        public List<VideoSummary> Videos { get; } = new List<VideoSummary>();

        public List<WeaponPairSummary> Weapons { get; } = new List<WeaponPairSummary>();

        public class ImageSummary
        {
            public int ImageKey { get; set; }
            public string? ImageName { get; set; }
            public bool IsPrimaryImage { get; set; }
            public string? StorageFileName { get; set; }
        }

        public class VideoSummary
        {
            public string? Description { get; set; }
            public TimeSpan? StartTime { get; set; }

            public string? Url { get; set; }

            public int VideoServiceKey { get; set; }

            public string? VideoServiceVideoId { get; set; }
        }
    }
}
