using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace HemaDrillBook.Services.UI
{
    public class ImageDetail
    {
        public string? ImageName { get; set; }
        public List<SectionSummary> Sections { get; } = new List<SectionSummary>();
        public string? StorageFileName { get; set; }

        public class SectionSummary
        {
            public string? BookSlug { get; set; }
            public string? PageReference { get; set; }
            public string? PartSlug { get; set; }
            public string? SectionName { get; set; }
            public bool IsPrimaryImage { get; set; }
            public string? SectionNameFull => Formatter.MultiPart(SectionName, PageReference);
            public string? SectionSlug { get; set; }
            public string SectionUrlFragment => $"/b/{BookSlug}/p/{PartSlug}/s/{SectionSlug}";
        }

        [NotMapped] public string? StorageBaseUrl { get; set; }
        [NotMapped] public string? ImageStorageContainer { get; set; }
        [NotMapped] public string? ThumbnailStorageContainer { get; set; }

        public string LinkUrl => StorageBaseUrl + "/" + ImageStorageContainer + "/" + StorageFileName;
        public string ThumbnailUrl => StorageBaseUrl + "/" + ThumbnailStorageContainer + "/" + StorageFileName;
    }
}
