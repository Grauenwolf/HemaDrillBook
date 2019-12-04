using System;

namespace HemaDrillBook.Services.Search
{
    public class Target : SearchCriteria1
    {
        public int TargetKey { get; set; }
        public string? TargetName { get; set; }

        internal override int Key => TargetKey;
    }
}
