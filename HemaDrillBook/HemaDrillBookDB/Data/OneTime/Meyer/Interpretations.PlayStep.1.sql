IF $(OneTimeLoad) = 1
BEGIN

    DECLARE @PlayStep TABLE
    (
        PlayKey INT NOT NULL ,
        TempoNumber INT NOT NULL ,
        Actor CHAR(1) NOT NULL ,
		PRIMARY KEY (PlayKey, TempoNumber, Actor),
        FootworkKey INT NULL,
        TechniqueKey1 INT NULL,
        TechniqueKey2 INT NULL,
        TechniqueKey3 INT NULL,
        TargetKey1 INT NULL,
        TargetKey2 INT NULL,
        TargetKey3 INT NULL,
        GuardKey INT NULL,
        GuardModifierKey INT NULL,
        IntermediateGuardKey INT NULL,
        IntermediateGuardModifierKey INT NULL,
        Notes NVARCHAR(MAX) NULL
    );

    INSERT INTO @PlayStep
    (
        PlayKey,
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
        Notes
    )
    VALUES
    (29, 1, 'A', NULL, 350, NULL, NULL, NULL, NULL, NULL, 118, NULL, 84, NULL, NULL),
    (29, 2, 'A', NULL, 124, NULL, NULL, NULL, NULL, NULL, 250, NULL, NULL, NULL, NULL),
    (29, 3, 'A', NULL, 350, NULL, NULL, NULL, NULL, NULL, 118, NULL, 84, NULL, NULL),
    (29, 4, 'A', NULL, 509, NULL, NULL, NULL, NULL, NULL, 248, NULL, NULL, NULL, NULL),
    (30, 1, 'A', NULL, 489, NULL, NULL, NULL, NULL, NULL, 272, NULL, 84, NULL, NULL),
    (30, 2, 'A', NULL, 509, NULL, NULL, NULL, NULL, NULL, 91, NULL, NULL, NULL, NULL),
    (30, 3, 'A', NULL, 508, NULL, NULL, NULL, NULL, NULL, 144, NULL, 84, NULL, NULL),
    (30, 4, 'A', NULL, 489, NULL, NULL, NULL, NULL, NULL, 272, NULL, 84, NULL, NULL),
    (30, 5, 'A', NULL, 429, NULL, NULL, NULL, NULL, NULL, 282, NULL, 84, NULL, NULL),
    (28, 1, 'A', 140, 462, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Image B, Small Figure, Left Side '),
    (31, 1, 'A', NULL, 508, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (31, 1, 'P', 124, 403, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (32, 1, 'A', NULL, 508, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (32, 1, 'P', 124, 314, NULL, NULL, 21, 2, NULL, NULL, NULL, NULL, NULL, N'Long-edge cut'),
    (32, 2, 'P', NULL, 510, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Image D, Upper Right '),
    (33, 1, 'A', NULL, 508, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (33, 2, 'A', 124, 493, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Image H, Left '),
    (34, 1, 'A', NULL, 508, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (34, 1, 'P', NULL, 315, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N''),
    (34, 2, 'P', NULL, 513, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'Image B, Upper Left '),
    (51, 1, 'A', NULL, 301, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (51, 1, 'P', NULL, 514, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (51, 2, 'P', NULL, 513, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (35, 1, 'A', NULL, 508, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (35, 1, 'P', NULL, 493, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (35, 2, 'P', NULL, 264, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, N'Image L, Large Figure, Right'),
    (35, 3, 'P', NULL, 493, NULL, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (36, 1, 'A', 124, 516, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, N'Image I, Large Figure, Left'),
    (36, 2, 'A', NULL, 514, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (52, 1, 'A', NULL, 228, 408, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (53, 1, 'A', NULL, 301, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (53, 1, 'P', NULL, 462, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (53, 2, 'P', 144, 396, 511, NULL, 1, 3, NULL, NULL, NULL, NULL, NULL, N'Image H, Large Figure, Right'),
    (53, 3, 'P', NULL, 309, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (54, 1, 'A', NULL, 301, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (54, 1, 'P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 287, NULL, NULL, NULL, NULL),
    (54, 2, 'P', NULL, 524, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (55, 1, 'A', NULL, 493, NULL, NULL, 31, 32, NULL, NULL, NULL, NULL, NULL, NULL),
    (56, 1, 'A', NULL, 525, NULL, NULL, NULL, NULL, NULL, 258, NULL, NULL, NULL, NULL),
    (56, 1, 'P', 124, 429, 493, 251, 11, NULL, NULL, NULL, NULL, NULL, NULL, N''),
    (56, 2, 'A', NULL, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Parry does not connect'),
    (56, 2, 'P', 123, 493, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (56, 3, 'A', NULL, 457, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (56, 3, 'P', NULL, 401, 297, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (56, 4, 'P', NULL, 513, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (56, 5, 'A', NULL, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (56, 5, 'P', 146, 493, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (57, 1, 'A', NULL, 525, NULL, NULL, NULL, NULL, NULL, 258, NULL, NULL, NULL, NULL),
    (57, 1, 'P', 124, 429, 493, 251, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (57, 2, 'A', NULL, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Parry does not connect'),
    (57, 2, 'P', 123, 493, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (57, 3, 'P', NULL, 468, 513, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (57, 4, 'A', NULL, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (57, 4, 'P', 146, 493, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (58, 1, 'A', NULL, 429, 429, 429, 10, NULL, NULL, 84, NULL, NULL, NULL, N'Keep left foot forward'),
    (58, 2, 'A', 2, 489, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (58, 3, 'A', 123, 462, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (58, 4, 'A', NULL, 462, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (58, 5, 'A', NULL, 489, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (58, 6, 'A', 148, 493, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (59, 1, 'A', NULL, 429, 429, 429, 10, NULL, NULL, 84, NULL, NULL, NULL, N'Keep left foot forward'),
    (59, 2, 'A', 2, 489, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (59, 3, 'A', 123, 462, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (59, 4, 'A', NULL, 462, 251, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, N'Cut does not connect'),
    (59, 5, 'A', NULL, 489, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (59, 6, 'A', 148, 493, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (60, 1, 'A', NULL, 429, 429, 429, 10, NULL, NULL, 84, NULL, NULL, NULL, N'Keep left foot forward'),
    (60, 2, 'A', 2, 489, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (60, 3, 'A', 123, 462, 251, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, N'Cut does not connect'),
    (60, 4, 'A', NULL, 462, 251, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, N'Cut does not connect'),
    (60, 5, 'A', NULL, 489, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (60, 6, 'A', 148, 493, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (61, 1, 'A', NULL, 429, 429, 429, 10, NULL, NULL, 84, NULL, NULL, NULL, N'Keep left foot forward'),
    (61, 2, 'A', 2, 489, 251, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, N'Cut does not connect'),
    (61, 3, 'A', 123, 462, 251, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, N'Cut does not connect'),
    (61, 4, 'A', NULL, 508, NULL, NULL, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (63, 1, 'A', NULL, 429, 429, 429, 10, NULL, NULL, 84, NULL, NULL, NULL, N'Keep left foot forward'),
    (63, 2, 'A', 2, 489, 147, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (63, 2, 'P', NULL, 139, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (63, 3, 'A', NULL, 513, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (64, 1, 'A', NULL, 429, 429, 429, 10, NULL, NULL, 84, NULL, NULL, NULL, N'Keep left foot forward'),
    (64, 2, 'A', 2, 489, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (64, 3, 'A', NULL, 513, 147, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (64, 4, 'A', NULL, 508, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (65, 1, 'A', NULL, 350, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (65, 2, 'A', 149, 468, 462, NULL, 29, NULL, NULL, 172, NULL, NULL, NULL, N''),
    (66, 1, 'A', 131, 462, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (66, 2, 'A', 149, 511, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (70, 1, 'A', NULL, 511, 251, 526, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (70, 2, 'A', NULL, 493, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (67, 1, 'A', 140, 493, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (67, 2, 'A', NULL, 526, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (69, 1, 'A', 132, 510, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (69, 2, 'A', 147, 493, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (71, 1, 'A', NULL, 162, 524, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
    (73, 1, 'A', NULL, 508, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (73, 1, 'P', 151, 527, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (73, 2, 'P', 123, 462, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (73, 3, 'P', NULL, 524, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL,
     N'If opponent doesn''t slip (parry), the play stops here'),
    (73, 4, 'A', NULL, 139, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (73, 4, 'P', NULL, 251, 147, 524, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (73, 5, 'P', 152, 493, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (74, 1, 'A', NULL, 462, NULL, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (74, 1, 'P', 153, 511, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (74, 2, 'P', 153, 524, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (74, 3, 'A', NULL, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (74, 3, 'P', 123, 457, 511, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (74, 4, 'A', NULL, 457, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (74, 4, 'P', NULL, 401, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


    MERGE INTO Interpretations.PlayStep t
    USING @PlayStep s
    ON t.PlayKey = s.PlayKey
       AND t.TempoNumber = s.TempoNumber
       AND t.Actor = s.Actor
    WHEN NOT MATCHED THEN
        INSERT
        (
            PlayKey,
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
            Notes
        )
        VALUES
        (s.PlayKey, s.TempoNumber, s.Actor, s.FootworkKey, s.TechniqueKey1, s.TechniqueKey2, s.TechniqueKey3,
         s.TargetKey1, s.TargetKey2, s.TargetKey3, s.GuardKey, s.GuardModifierKey, s.IntermediateGuardKey,
         s.IntermediateGuardModifierKey, s.Notes)
    WHEN MATCHED THEN
        UPDATE SET FootworkKey = s.FootworkKey,
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