namespace HemaDrillBook.Models
{
    public class PlaySummary
    {
        public int PlayKey { get; set; }
        public int SectionKey { get; set; }
        public string? SectionName { get; set; }
        public string? SectionSlug { get; set; }
        public string? VariantName { get; set; }
        public string? PageReference { get; set; }
    }
}
