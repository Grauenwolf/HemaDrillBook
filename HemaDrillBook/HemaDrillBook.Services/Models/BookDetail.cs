using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace HemaDrillBook.Models
{
    public class Play
    {
        public int? AGuardKey { get; set; }
        public int? AGuardModifierKey { get; set; }
        public int? MeasureKey { get; set; }
        public int? PGuardKey { get; set; }
        public int? PGuardModifierKey { get; set; }
        public int? PlayKey { get; set; }
        public int SectionKey { get; set; }

        [NotMapped]
        public List<PlayStep> Steps { get; set; } = new List<PlayStep>();

        public string? VariantName { get; set; }
    }

    public class PlayStep
    {
        public char Actor { get; set; }
        public int? FootworkKey { get; set; }
        public int? GuardKey { get; set; }
        public int? GuardModifierKey { get; set; }
        public int? IntermediateGuardKey { get; set; }
        public int? IntermediateGuardModifierKey { get; set; }
        public string? Notes { get; set; }
        public int? PlayKey { get; set; }
        public int? TargetKey1 { get; set; }
        public int? TargetKey2 { get; set; }
        public int? TargetKey3 { get; set; }
        public int? TechniqueKey1 { get; set; }
        public int? TechniqueKey2 { get; set; }
        public int? TechniqueKey3 { get; set; }
        public int TempoNumber { get; set; }
    }

    public class BookSummary
    {
        public int BookKey { get; set; }
        public string? BookName { get; set; }
        public string? BookSlug { get; set; }
        public string? Notes { get; set; }
    }

    public class BookDetail
    {
        public string BookUrlFragment => $"/b/{BookSlug}";

        public int BookKey { get; set; }
        public string? BookName { get; set; }
        public string? BookSlug { get; set; }
        public string? Notes { get; set; }
        public string? WiktenauerUrl { get; set; }

        public List<string> AlternateNames { get; } = new List<string>();
        public List<AuthorSummary> Authors { get; } = new List<AuthorSummary>();
        public List<PartSummary> Parts { get; } = new List<PartSummary>();
        public List<WeaponPairSummary> Weapons { get; } = new List<WeaponPairSummary>();
    }

    public class BookDetailWithSections
    {
        public string BookUrlFragment => $"/b/{BookSlug}";

        public int BookKey { get; set; }
        public string? BookName { get; set; }
        public string? BookSlug { get; set; }
        public string? Notes { get; set; }
        public string? WiktenauerUrl { get; set; }

        public List<string> AlternateNames { get; } = new List<string>();
        public List<AuthorSummary> Authors { get; } = new List<AuthorSummary>();
        public List<PartDetail> Parts { get; } = new List<PartDetail>();
        public List<WeaponPairSummary> Weapons { get; } = new List<WeaponPairSummary>();
    }
}
