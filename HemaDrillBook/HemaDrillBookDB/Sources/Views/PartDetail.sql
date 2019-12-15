CREATE VIEW Sources.PartDetail
WITH SCHEMABINDING
AS
SELECT p.PartKey,
       p.BookKey,
       p.PartName,
       p.DisplayOrder,
       p.PartSlug,
       b.BookName,
       b.BookSlug,
       (
           SELECT COUNT(*)
           FROM Interpretations.PlayDetail pd
           WHERE pd.PartKey = p.PartKey
       ) AS PlayCount,
       (
           SELECT COUNT(*)
           FROM
           (
               SELECT DISTINCT
                      vd.PartKey,
                      vd.Url,
                      vd.VideoServiceKey,
                      vd.VideoServiceVideoId
               FROM Interpretations.VideoDetail vd
               WHERE vd.PartKey = p.PartKey
           ) A
       ) AS VideoCount,
       (
           SELECT COUNT(*)
           FROM Interpretations.CommentaryDetail cd
           WHERE cd.PublicNotes IS NOT NULL
                 AND cd.PartKey = p.PartKey
       ) AS CommentaryCount
FROM Sources.Part p
    INNER JOIN Sources.Book b
        ON p.BookKey = b.BookKey;
GO
GRANT SELECT ON Sources.PartDetail TO HemaWeb;