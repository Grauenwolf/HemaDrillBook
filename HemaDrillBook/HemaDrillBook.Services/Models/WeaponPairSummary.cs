using System;

namespace HemaDrillBook.Models
{
    public class WeaponPairSectionSummary : WeaponPairSummary
    {
        public int SectionKey { get; set; }
    }

    public class WeaponPairSummary
    {
        public int PrimaryWeaponKey { get; set; }
        public string? PrimaryWeaponName { get; set; }
        public int? SecondaryWeaponKey { get; set; }
        public string? SecondaryWeaponName { get; set; }

        public string? WeaponNameFull => (SecondaryWeaponKey == null) ? PrimaryWeaponName : $"@({PrimaryWeaponName} vs. {SecondaryWeaponName}";
    }
}
