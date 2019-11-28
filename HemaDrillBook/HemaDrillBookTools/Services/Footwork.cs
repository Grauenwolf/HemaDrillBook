namespace HemaDrillBookTools.Services
{
    partial class Footwork : ITag
    {
        public string FootworkFullName => Formatter.MultiPart(FootworkName, AlternateFootworkName);

        public int? Key { get => FootworkKey; set => FootworkKey = value; }
        public string Name { get => FootworkName; set => FootworkName = value; }
        public string AlternateName { get => AlternateFootworkName; set => AlternateFootworkName = value; }
        public bool HasAlternateName => true;
    }
}
