using System.Collections.Generic;

namespace HemaDrillBook.Models
{
    public class PartDetail

    {
        public int BookKey { get; set; }
        public string? BookName { get; set; }
        public string? BookSlug { get; set; }

        public PartSummary? Next { get; set; }

        public PartSummary? Previous { get; set; }

        public int PartKey { get; set; }
        public string? PartName { get; set; }
        public string? PartSlug { get; set; }

        public List<SectionSummary> Sections { get; } = new List<SectionSummary>();
        public List<PlaySummary> Plays { get; } = new List<PlaySummary>();
        public List<WeaponPairSummary> Weapons { get; } = new List<WeaponPairSummary>();
    }
}
