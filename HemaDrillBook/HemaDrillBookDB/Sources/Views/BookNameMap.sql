CREATE VIEW Sources.BookNameMap
WITH SCHEMABINDING
AS
SELECT b.BookKey,
       b.BookName,
       b.BookSlug,
	   (SELECT TOP (1) a.AuthorName FROM Sources.Author a INNER JOIN Sources.BookAuthorMap bam ON a.AuthorKey = bam.AuthorKey
	   WHERE bam.BookKey = b.BookKey ORDER BY bam.DisplayOrder) AS AuthorName,
	   CONVERT(BIT, 0) AS IsAlternateName
FROM Sources.Book b
UNION ALL
SELECT abn.BookKey,
       abn.AlternateBookName AS BookName,
       b.BookSlug,
	   (SELECT TOP (1) a.AuthorName FROM Sources.Author a INNER JOIN Sources.BookAuthorMap bam ON a.AuthorKey = bam.AuthorKey
	   WHERE bam.BookKey = b.BookKey ORDER BY bam.DisplayOrder) AS AuthorName,
	   CONVERT(BIT, 1) AS IsAlternateName
FROM Sources.AlternateBookName abn
    INNER JOIN Sources.Book b
        ON abn.BookKey = b.BookKey;
GO
GRANT SELECT ON Sources.BookNameMap TO HemaWeb;

