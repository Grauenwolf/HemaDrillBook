CREATE VIEW Interpretations.PlayStepDetail
AS
SELECT p.SectionKey,
       ps.PlayKey,
       ps.TempoNumber,
       ps.Actor,
       ps.FootworkKey,
       ps.TechniqueKey1,
       ps.TechniqueKey2,
       ps.TechniqueKey3,
       ps.TargetKey1,
       ps.TargetKey2,
       ps.TargetKey3,
       ps.GuardKey,
       ps.GuardModifierKey,
       ps.IntermediateGuardKey,
       ps.IntermediateGuardModifierKey,
       ps.Notes,
       f.FootworkName,
       f.AlternateFootworkName,
       tar1.TargetName AS TargetName1,
       tar2.TargetName AS TargetName2,
       tar3.TargetName AS TargetName3,
       t1.TechniqueName AS TechniqueName1,
       t2.TechniqueName AS TechniqueName2,
       t3.TechniqueName AS TechniqueName3,
       t1.AlternateTechniqueName AS AlternateTechniqueName1,
       t2.AlternateTechniqueName AS AlternateTechniqueName2,
       t3.AlternateTechniqueName AS AlternateTechniqueName3,
       g.GuardName,
       g.AlternateGuardName,
       ig.GuardName AS IntermediateGuardName,
       ig.AlternateGuardName AS IntermediateAlternateGuardName,
       gm.GuardModifierName,
       igm.GuardModifierName AS IntermediateGuardModifierName
FROM Interpretations.PlayStep ps
    INNER JOIN Interpretations.Play p
        ON p.PlayKey = ps.PlayKey
    LEFT JOIN Tags.Footwork f
        ON f.FootworkKey = ps.FootworkKey
    LEFT JOIN Tags.Technique t1
        ON t1.TechniqueKey = ps.TechniqueKey1
    LEFT JOIN Tags.Technique t2
        ON t2.TechniqueKey = ps.TechniqueKey2
    LEFT JOIN Tags.Technique t3
        ON t3.TechniqueKey = ps.TechniqueKey3
    LEFT JOIN Tags.Target tar1
        ON tar1.TargetKey = ps.TargetKey1
    LEFT JOIN Tags.Target tar2
        ON tar2.TargetKey = ps.TargetKey2
    LEFT JOIN Tags.Target tar3
        ON tar3.TargetKey = ps.TargetKey3
    LEFT JOIN Tags.Guard g
        ON g.GuardKey = ps.GuardKey
    LEFT JOIN Tags.Guard ig
        ON ig.GuardKey = ps.IntermediateGuardKey
    LEFT JOIN Tags.GuardModifier gm
        ON gm.GuardModifierKey = ps.GuardModifierKey
    LEFT JOIN Tags.GuardModifier igm
        ON igm.GuardModifierKey = ps.IntermediateGuardModifierKey;


GO
GRANT SELECT ON Interpretations.PlayStepDetail TO HemaWeb;

