using System.Collections.Generic;

namespace HemaDrillBook.Models
{
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
}
