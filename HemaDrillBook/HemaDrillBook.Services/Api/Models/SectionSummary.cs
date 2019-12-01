using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace HemaDrillBook.Api.Models
{
    public class SectionSummary
    {
        private int m_Depth;
        public int BookKey { get; set; }

        [NotMapped]
        public int Depth
        {
            get => m_Depth;
            set
            {
                m_Depth = value;
                foreach (var section in Subsections)
                    section.Depth = m_Depth + 1;
            }
        }

        public string? SectionNameFull => string.IsNullOrEmpty(PageReference) ? SectionName : $"{SectionName} ({PageReference})";
        public string SectionUrlFragment => $"/b/{BookSlug}/p/{PartSlug}/s/{SectionSlug}";
        public string PartUrlFragment => $"/b/{BookSlug}/p/{PartSlug}";
        public string BookUrlFragment => $"/b/{BookSlug}";

        public string? PageReference { get; set; }
        public int? ParentSectionKey { get; set; }
        public int SectionKey { get; set; }
        public string? SectionSlug { get; set; }
        public string? PartSlug { get; set; }
        public string? BookSlug { get; set; }
        public string? SectionName { get; set; }
        public SectionSummaryCollection Subsections { get; } = new SectionSummaryCollection();
        //public int TotalVideoCount => VideoCount + Subsections.Sum(x => x.TotalVideoCount);
        //public int TotalPlayCount => PlayCount + Subsections.Sum(x => x.TotalPlayCount);
        //public int VideoCount { get; set; }
        //public int PlayCount { get; set; }

        public List<WeaponPairSummary> Weapons { get; } = new List<WeaponPairSummary>();
        public List<PlaySummary> Plays { get; } = new List<PlaySummary>();
        public List<VideoSummary> Videos { get; } = new List<VideoSummary>();

        public float DisplayOrder { get; set; }

        ///// <summary>
        ///// Determines whether this section contains the specified weapon.
        ///// </summary>
        ///// <param name="weaponKey">The weapon key.</param>
        ///// <param name="secondaryWeaponKey">The secondary weapon key. Optional.</param>
        ///// <returns><c>true</c> if the weapon was found in this section or any of its subsections.</returns>
        //public bool ContainsWeapon(int weaponKey, int? secondaryWeaponKey)
        //{
        //    if (secondaryWeaponKey == null)
        //    {
        //        if (Weapons.Any(x => x.PrimaryWeaponKey == weaponKey))
        //            return true;
        //    }
        //    else
        //    {
        //        if (Weapons.Any(x => x.PrimaryWeaponKey == weaponKey && x.SecondaryWeaponKey == secondaryWeaponKey))
        //            return true;
        //    }
        //    return Subsections.Any(x => x.ContainsWeapon(weaponKey, secondaryWeaponKey));
        //}

        //public string VideoPlayCount(int maxDepth)
        //{
        //    var parts = new List<string>();
        //    if (Depth <= maxDepth) //only show the local
        //    {
        //        if (PlayCount > 1)
        //        {
        //            parts.Add(PlayCount + " plays");
        //        }
        //        else if (PlayCount == 1)
        //        {
        //            parts.Add("1 play");
        //        }

        //        if (VideoCount > 1)
        //        {
        //            parts.Add(VideoCount + " videos");
        //        }
        //        else if (VideoCount == 1)
        //        {
        //            parts.Add("1 video");
        //        }
        //    }
        //    else
        //    {
        //        if (TotalPlayCount > 1)
        //        {
        //            parts.Add(TotalPlayCount + " plays");
        //        }
        //        else if (TotalPlayCount == 1)
        //        {
        //            parts.Add("1 play");
        //        }

        //        if (TotalVideoCount > 1)
        //        {
        //            parts.Add(TotalVideoCount + " videos");
        //        }
        //        else if (TotalVideoCount == 1)
        //        {
        //            parts.Add("1 video");
        //        }
        //    }

        //    if (parts.Count > 0)
        //        return " [" + string.Join(", ", parts) + "]";
        //    else
        //        return "";
        //}
    }
}
