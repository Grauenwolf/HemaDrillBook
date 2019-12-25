using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace HemaDrillBook.Services.UI
{
    //public class ImageDetail
    //{
    //    public SectionSummaryCollection Sections { get; } = new SectionSummaryCollection();

    //}

    public class PartDetail

    {
        public string PartUrlFragment => $"/b/{BookSlug}/p/{PartSlug}";
        public string BookUrlFragment => $"/b/{BookSlug}";

        public int BookKey { get; set; }
        public string? BookName { get; set; }
        public string? BookSlug { get; set; }

        [NotMapped]
        public PartSummary? NextPart { get; set; }

        [NotMapped]
        public PartSummary? PreviousPart { get; set; }

        public int PartKey { get; set; }
        public string? PartName { get; set; }
        public string? PartSlug { get; set; }

        public SectionSummaryCollection Sections { get; } = new SectionSummaryCollection();
        public List<PlaySummary> Plays { get; } = new List<PlaySummary>();
        public List<VideoSummary> Videos { get; } = new List<VideoSummary>();
        public List<WeaponPairSummary> Weapons { get; } = new List<WeaponPairSummary>();
    }
}
