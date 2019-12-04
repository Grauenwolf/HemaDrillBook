using System;

namespace HemaDrillBook.Services.Search
{
    public class Footwork : SearchCriteria1
    {
        public int FootworkKey { get; set; }
        public string? FootworkName { get; set; }
        public string? AlternateFootworkName { get; set; }

        internal override int Key => FootworkKey;

        public string? FootworkFullName => Formatter.MultiPart(FootworkName, AlternateFootworkName);
    }
}
