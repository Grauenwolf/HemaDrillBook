using System.Collections.Generic;

namespace HemaDrillBook.Services.Api
{
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
