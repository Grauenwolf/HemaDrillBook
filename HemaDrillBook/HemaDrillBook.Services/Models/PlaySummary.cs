namespace HemaDrillBook.Models
{
    public class PlaySummary
    {
        public string SectionUrlFragment => $"/b/{BookSlug}/p/{PartSlug}/s/{SectionSlug}";

        public int PlayKey { get; set; }
        public int SectionKey { get; set; }
        public string? SectionName { get; set; }
        public string? SectionSlug { get; set; }
        public string? PartSlug { get; set; }
        public string? BookSlug { get; set; }
        public string? VariantName { get; set; }
        public string? PageReference { get; set; }

        string? PlayName => VariantName ?? SectionName;

        public string? PlayNameFull => string.IsNullOrEmpty(PageReference) ? PlayName : $"{PlayName} ({PageReference})";
    }
}
