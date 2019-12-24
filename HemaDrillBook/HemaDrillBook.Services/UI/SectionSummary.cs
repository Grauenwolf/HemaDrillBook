using System.Collections.Generic;
using System.Linq;

namespace HemaDrillBook.Services.UI
{
    public class SectionSummary
    {
        //private int m_Depth;
        //public int BookKey { get; set; }

        //[NotMapped]
        //public int Depth
        //{
        //    get => m_Depth;
        //    set
        //    {
        //        m_Depth = value;
        //        foreach (var section in Subsections)
        //            section.Depth = m_Depth + 1;
        //    }
        //}

        public string? SectionNameFull => Formatter.MultiPart(SectionName, PageReference);
        public string SectionUrlFragment => $"/b/{BookSlug}/p/{PartSlug}/s/{SectionSlug}";
        //public string PartUrlFragment => $"/b/{BookSlug}/p/{PartSlug}";
        //public string BookUrlFragment => $"/b/{BookSlug}";

        public string? PageReference { get; set; }
        public int? ParentSectionKey { get; set; }
        public int SectionKey { get; set; }
        public int CommentaryCount { get; set; }
        public string? SectionSlug { get; set; }
        public string? PartSlug { get; set; }
        public string? BookSlug { get; set; }
        public string? SectionName { get; set; }
        public SectionSummaryCollection Subsections { get; } = new SectionSummaryCollection();
        public int TotalVideoCount => VideoCount + Subsections.Sum(x => x.TotalVideoCount);
        public int TotalPlayCount => PlayCount + Subsections.Sum(x => x.TotalPlayCount);
        public int TotalCommentaryCount => CommentaryCount + Subsections.Sum(x => x.TotalCommentaryCount);

        public string FlairCounts
        {
            get
            {
                var results = new List<string>(3);

                var p = PlayCount;
                if (p == 1)
                    results.Add("1 Play");
                else if (p > 1)
                    results.Add(p + " Plays");

                var v = VideoCount;
                if (v == 1)
                    results.Add("1 Video");
                else if (v > 1)
                    results.Add(v + " Videos");

                var c = CommentaryCount;
                if (c == 1)
                    results.Add("1 Commentary");
                else if (c > 1)
                    results.Add(c + " Commentaries");

                if (results.Count > 0)
                    return "[" + string.Join(", ", results) + "]";
                else
                    return "";
            }
        }

        public string TotalFlairCounts
        {
            get
            {
                var results = new List<string>(3);

                var p = TotalPlayCount;
                if (p == 1)
                    results.Add("1 Play");
                else if (p > 1)
                    results.Add(p + " Plays");

                var v = TotalVideoCount;
                if (v == 1)
                    results.Add("1 Video");
                else if (v > 1)
                    results.Add(v + " Videos");

                var c = TotalCommentaryCount;
                if (c == 1)
                    results.Add("1 Commentary");
                else if (c > 1)
                    results.Add(c + " Commentaries");

                if (results.Count > 0)
                    return "[" + string.Join(", ", results) + "]";
                else
                    return "";
            }
        }

        public int VideoCount { get; set; }
        public int PlayCount { get; set; }

        //public List<WeaponPairSummary> Weapons { get; } = new List<WeaponPairSummary>();
        public List<PlaySummary> Plays { get; } = new List<PlaySummary>();

        public List<VideoSummary> Videos { get; } = new List<VideoSummary>();

        public float DisplayOrder { get; set; }
    }
}
