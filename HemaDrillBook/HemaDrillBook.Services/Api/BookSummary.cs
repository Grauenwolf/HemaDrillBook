namespace HemaDrillBook.Services.Api
{
    public class BookSummary
    {
        public int BookKey { get; set; }
        public string? BookName { get; set; }
        public string? BookSlug { get; set; }
        public string? Notes { get; set; }
    }
}
