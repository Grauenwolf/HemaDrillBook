using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace HemaDrillBook.Services.UI
{
    public class SectionForLists
    {
        public int SectionKey { get; set; }
        public string? SectionNameWithPrefix => new string('_', Depth) + Formatter.MultiPart(SectionName, PageReference);
        public string? SectionNameFull => Formatter.MultiPart(SectionName, PageReference);
        public string? PageReference { get; set; }
        public string? SectionName { get; set; }
        public List<SectionForLists> Subsections { get; } = new List<SectionForLists>();
        public int? ParentSectionKey { get; set; }

        [NotMapped]
        public int Depth { get; set; }

        public float DisplayOrder { get; set; }
    }
}
