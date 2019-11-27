using System;

namespace HemaDrillBook.Models
{
    public class WeaponPairSummary
    {
        public WeaponPairSummary(int primaryWeaponKey, string primaryWeaponName, int? secondaryWeaponKey, string? secondaryWeaponName)
        {
            if (string.IsNullOrEmpty(primaryWeaponName))
                throw new ArgumentException($"{nameof(primaryWeaponName)} is null or empty.", nameof(primaryWeaponName));

            PrimaryWeaponKey = primaryWeaponKey;
            PrimaryWeaponName = primaryWeaponName;
            SecondaryWeaponKey = secondaryWeaponKey;
            SecondaryWeaponName = secondaryWeaponName;
        }

        public int PrimaryWeaponKey { get; set; }
        public string PrimaryWeaponName { get; set; }
        public int? SecondaryWeaponKey { get; set; }
        public string? SecondaryWeaponName { get; set; }
    }
}
