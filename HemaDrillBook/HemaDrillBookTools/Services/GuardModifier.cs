namespace HemaDrillBookTools.Services
{
    partial class GuardModifier : ITag
    {
        public int? Key { get => GuardModifierKey; set => GuardModifierKey = value; }
        public string Name { get => GuardModifierName; set => GuardModifierName = value; }
        public string AlternateName { get; set; } //ignored
        public bool HasAlternateName => false;
    }
}
