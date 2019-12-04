CREATE VIEW Search.TechniqueByPlay
WITH SCHEMABINDING
AS
SELECT DISTINCT
       A.TechniqueKey,
       A.TechniqueName,
       A.AlternateTechniqueName,
       A.PlayKey
FROM
(
    SELECT t.TechniqueKey,
           t.TechniqueName,
           t.AlternateTechniqueName,
           ps.PlayKey
    FROM Tags.Technique t
        INNER JOIN Interpretations.PlayStep ps
            ON t.TechniqueKey = ps.TechniqueKey1
    UNION
    SELECT t.TechniqueKey,
           t.TechniqueName,
           t.AlternateTechniqueName,
           ps.PlayKey
    FROM Tags.Technique t
        INNER JOIN Interpretations.PlayStep ps
            ON t.TechniqueKey = ps.TechniqueKey2
    UNION
    SELECT t.TechniqueKey,
           t.TechniqueName,
           t.AlternateTechniqueName,
           ps.PlayKey
    FROM Tags.Technique t
        INNER JOIN Interpretations.PlayStep ps
            ON t.TechniqueKey = ps.TechniqueKey3
) A;

GO
GRANT SELECT ON Search.TechniqueByPlay TO HemaWeb;
