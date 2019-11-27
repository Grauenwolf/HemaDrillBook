using System;

namespace HemaDrillBook.Models
{
    public class BookNameMap
    {
        public BookNameMap(int? bookKey, string bookName, string bookSlug, string authorName)
        {
            if (string.IsNullOrEmpty(bookName))
                throw new ArgumentException($"{nameof(bookName)} is null or empty.", nameof(bookName));
            if (string.IsNullOrEmpty(bookSlug))
                throw new ArgumentException($"{nameof(bookSlug)} is null or empty.", nameof(bookSlug));
            if (string.IsNullOrEmpty(authorName))
                throw new ArgumentException($"{nameof(authorName)} is null or empty.", nameof(authorName));

            BookKey = bookKey;
            BookName = bookName;
            BookSlug = bookSlug;
            AuthorName = authorName;
        }

        public int? BookKey { get; set; }
        public string BookName { get; set; }
        public string BookSlug { get; set; }
        public string AuthorName { get; set; }
    }
}
