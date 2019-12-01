namespace HemaDrillBook.UI.Models
{
    public class BookNameMap
    {
        public string BookUrlFragment => $"/b/{BookSlug}";

        //public int BookKey { get; set; }
        public string? BookName { get; set; }

        public string? BookSlug { get; set; }
        public string? AuthorName { get; set; }
    }
}
