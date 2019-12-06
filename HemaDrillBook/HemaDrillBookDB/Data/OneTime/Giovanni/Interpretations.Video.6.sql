IF $(OneTimeLoad) = 1
BEGIN

    DECLARE @Video TABLE
    (
        VideoKey INT NOT NULL PRIMARY KEY,
        SectionKey INT NOT NULL,
        VideoServiceKey INT NOT NULL,
        VideoServiceVideoId VARCHAR(11) NULL,
        Url NVARCHAR(500) NULL,
        StartTime TIME(7) NULL,
        CreatedByUserKey INT NOT NULL,
        CreatedDate DATETIME2(7) NOT NULL,
        ModifiedByUserKey INT NULL,
        ModifiedDate DATETIME2(7) NOT NULL,
        Author NVARCHAR(250) NULL,
        Description NVARCHAR(250) NULL
    );

    INSERT INTO @Video
    (
        VideoKey,
        SectionKey,
        VideoServiceKey,
        VideoServiceVideoId,
        Url,
        StartTime,
        CreatedByUserKey,
        CreatedDate,
        ModifiedByUserKey,
        ModifiedDate,
        Author,
        Description
    )
    VALUES
    (1237, 6013, 1, 'in_FdDyelYU', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1238, 6013, 1, '6LTKIS_xCSc', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1239, 6013, 1, 'E4vnypZbEyw', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1240, 6013, 1, 'LsSP5KAJUe8', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1241, 6013, 1, 'gdC-0kLcNaQ', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1242, 6013, 1, '5Sxv8oVYlZY', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1243, 6013, 1, 'qc_ehdY8H7M', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1244, 6013, 1, 'h27rmK9f2qQ', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1245, 6013, 1, 'VdXau76N97s', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1246, 6021, 1, 'koPJGPA-9KA', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1247, 6022, 1, 'koPJGPA-9KA', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1248, 6023, 1, 'koPJGPA-9KA', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1249, 6024, 1, 'koPJGPA-9KA', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1250, 6025, 1, 'koPJGPA-9KA', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1251, 6026, 1, 'koPJGPA-9KA', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1252, 6027, 1, 'koPJGPA-9KA', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1253, 6028, 1, 'koPJGPA-9KA', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1254, 6029, 1, 'koPJGPA-9KA', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1255, 6030, 1, 'koPJGPA-9KA', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1256, 6030, 1, '-yqHKUU-haU', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1257, 6039, 1, 'w3plcAKU7c4', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1258, 6040, 1, 'AD0ncK5O460', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1259, 6041, 1, 'DDjKqBVUJTs', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1260, 6044, 1, 'ikGzb_LmyqI', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1261, 6051, 1, '6WwpjftlFZc', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1262, 6056, 1, 'zCo1bjKjTgQ', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1263, 6057, 1, 'zCo1bjKjTgQ', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1264, 6058, 1, 'zCo1bjKjTgQ', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1265, 6059, 1, 'zCo1bjKjTgQ', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1266, 6060, 1, 'zCo1bjKjTgQ', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1267, 6061, 1, 'zCo1bjKjTgQ', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1268, 6062, 1, '6dU6pc4PhHI', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1269, 6062, 1, 'xjsfBPEZONo', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1270, 6062, 1, 'qwfTFy_qvxQ', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1271, 6062, 1, 'gdC-0kLcNaQ', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL),
    (1272, 6062, 1, 'jtBLsw56-3Y', NULL, NULL, -1, '2018-04-17T03:51:32.9166667', NULL, '2018-04-17T03:51:32.9166667',
     NULL, NULL);
    SET IDENTITY_INSERT Interpretations.Video ON;


    MERGE INTO Interpretations.Video t
    USING @Video s
    ON t.VideoKey = s.VideoKey
    WHEN NOT MATCHED THEN
        INSERT
        (
            VideoKey,
            SectionKey,
            VideoServiceKey,
            VideoServiceVideoId,
            Url,
            StartTime,
            CreatedByUserKey,
            CreatedDate,
            ModifiedByUserKey,
            Author,
            Description
        )
        VALUES
        (s.VideoKey, s.SectionKey, s.VideoServiceKey, s.VideoServiceVideoId, s.Url, s.StartTime, s.CreatedByUserKey,
         s.CreatedDate, s.ModifiedByUserKey, s.Author, s.Description)
    WHEN MATCHED THEN
        UPDATE SET t.SectionKey = s.SectionKey,
                   t.VideoServiceKey = s.VideoServiceKey,
                   t.VideoServiceVideoId = s.VideoServiceVideoId,
                   t.Url = s.Url,
                   t.StartTime = s.StartTime,
                   t.CreatedByUserKey = s.CreatedByUserKey,
                   t.CreatedDate = s.CreatedDate,
                   t.ModifiedByUserKey = s.ModifiedByUserKey,
                   t.Author = s.Author,
                   t.Description = s.Description;

    SET IDENTITY_INSERT Interpretations.Video OFF;
END;
GO
