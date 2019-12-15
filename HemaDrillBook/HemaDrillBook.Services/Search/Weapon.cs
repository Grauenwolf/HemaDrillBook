namespace HemaDrillBook.Services.Search
{
    public class Weapon : SearchCriteria2
    {
        public int PrimaryWeaponKey { get; set; }
        public string? PrimaryWeaponName { get; set; }
        public int? SecondaryWeaponKey { get; set; }
        public string? SecondaryWeaponName { get; set; }
        internal override int Key1 => PrimaryWeaponKey;
        internal override int? Key2 => SecondaryWeaponKey;

        public string? WeaponFullName => (SecondaryWeaponName == null) ? PrimaryWeaponName : $"{PrimaryWeaponName} vs. {SecondaryWeaponName}";
    }
}
