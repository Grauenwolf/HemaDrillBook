namespace HemaDrillBook.Services.UI
{
    public class WeaponPairSummary
    {
        //public int PrimaryWeaponKey { get; set; }
        public string? PrimaryWeaponName { get; set; }

        //public int? SecondaryWeaponKey { get; set; }
        public string? SecondaryWeaponName { get; set; }

        public string? WeaponFullName => (SecondaryWeaponName == null) ? PrimaryWeaponName : $"{PrimaryWeaponName} vs. {SecondaryWeaponName}";
    }
}
