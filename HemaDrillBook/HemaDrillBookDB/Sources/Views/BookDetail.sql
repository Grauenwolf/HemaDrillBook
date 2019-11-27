CREATE VIEW Sources.BookDetail
WITH SCHEMABINDING
AS
SELECT b.BookKey,
       b.BookName,
       b.BookSlug,
       b.Notes,
       b.WiktenauerUrl
FROM Sources.Book b;

GO

GRANT SELECT ON Sources.BookDetail TO HemaWeb;