﻿namespace HemaDrillBook.Services.UI
{
    public class PlaySummary
    {
        public string SectionUrlFragment => $"/b/{BookSlug}/p/{PartSlug}/s/{SectionSlug}/t/plays#Play_{PlayKey}";

        public int PlayKey { get; set; }
        public int SectionKey { get; set; }
        public string? SectionName { get; set; }
        public string? SectionSlug { get; set; }
        public string? PartSlug { get; set; }
        public string? BookSlug { get; set; }
        public string? VariantName { get; set; }
        public string? PageReference { get; set; }

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
