namespace HemaDrillBookTools.Services
{
    partial class Target : ITag
    {
        //public string TargetFullName => Formatter.MultiPart(TargetName, AlternateTargetName);

        public int? Key { get => TargetKey; set => TargetKey = value; }
        public string Name { get => TargetName; set => TargetName = value; }

        //string ITag.AlternateName { get => AlternateTargetName; set => AlternateTargetName = value; }
        public string AlternateName { get; set; }

        public bool HasAlternateName => false;
    }
}
