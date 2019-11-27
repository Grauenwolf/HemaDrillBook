CREATE VIEW Interpretations.PlayDetail
WITH SCHEMABINDING
AS
SELECT p.PlayKey,
       p.SectionKey,
       p.VariantName,
       p.CreatedByUserKey,
       p.CreatedDate,
       p.ModifiedByUserKey,
       p.AGuardKey,
       p.PGuardKey,
       p.AGuardModifierKey,
       p.PGuardModifierKey,
       p.MeasureKey,
       p.Notes,
       s.SectionName,
       s.SectionSlug,
       s.PartKey,
	   s.PageReference,
       p2.PartName,
       p2.PartSlug,
       p2.BookKey,
       b.BookName,
       b.BookSlug,
       gA.GuardName AS AGuardName,
       gA.AlternateGuardName AS AAlternateGuardName,
       gP.GuardName AS PGuardName,
       gP.AlternateGuardName AS PAlternateGuardName,
       gmA.GuardModifierName AS AGuardModifierName,
       gmP.GuardModifierName AS PAGuardModifierName
FROM Interpretations.Play p
    INNER JOIN Sources.Section s
        ON p.SectionKey = s.SectionKey
    INNER JOIN Sources.Part p2
        ON s.PartKey = p2.PartKey
    INNER JOIN Sources.Book b
        ON p2.BookKey = b.BookKey
    LEFT JOIN Tags.Guard gA
        ON p.AGuardKey = gA.GuardKey
    LEFT JOIN Tags.Guard gP
        ON p.PGuardKey = gP.GuardKey
    LEFT JOIN Tags.GuardModifier gmA
        ON p.AGuardModifierKey = gmA.GuardModifierKey
    LEFT JOIN Tags.GuardModifier gmP
        ON p.PGuardModifierKey = gmP.GuardModifierKey;
GO
GRANT SELECT ON Interpretations.PlayDetail TO HemaWeb;