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
    (1234, 4002, 1, 'u9sNALL77qk', NULL, '00:00:05.0000000', -1, '2018-04-17T03:51:30.7600000', NULL,
     '2018-04-17T03:51:30.7600000', NULL, NULL),
    (1235, 4003, 1, 'u9sNALL77qk', NULL, '00:00:31.0000000', -1, '2018-04-17T03:51:30.7600000', NULL,
     '2018-04-17T03:51:30.7600000', NULL, NULL),
    (1236, 4004, 1, 'u9sNALL77qk', NULL, '00:01:33.0000000', -1, '2018-04-17T03:51:30.7600000', NULL,
     '2018-04-17T03:51:30.7600000', NULL, NULL);
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
        UPDATE SET SectionKey = s.SectionKey,
                   VideoServiceKey = s.VideoServiceKey,
                   VideoServiceVideoId = s.VideoServiceVideoId,
                   Url = s.Url,
                   StartTime = s.StartTime,
                   CreatedByUserKey = s.CreatedByUserKey,
                   CreatedDate = s.CreatedDate,
                   ModifiedByUserKey = s.ModifiedByUserKey,
                   Author = s.Author,
                   Description = s.Description;

    SET IDENTITY_INSERT Interpretations.Video OFF;
END;
GO
