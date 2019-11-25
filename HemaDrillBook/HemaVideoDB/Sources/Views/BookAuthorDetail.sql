CREATE VIEW Sources.BookAuthorDetail
AS
SELECT ba.BookKey,
       ba.AuthorKey,
       a.AuthorName,
       b.BookName,
       b.AlternateBookName,
	   b.BookSlug,
	   a.AuthorSlug
FROM Sources.BookAuthor ba
    INNER JOIN Sources.Author a
        ON ba.AuthorKey = a.AuthorKey
    INNER JOIN Sources.Book b
        ON b.BookKey = ba.BookKey;
GO
GRANT SELECT ON Sources.BookAuthorDetail TO HemaWeb;