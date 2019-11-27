using System;

namespace HemaDrillBook.Models
{
    public class PartSummary
    {
        public PartSummary(int partKey, string partName, string partSlug)
        {
            if (string.IsNullOrEmpty(partName))
                throw new ArgumentException($"{nameof(partName)} is null or empty.", nameof(partName));
            if (string.IsNullOrEmpty(partSlug))
                throw new ArgumentException($"{nameof(partSlug)} is null or empty.", nameof(partSlug));

            PartKey = partKey;
            PartName = partName;
            PartSlug = partSlug;
        }

        public int PartKey { get; set; }
        public string PartName { get; set; }
        public string PartSlug { get; set; }
    }
}
