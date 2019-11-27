IF $(OneTimeLoad) = 1
BEGIN

    DECLARE @Play TABLE
    (
        PlayKey INT NOT NULL PRIMARY KEY,
        SectionKey INT NOT NULL,
        VariantName NVARCHAR(200) NULL,
        CreatedByUserKey INT NOT NULL,
        CreatedDate DATETIME2(7) NOT NULL,
        ModifiedByUserKey INT NOT NULL,
        ModifiedDate DATETIME2(7) NOT NULL,
        AGuardKey INT NULL,
        PGuardKey INT NULL,
        AGuardModifierKey INT NULL,
        PGuardModifierKey INT NULL,
        MeasureKey INT NULL,
        Notes NVARCHAR(MAX) NULL
    );

    INSERT INTO @Play
    (
        PlayKey,
        SectionKey,
        VariantName,
        CreatedByUserKey,
        CreatedDate,
        ModifiedByUserKey,
        ModifiedDate,
        AGuardKey,
        PGuardKey,
        AGuardModifierKey,
        PGuardModifierKey,
        MeasureKey,
        Notes
    )
    VALUES
    (29, 1017, N'A to E', 1, '2018-04-16T01:51:29.2433333', 1, '2018-04-16T01:51:29.2433333', 258, NULL, NULL, NULL,
     NULL, NULL),
    (30, 1017, N'H-D and B-F', 1, '2018-04-16T01:54:07.7500000', 1, '2018-04-16T01:54:07.7500000', 282, NULL, NULL,
     NULL, NULL, NULL),
    (28, 1022, NULL, 1, '2018-04-16T01:48:25.2333333', 1, '2018-04-16T01:48:25.2333333', 93, NULL, 2, NULL, NULL, NULL),
    (31, 1023, NULL, 1, '2018-04-16T01:56:14.1466667', 1, '2018-04-16T01:56:14.1466667', NULL, 258, NULL, 2, NULL, NULL),
    (32, 1024, NULL, 1, '2018-04-16T01:58:14.3600000', 1, '2018-04-16T01:58:14.3600000', NULL, 282, NULL, 2, NULL, NULL),
    (33, 1025, NULL, 1, '2018-04-16T02:00:24.9000000', 1, '2018-04-16T02:00:24.9000000', 258, 282, NULL, 2, 21, NULL),
    (34, 1026, NULL, 1, '2018-04-16T02:23:59.6766667', 1, '2018-04-16T02:23:59.6766667', NULL, NULL, NULL, NULL, NULL,
     NULL),
    (51, 1027, NULL, 1, '2019-07-01T02:48:48.2866667', 1, '2019-07-01T02:48:48.2866667', NULL, NULL, NULL, NULL, NULL,
     NULL),
    (35, 1028, NULL, 1, '2018-04-17T05:33:05.0866667', 1, '2018-04-17T05:33:05.0866667', NULL, NULL, NULL, NULL, NULL,
     NULL),
    (36, 1029, NULL, 1, '2018-04-17T06:27:49.1000000', 1, '2018-04-17T06:27:49.1000000', 93, 258, 2, NULL, 21, NULL),
    (52, 1030, NULL, 1, '2019-07-01T03:04:17.7500000', 1, '2019-07-01T03:04:17.7500000', NULL, NULL, NULL, NULL, 22,
     NULL),
    (53, 1031, NULL, 1, '2019-07-01T03:39:55.2833333', 1, '2019-07-01T03:39:55.2833333', NULL, NULL, NULL, NULL, NULL,
     NULL),
    (54, 1032, NULL, 1, '2019-07-01T03:42:54.4233333', 1, '2019-07-01T03:42:54.4233333', NULL, 225, NULL, NULL, NULL,
     NULL),
    (55, 1033, NULL, 1, '2019-07-01T03:45:28.5100000', 1, '2019-07-01T03:45:28.5100000', NULL, 258, NULL, NULL, 21,
     NULL),
    (56, 1070, NULL, 1, '2019-07-01T04:04:41.3400000', 1, '2019-07-01T04:04:41.3400000', NULL, 272, NULL, 2, 21, NULL),
    (57, 1071, NULL, 1, '2019-07-01T04:09:05.0533333', 1, '2019-07-01T04:09:05.0533333', NULL, 272, NULL, 2, 21, NULL),
    (58, 1073, NULL, 1, '2019-07-01T05:56:35.6466667', 1, '2019-07-01T05:56:35.6466667', 272, NULL, 2, NULL, 21, NULL),
    (59, 1076, NULL, 1, '2019-07-01T05:59:23.1500000', 1, '2019-07-01T05:59:23.1500000', 272, NULL, 2, NULL, 21, NULL),
    (60, 1077, NULL, 1, '2019-07-01T06:07:04.4333333', 1, '2019-07-01T06:07:04.4333333', 272, NULL, 2, NULL, 21, NULL),
    (61, 1078, NULL, 1, '2019-07-01T06:08:17.5000000', 1, '2019-07-01T06:08:17.5000000', 272, NULL, 2, NULL, 21, NULL),
    (63, 1079, NULL, 1, '2019-07-01T06:11:32.2100000', 1, '2019-07-01T06:11:32.2100000', 272, NULL, 2, NULL, 21, NULL),
    (64, 1080, NULL, 1, '2019-07-01T06:16:02.2833333', 1, '2019-07-01T06:16:02.2833333', 272, NULL, 2, NULL, 21, NULL),
    (65, 1081, NULL, 1, '2019-07-21T21:30:31.0833333', 1, '2019-07-21T21:30:31.0833333', NULL, NULL, NULL, NULL, 21,
     NULL),
    (66, 1082, NULL, 1, '2019-07-21T21:36:02.5166667', 1, '2019-07-21T21:36:02.5166667', NULL, NULL, NULL, NULL, 21,
     NULL),
    (70, 1083, NULL, 1, '2019-07-26T18:26:31.1066667', 1, '2019-07-26T18:26:31.1066667', NULL, NULL, NULL, NULL, 21,
     NULL),
    (67, 1084, NULL, 1, '2019-07-21T21:38:50.0533333', 1, '2019-07-21T21:38:50.0533333', NULL, NULL, NULL, NULL, 21,
     NULL),
    (69, 1085, NULL, 1, '2019-07-26T18:19:38.3166667', 1, '2019-07-26T18:19:38.3166667', NULL, NULL, NULL, NULL, 21,
     NULL),
    (71, 1086, NULL, 1, '2019-07-26T18:33:52.3466667', 1, '2019-07-26T18:33:52.3466667', NULL, NULL, NULL, NULL, 22,
     NULL),
    (73, 1089, NULL, 1, '2019-07-26T18:49:15.0100000', 1, '2019-07-26T18:49:15.0100000', 258, NULL, NULL, NULL, 21,
     NULL),
    (74, 1090, NULL, 1, '2019-07-26T19:25:13.4900000', 1, '2019-07-26T19:25:13.4900000', NULL, NULL, NULL, NULL, NULL,
     NULL);
    SET IDENTITY_INSERT Interpretations.Play ON;

    UPDATE @Play
    SET CreatedByUserKey = -1,
        ModifiedByUserKey = -1;

    MERGE INTO Interpretations.Play t
    USING @Play s
    ON t.PlayKey = s.PlayKey
    WHEN NOT MATCHED THEN
        INSERT
        (
            PlayKey,
            SectionKey,
            VariantName,
            CreatedByUserKey,
            CreatedDate,
            ModifiedByUserKey,
            AGuardKey,
            PGuardKey,
            AGuardModifierKey,
            PGuardModifierKey,
            MeasureKey,
            Notes
        )
        VALUES
        (s.PlayKey, s.SectionKey, s.VariantName, s.CreatedByUserKey, s.CreatedDate, s.ModifiedByUserKey, s.AGuardKey,
         s.PGuardKey, s.AGuardModifierKey, s.PGuardModifierKey, s.MeasureKey, s.Notes)
    WHEN MATCHED THEN
        UPDATE SET SectionKey = s.SectionKey,
                   VariantName = s.VariantName,
                   CreatedByUserKey = s.CreatedByUserKey,
                   CreatedDate = s.CreatedDate,
                   ModifiedByUserKey = s.ModifiedByUserKey,
                   AGuardKey = s.AGuardKey,
                   PGuardKey = s.PGuardKey,
                   AGuardModifierKey = s.AGuardModifierKey,
                   PGuardModifierKey = s.PGuardModifierKey,
                   MeasureKey = s.MeasureKey,
                   Notes = s.Notes;

    SET IDENTITY_INSERT Interpretations.Play OFF;

END;
GO