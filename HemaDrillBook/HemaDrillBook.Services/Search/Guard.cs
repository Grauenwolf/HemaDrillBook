namespace HemaDrillBook.Services.Search
{
    public class Guard : SearchCriteria2
    {
        public int GuardKey { get; set; }
        public int? GuardModifierKey { get; set; }
        public string? GuardName { get; set; }
        public string? AlternateGuardName { get; set; }
        public string? GuardModifierName { get; set; }

        internal override int Key1 => GuardKey;

        internal override int? Key2 => GuardModifierKey;

        public string? GuardFullName => Formatter.MultiPart(GuardName, AlternateGuardName, GuardModifierName);
    }
}
