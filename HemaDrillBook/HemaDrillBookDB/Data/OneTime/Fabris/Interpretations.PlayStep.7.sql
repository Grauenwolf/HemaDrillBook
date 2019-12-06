IF $(OneTimeLoad) = 1
BEGIN

DECLARE @PlayStep TABLE
(
PlayKey int NOT NULL ,
TempoNumber int NOT NULL ,
Actor char(1) NOT NULL ,
FootworkKey int NULL,
TechniqueKey1 int NULL,
TechniqueKey2 int NULL,
TechniqueKey3 int NULL,
TargetKey1 int NULL,
TargetKey2 int NULL,
TargetKey3 int NULL,
GuardKey int NULL,
GuardModifierKey int NULL,
IntermediateGuardKey int NULL,
IntermediateGuardModifierKey int NULL,
Notes nvarchar(max) NULL

);

INSERT INTO @PlayStep
(  PlayKey,
TempoNumber,
Actor,
FootworkKey,
TechniqueKey1,
TechniqueKey2,
TechniqueKey3,
TargetKey1,
TargetKey2,
TargetKey3,
GuardKey,
GuardModifierKey,
IntermediateGuardKey,
IntermediateGuardModifierKey,
Notes )
VALUES

(46, 1, 'A', 101, 95, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL),
(46, 2, 'A', 108, 73, NULL, NULL, NULL, NULL, NULL, 33, 6, NULL, NULL, N''),
(46, 3, 'A', 143, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 1, 'A', 101, 95, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL),
(47, 1, 'P', NULL, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 2, 'A', 108, 73, NULL, NULL, NULL, NULL, NULL, 33, 7, NULL, NULL, N''),
(47, 3, 'A', 143, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 1, 'A', 101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 1, 'P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37, 8, NULL, NULL, N'See illustration 5.'),
(19, 2, 'A', 101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 2, 'P', 134, 73, NULL, NULL, NULL, NULL, NULL, 35, 5, NULL, NULL, NULL),
(20, 1, 'A', 101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 1, 'P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37, 8, NULL, NULL, N'See illustration 5.'),
(20, 2, 'A', 101, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 2, 'P', 134, 73, NULL, NULL, NULL, NULL, NULL, 37, 5, NULL, NULL, NULL),
(21, 1, 'A', 101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 1, 'P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37, 8, NULL, NULL, N'See illustration 5.'),
(21, 2, 'A', 101, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 2, 'P', 134, 87, 73, NULL, NULL, NULL, NULL, 37, 6, NULL, NULL, N'Left hand reinforces the hilt.'),
(22, 1, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37, 9, NULL, NULL, N'See illustration 6.'),
(22, 1, 'P', 101, 502, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 2, 'A', 135, NULL, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL),
(23, 1, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37, 9, NULL, NULL, N'See illustration 6.'),
(23, 1, 'P', 101, 502, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 2, 'A', NULL, 124, 73, NULL, NULL, NULL, NULL, 37, NULL, NULL, NULL, NULL),
(24, 1, 'A', 101, 1, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL),
(24, 1, 'P', 138, 73, NULL, NULL, 9, NULL, NULL, 35, 5, NULL, NULL, NULL),
(25, 1, 'A', 101, 87, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL),
(25, 1, 'P', NULL, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 2, 'A', NULL, 73, NULL, NULL, NULL, NULL, NULL, 37, 7, NULL, NULL, NULL),
(26, 1, 'A', 101, 87, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL),
(26, 1, 'P', NULL, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 2, 'A', NULL, 87, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL),
(27, 1, 'A', 101, 87, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL),
(27, 1, 'P', 138, 73, NULL, NULL, 9, NULL, NULL, 35, 5, NULL, NULL, NULL),
(48, 1, 'A', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 1, 'P', NULL, 124, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL),
(48, 2, 'A', NULL, 87, 73, NULL, 9, NULL, NULL, 40, 6, NULL, NULL, NULL),
(49, 1, 'A', NULL, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 1, 'P', 25, 87, NULL, NULL, NULL, NULL, NULL, 40, 6, NULL, NULL, NULL),
(49, 2, 'A', NULL, 73, NULL, NULL, 9, NULL, NULL, 40, 6, NULL, NULL, NULL),
(50, 1, 'A', NULL, 95, NULL, NULL, NULL, NULL, NULL, 286, 5, NULL, NULL, NULL),
(50, 1, 'P', NULL, 73, NULL, NULL, NULL, NULL, NULL, 40, 7, NULL, NULL, NULL),
(50, 2, 'A', NULL, 73, NULL, NULL, 7, NULL, NULL, 35, NULL, NULL, NULL, NULL)

;


MERGE INTO Interpretations.PlayStep t
USING @PlayStep s
ON t.PlayKey = s.PlayKey AND t.TempoNumber = s.TempoNumber AND t.Actor = s.Actor
WHEN NOT MATCHED THEN
    INSERT
(  PlayKey,
TempoNumber,
Actor,
FootworkKey,
TechniqueKey1,
TechniqueKey2,
TechniqueKey3,
TargetKey1,
TargetKey2,
TargetKey3,
GuardKey,
GuardModifierKey,
IntermediateGuardKey,
IntermediateGuardModifierKey,
Notes )
    VALUES
    (  s.PlayKey,
s.TempoNumber,
s.Actor,
s.FootworkKey,
s.TechniqueKey1,
s.TechniqueKey2,
s.TechniqueKey3,
s.TargetKey1,
s.TargetKey2,
s.TargetKey3,
s.GuardKey,
s.GuardModifierKey,
s.IntermediateGuardKey,
s.IntermediateGuardModifierKey,
s.Notes )
WHEN MATCHED THEN
    UPDATE SET  FootworkKey = s.FootworkKey,
TechniqueKey1 = s.TechniqueKey1,
TechniqueKey2 = s.TechniqueKey2,
TechniqueKey3 = s.TechniqueKey3,
TargetKey1 = s.TargetKey1,
TargetKey2 = s.TargetKey2,
TargetKey3 = s.TargetKey3,
GuardKey = s.GuardKey,
GuardModifierKey = s.GuardModifierKey,
IntermediateGuardKey = s.IntermediateGuardKey,
IntermediateGuardModifierKey = s.IntermediateGuardModifierKey,
Notes = s.Notes;

END;
GO
