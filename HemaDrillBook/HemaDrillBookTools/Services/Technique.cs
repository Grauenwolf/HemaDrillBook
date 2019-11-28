namespace HemaDrillBookTools.Services
{
    partial class Technique : ITag
    {
        public string TechniqueFullName => Formatter.MultiPart(TechniqueName, AlternateTechniqueName);

        public int? Key { get => TechniqueKey; set => TechniqueKey = value; }
        public string Name { get => TechniqueName; set => TechniqueName = value; }
        public string AlternateName { get => AlternateTechniqueName; set => AlternateTechniqueName = value; }
        public bool HasAlternateName => true;
    }
}
