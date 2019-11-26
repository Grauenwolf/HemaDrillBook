
DECLARE @GuardModifier TABLE
(
GuardModifierKey int PRIMARY KEY,
GuardModifierName nvarchar(100)

);

INSERT INTO @GuardModifier
(  GuardModifierKey,
GuardModifierName )
VALUES

(1, N'Rigth foot forward'),
(2, N'Left foot forward'),
(3, N'Narrow stance'),
(4, N'Wide stance'),
(5, N'Inside'),
(6, N'Outside'),
(7, N'Below'),
(8, N'Strained'),
(9, N'Perpendicular')

;

SET IDENTITY_INSERT Tags.GuardModifier ON;

MERGE INTO Tags.GuardModifier t
USING @GuardModifier s
ON t.GuardModifierKey = s.GuardModifierKey
WHEN NOT MATCHED THEN
    INSERT
(  GuardModifierKey,
GuardModifierName )
    VALUES
    (  s.GuardModifierKey,
s.GuardModifierName )
WHEN MATCHED THEN
    UPDATE SET  GuardModifierName = s.GuardModifierName;

SET IDENTITY_INSERT Tags.GuardModifier OFF;

