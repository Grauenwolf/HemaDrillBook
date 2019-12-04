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
    (1701, 2003, 1, 'cVG6ogstW_U', N'https://youtu.be/cVG6ogstW_U', NULL, 1, '2018-04-18T00:24:21.3633333', 1,
     '2018-04-18T00:24:21.3633333', NULL, NULL),
    (608, 2005, 0, NULL, N'https://www.facebook.com/ran.pleasant/videos/vb.1372164826/10207276867504604/?type=3', NULL,
     1, '2018-03-23T17:58:20.6333333', NULL, '2018-04-12T03:57:36.5000000', N'Ran Pleasant', N'Under-Arm vs Krucke'),
    (710, 2016, 0, NULL, N'https://www.facebook.com/FiddlebowFechtschule/videos/593767287455133/', NULL, 1,
     '2018-04-01T19:49:52.1600000', NULL, '2018-04-12T03:57:36.5000000', NULL,
     N'More Mysteries of the Inverted Buckler Hand'),
    (711, 2017, 0, NULL, N'https://www.facebook.com/FiddlebowFechtschule/videos/593767287455133/', NULL, 1,
     '2018-04-01T19:50:13.1033333', NULL, '2018-04-12T03:57:36.5000000', NULL,
     N'More Mysteries of the Inverted Buckler Hand'),
    (707, 2029, 0, NULL, N'https://www.facebook.com/FiddlebowFechtschule/videos/834280810070445/', NULL, 1,
     '2018-04-01T19:36:47.5700000', NULL, '2018-04-12T03:57:36.5000000', NULL, N'Mutatio Rising'),
    (303, 2901, 1, '0IY7KlhASj8', N'https://www.youtube.com/watch?v=0IY7KlhASj8', NULL, 1,
     '2018-03-23T06:25:17.5333333', NULL, '2018-04-12T03:57:36.5000000', NULL, NULL),
    (709, 2902, 0, NULL, N'https://www.facebook.com/FiddlebowFechtschule/videos/617515245080337/', NULL, 1,
     '2018-04-01T19:44:35.0766667', NULL, '2018-04-12T03:57:36.5000000', NULL, N'How to wear a tunic'),
    (708, 2903, 0, NULL, N'https://www.facebook.com/FiddlebowFechtschule/videos/665335513631643/', NULL, 1,
     '2018-04-01T19:39:32.7033333', NULL, '2018-04-12T03:57:36.5000000', NULL, N'Prima Is Not The Loneliest Number');
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
