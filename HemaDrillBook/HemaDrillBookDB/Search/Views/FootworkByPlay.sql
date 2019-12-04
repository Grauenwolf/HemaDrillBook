CREATE VIEW Search.FootworkByPlay
WITH SCHEMABINDING
AS
SELECT DISTINCT
       f.FootworkKey,
       f.FootworkName,
       f.AlternateFootworkName,
       ps.PlayKey
FROM Tags.Footwork f
    INNER JOIN Interpretations.PlayStep ps
        ON f.FootworkKey = ps.FootworkKey;
GO
GRANT SELECT ON Search.FootworkByPlay TO HemaWeb;