using System;

namespace HemaDrillBook.Models
{
    public class BookDetail
    {
        public BookDetail(int bookKey, string bookName, string bookSlug, string? notes, string? wiktenauerUrl)
        {
            if (string.IsNullOrEmpty(bookName))
                throw new ArgumentException($"{nameof(bookName)} is null or empty.", nameof(bookName));

            if (string.IsNullOrEmpty(bookSlug))
                throw new ArgumentException($"{nameof(bookSlug)} is null or empty.", nameof(bookSlug));

            BookKey = bookKey;
            BookName = bookName;
            BookSlug = bookSlug;
            Notes = notes;
            WiktenauerUrl = wiktenauerUrl;
        }

        public int BookKey { get; set; }
        public string BookName { get; set; }
        public string BookSlug { get; set; }
        public string? Notes { get; set; }
        public string? WiktenauerUrl { get; set; }
    }
}
