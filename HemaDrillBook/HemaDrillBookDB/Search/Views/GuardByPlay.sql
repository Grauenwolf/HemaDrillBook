CREATE VIEW Search.GuardByPlay
WITH SCHEMABINDING
AS
SELECT DISTINCT
       A.GuardKey,
       A.GuardName,
       A.AlternateGuardName,
       A.GuardModifierKey,
       A.GuardModifierName,
       A.PlayKey,
       A.IsStartingGuard
FROM
(
    SELECT g.GuardKey,
           g.GuardName,
           g.AlternateGuardName,
           gm.GuardModifierKey,
           gm.GuardModifierName,
           ps.PlayKey,
           CONVERT(BIT, 0) AS IsStartingGuard
    FROM Tags.Guard g
        INNER JOIN Interpretations.PlayStep ps
            ON g.GuardKey = ps.GuardKey
        LEFT JOIN Tags.GuardModifier gm
            ON ps.GuardModifierKey = gm.GuardModifierKey
    UNION
    SELECT g.GuardKey,
           g.GuardName,
           g.AlternateGuardName,
           gm.GuardModifierKey,
           gm.GuardModifierName,
           ps.PlayKey,
           CONVERT(BIT, 0) AS IsStartingGuard
    FROM Tags.Guard g
        INNER JOIN Interpretations.PlayStep ps
            ON g.GuardKey = ps.IntermediateGuardKey
        LEFT JOIN Tags.GuardModifier gm
            ON ps.IntermediateGuardModifierKey = gm.GuardModifierKey
    UNION
    SELECT g.GuardKey,
           g.GuardName,
           g.AlternateGuardName,
           gm.GuardModifierKey,
           gm.GuardModifierName,
           p.PlayKey,
           CONVERT(BIT, 1) AS IsStartingGuard
    FROM Tags.Guard g
        INNER JOIN Interpretations.Play p
            ON g.GuardKey = p.AGuardKey
        LEFT JOIN Tags.GuardModifier gm
            ON p.AGuardModifierKey = gm.GuardModifierKey
    UNION
    SELECT g.GuardKey,
           g.GuardName,
           g.AlternateGuardName,
           gm.GuardModifierKey,
           gm.GuardModifierName,
           p.PlayKey,
           CONVERT(BIT, 1) AS IsStartingGuard
    FROM Tags.Guard g
        INNER JOIN Interpretations.Play p
            ON g.GuardKey = p.PGuardKey
        LEFT JOIN Tags.GuardModifier gm
            ON p.PGuardModifierKey = gm.GuardModifierKey
) A;

GO
GRANT SELECT ON Search.GuardByPlay TO HemaWeb;
