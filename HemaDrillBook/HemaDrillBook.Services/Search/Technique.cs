namespace HemaDrillBook.Services.Search
{
    public class Technique : SearchCriteria1
    {
        public int TechniqueKey { get; set; }
        public string? TechniqueName { get; set; }
        public string? AlternateTechniqueName { get; set; }
        internal override int Key => TechniqueKey;

        public string? TechniqueFullName => Formatter.MultiPart(TechniqueName, AlternateTechniqueName);
    }
}
