using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace HemaDrillBook.Models
{
    public class SectionDetail
    {
        public string SectionUrlFragment => $"/b/{BookSlug}/p/{PartSlug}/s/{SectionSlug}";
        public string PartUrlFragment => $"/b/{BookSlug}/p/{PartSlug}";
        public string BookUrlFragment => $"/b/{BookSlug}";

        public int BookKey { get; set; }
        public string? BookName { get; set; }

        //public bool CanEdit { get; set; }
        [NotMapped]
        public SectionSummary? Next { get; set; }

        public string? PageReference { get; set; }
        public int? ParentSectionKey { get; set; }
        public int PartKey { get; set; }
        public string? PartName { get; set; }
        public string? BookSlug { get; set; }
        public string? PartSlug { get; set; }
        public string? SectionSlug { get; set; }

        public List<PlayDetail> Plays { get; } = new List<PlayDetail>();

        [NotMapped]
        public SectionSummary? Previous { get; set; }

        public int SectionKey { get; set; }
        public string? SectionName { get; set; }
        public SectionSummaryCollection Subsections { get; } = new SectionSummaryCollection();

        [NotMapped]
        public SectionSummary? Up { get; set; }

        public int TotalPlayCount => Plays.Count + Subsections.ChildPlays().Count();

        //public List<SectionTranslationDetail> Translations { get; } = new List<SectionTranslationDetail>();
        //public int VideoCount { get; set; }
        //public List<Video> Videos { get; } = new List<Video>();
        public List<WeaponPairSummary> Weapons { get; } = new List<WeaponPairSummary>();
    }
}
