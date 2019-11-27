using System.Collections.Generic;

namespace HemaDrillBook.Models
{
    public class SectionDetail
    {
        public int BookKey { get; set; }
        public string? BookName { get; set; }

        //public bool CanEdit { get; set; }
        public SectionSummary? Next { get; set; }

        public string? PageReference { get; set; }
        public int? ParentSectionKey { get; set; }
        public int PartKey { get; set; }
        public string? PartName { get; set; }

        //public List<PlayDetail> Plays { get; } = new List<PlayDetail>();
        public SectionSummary? Previous { get; set; }

        public int SectionKey { get; set; }
        public string? SectionName { get; set; }
        public List<SectionSummary> Subsections { get; } = new List<SectionSummary>();
        public SectionSummary? Up { get; set; }

        //public int TotalPlayCount => Plays.Count + Subsections.Sum(x => x.TotalPlayCount);
        //public List<SectionTranslationDetail> Translations { get; } = new List<SectionTranslationDetail>();
        //public int VideoCount { get; set; }
        //public List<Video> Videos { get; } = new List<Video>();
        public List<WeaponPairSummary> Weapons { get; } = new List<WeaponPairSummary>();
    }
}
