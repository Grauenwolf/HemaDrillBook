namespace HemaDrillBook.Services.Search
{
    public class Book : SearchCriteria1
    {
        public int BookKey { get; set; }
        public string? BookName { get; set; }

        internal override int Key => BookKey;
    }
}
