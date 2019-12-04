CREATE VIEW Search.TargetByPlay
WITH SCHEMABINDING
AS
SELECT DISTINCT
       A.TargetKey,
       A.TargetName,
       A.PlayKey
FROM
(
    SELECT t.TargetKey,
           t.TargetName,
           ps.PlayKey
    FROM Tags.Target t
        INNER JOIN Interpretations.PlayStep ps
            ON t.TargetKey = ps.TargetKey1
    UNION
    SELECT t.TargetKey,
           t.TargetName,
           ps.PlayKey
    FROM Tags.Target t
        INNER JOIN Interpretations.PlayStep ps
            ON t.TargetKey = ps.TargetKey2
    UNION
    SELECT t.TargetKey,
           t.TargetName,
           ps.PlayKey
    FROM Tags.Target t
        INNER JOIN Interpretations.PlayStep ps
            ON t.TargetKey = ps.TargetKey3
) A;
GO
GRANT SELECT ON Search.TargetByPlay TO HemaWeb;
