CREATE VIEW Sources.PartDetail
WITH SCHEMABINDING
AS
SELECT p.PartKey,
       p.BookKey,
       p.PartName,
       p.DisplayOrder,
       p.PartSlug,
       b.BookName,
       b.BookSlug
FROM Sources.Part p
    INNER JOIN Sources.Book b
        ON p.BookKey = b.BookKey;
GO
GRANT SELECT ON Sources.PartDetail TO HemaWeb;