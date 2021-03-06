﻿namespace HemaDrillBook.Services.UI
{
    public class WeaponPairSummary
    {
        public string? PrimaryWeaponName { get; set; }

        public string? SecondaryWeaponName { get; set; }

        public string? WeaponFullName => (SecondaryWeaponName == null) ? PrimaryWeaponName : $"{PrimaryWeaponName} vs. {SecondaryWeaponName}";
    }
}
