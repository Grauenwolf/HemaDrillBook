using System.Collections.Generic;

namespace HemaDrillBook.Services.UI
{
    public class PartSummary
    {
        public int PartKey { get; set; }
        public string? PartName { get; set; }
        public string? PartSlug { get; set; }
        public string? BookSlug { get; set; }

        public string PartUrlFragment => $"/b/{BookSlug}/p/{PartSlug}";
        //public string BookUrlFragment => $"/b/{BookSlug}";

        public int VideoCount { get; set; }
        public int PlayCount { get; set; }
        public int CommentaryCount { get; set; }

        public string TotalFlairCounts
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
    }
}
