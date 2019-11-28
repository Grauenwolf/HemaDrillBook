namespace HemaDrillBookTools.Services
{
    partial class Guard : ITag
    {
        public string GuardFullName => Formatter.MultiPart(GuardName, AlternateGuardName);

        public int? Key { get => GuardKey; set => GuardKey = value; }
        public string Name { get => GuardName; set => GuardName = value; }
        public string AlternateName { get => AlternateGuardName; set => AlternateGuardName = value; }

        public bool HasAlternateName => true;
    }
}
