CREATE VIEW Sources.BookAuthorMapDetail
WITH SCHEMABINDING
AS
SELECT a.AuthorKey,
       a.AuthorName,
       a.AuthorSlug,
	   ba.BookKey FROM Sources.Author a
	   INNER JOIN Sources.BookAuthorMap ba ON a.AuthorKey = ba.AuthorKey
	   GO

GRANT SELECT ON Sources.BookAuthorMapDetail TO HemaWeb;