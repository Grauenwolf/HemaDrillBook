CREATE VIEW Interpretations.PlayDetail
AS
SELECT p.PlayKey,
       p.SectionKey,
       p.VariantName,
       p.CreatedByUserKey,
       p.CreatedDate,
       p.ModifiedByUserKey,
       p.ModifiedDate,
       p.AGuardKey,
       p.PGuardKey,
       p.AGuardModifierKey,
       p.PGuardModifierKey,
       p.MeasureKey,
       gA.GuardName AS AGuardName,
       gP.GuardName AS PGuardName,
       gmA.GuardModifierName AS AGuardModifierName,
       gmP.GuardModifierName AS PGuardModifierName,
       m.MeasureName,
	   m.AlternateMeasureName,
       gA.AlternateGuardName AS AAlternateGuardName,
       gP.AlternateGuardName AS PAlternateGuardName,
	   s.BookKey,
	   S.SectionName
FROM Interpretations.Play p
    LEFT JOIN Tags.Guard gA
        ON gA.GuardKey = p.AGuardKey
    LEFT JOIN Tags.GuardModifier gmA
        ON gmA.GuardModifierKey = p.AGuardModifierKey
    LEFT JOIN Tags.Guard gP
        ON gP.GuardKey = p.PGuardKey
    LEFT JOIN Tags.GuardModifier gmP
        ON gmP.GuardModifierKey = p.PGuardModifierKey
    LEFT JOIN Tags.Measure m
        ON m.MeasureKey = p.MeasureKey
		INNER JOIN Sources.Section s ON s.SectionKey=p.SectionKey

GO
GRANT SELECT ON Interpretations.PlayDetail TO HemaWeb;