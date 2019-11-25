CREATE FUNCTION Sources.SubsectionsFor
(
    @RootSection INT
)
RETURNS TABLE
AS
RETURN WITH Subsections (BookKey, RootSectionKey, SectionKey, SectionName, Level, ParentSectionKey, DisplayOrder,
                         PageReference
                        )
       AS (
          --ANCHOR
          SELECT s.BookKey,
                 s.SectionKey AS RootSectionKey,
                 s.SectionKey,
                 s.SectionName,
                 1,
                 s.ParentSectionKey,
                 s.DisplayOrder,
                 s.PageReference
          FROM Sources.Section s
          UNION ALL
          --RECURSIVE
          SELECT s.BookKey,
                 cte.RootSectionKey,
                 s.SectionKey,
                 s.SectionName,
                 cte.Level + 1,
                 s.ParentSectionKey,
                 s.DisplayOrder,
                 s.PageReference
          FROM Sources.Section s
              INNER JOIN Subsections cte
                  ON s.ParentSectionKey = cte.SectionKey)
SELECT s.BookKey,
       s.SectionKey,
       s.SectionName,
       s.Level,
       s.ParentSectionKey,
       s.DisplayOrder,
       s.PageReference
FROM Subsections s
WHERE s.RootSectionKey = @RootSection;
