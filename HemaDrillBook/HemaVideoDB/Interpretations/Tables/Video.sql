CREATE TABLE Interpretations.Video
(
    VideoKey INT NOT NULL IDENTITY
        CONSTRAINT PK_Video PRIMARY KEY,
    SectionKey INT NOT NULL
        CONSTRAINT FK_Video_SectionKey
        REFERENCES Sources.Section (SectionKey),
    VideoServiceKey INT NOT NULL
        REFERENCES Interpretations.VideoService (VideoServiceKey),
    VideoServiceVideoId VARCHAR(11) NULL,
    Url NVARCHAR(500) NULL,
    StartTime TIME NULL,
    CreatedByUserKey INT NOT NULL
        REFERENCES dbo.AspNetUsers (UserKey),
    CreatedDate DATETIME2(7) NOT NULL
        CONSTRAINT D_Video_CreateDate
            DEFAULT (GETUTCDATE()),
    ModifiedByUserKey INT NULL
        REFERENCES dbo.AspNetUsers (UserKey),
    ModifiedDate DATETIME2(7) NOT NULL
        CONSTRAINT D_Video_ModifiedDate
            DEFAULT (GETUTCDATE()),
    Author NVARCHAR(250) NULL
        CONSTRAINT C_Video_Author CHECK (LEN(Author) > 0),
    Description NVARCHAR(250) NULL
        CONSTRAINT C_Video_Description CHECK (LEN(Description) > 0),
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Interpretations.Video_History) );

GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description',
                                @value = N'The service-specific video key or ID',
                                @level0type = N'SCHEMA',
                                @level0name = N'Interpretations',
                                @level1type = N'TABLE',
                                @level1name = N'Video',
                                @level2type = N'COLUMN',
                                @level2name = 'VideoServiceVideoId';

GO

CREATE UNIQUE NONCLUSTERED INDEX UX_Video_NoDup
ON Interpretations.Video
(
    SectionKey,
    VideoServiceKey,
    VideoServiceVideoId
)
WHERE StartTime IS NULL;
GO
CREATE UNIQUE NONCLUSTERED INDEX UX_Video_NoDup2
ON Interpretations.Video
(
    SectionKey,
    VideoServiceKey,
    VideoServiceVideoId,
    StartTime
);

GO
GRANT SELECT, INSERT, UPDATE ON Interpretations.Video TO HemaWeb;