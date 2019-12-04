namespace HemaDrillBook.Services.Search
{
    public class SearchResult
    {
        public int BookKey { get; set; }
        public int PartKey { get; set; }
        public int SectionKey { get; set; }
        public string? BookName { get; set; }
        public string? PartName { get; set; }
        public string? SectionName { get; set; }
        public string? VariantName { get; set; }
        public string? BookSlug { get; set; }
        public string? PartSlug { get; set; }
        public string? SectionSlug { get; set; }
        public string? PageReference { get; set; }

        public string SectionUrlFragment => $"/b/{BookSlug}/p/{PartSlug}/s/{SectionSlug}";

        public string? PlayFullName
        {
            get
            {
                if (!string.IsNullOrEmpty(PageReference))
                {
                    if (!string.IsNullOrEmpty(VariantName))
                        return $"{$"{SectionName} ({PageReference})"}: {VariantName}";

                    return $"{SectionName} ({PageReference})";
                }
                else
                {
                    if (!string.IsNullOrEmpty(VariantName))
                        return $"{SectionName}: {VariantName}";

                    return SectionName;
                }
            }
        }
    }
}
