using System;

namespace HemaDrillBook.Models
{
    public class AuthorSummary
    {
        public AuthorSummary(int authorKey, string authorName, string authorSlug)
        {
            if (string.IsNullOrEmpty(authorName))
                throw new ArgumentException($"{nameof(authorName)} is null or empty.", nameof(authorName));
            if (string.IsNullOrEmpty(authorSlug))
                throw new ArgumentException($"{nameof(authorSlug)} is null or empty.", nameof(authorSlug));

            AuthorKey = authorKey;
            AuthorName = authorName;
            AuthorSlug = authorSlug;
        }

        public int AuthorKey { get; set; }
        public string AuthorName { get; set; }
        public string AuthorSlug { get; set; }
    }
}
