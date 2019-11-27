CREATE VIEW Sources.BookNameMap
WITH SCHEMABINDING
AS
SELECT b.BookKey,
       b.BookName,
       b.BookSlug,
	   (SELECT TOP (1) a.AuthorName FROM Sources.Author a INNER JOIN Sources.BookAuthor ba ON a.AuthorKey = ba.AuthorKey
	   WHERE ba.BookKey = b.BookKey ORDER BY ba.DisplayOrder) AS AuthorName
FROM Sources.Book b
UNION ALL
SELECT abn.BookKey,
       abn.AlternateBookName AS BookName,
       b.BookSlug,
	   (SELECT TOP (1) a.AuthorName FROM Sources.Author a INNER JOIN Sources.BookAuthor ba ON a.AuthorKey = ba.AuthorKey
	   WHERE ba.BookKey = b.BookKey ORDER BY ba.DisplayOrder) AS AuthorName
FROM Sources.AlternateBookName abn
    INNER JOIN Sources.Book b
        ON abn.BookKey = b.BookKey;
GO
GRANT SELECT ON Sources.BookNameMap TO HemaWeb;

