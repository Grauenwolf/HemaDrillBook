namespace HemaDrillBook.Services.Search
{
    public class Part : SearchCriteria1
    {
        public int PartKey { get; set; }
        public int BookKey { get; set; }
        public string? PartName { get; set; }

        internal override int Key => PartKey;
    }
}
