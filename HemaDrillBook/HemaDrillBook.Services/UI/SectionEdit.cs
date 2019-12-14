using System.ComponentModel.DataAnnotations.Schema;

namespace HemaDrillBook.Services.UI
{
    public class SectionEdit
    {
        public float DisplayOrder { get; set; }

        [NotMapped]
        public string? ErrorDisplay { get; set; }

        public string? PageReference { get; set; }
        public int PartKey { get; set; }
        public int SectionKey { get; set; }
        public string? SectionName { get; set; }

        [NotMapped]
        public string? SectionNameFull => Formatter.MultiPart(SectionName, PageReference);

        public string? SectionSlug { get; set; }
    }
}
