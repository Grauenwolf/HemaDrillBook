CREATE TABLE Images.ImageSectionMap
(
    ImageKey INT NOT NULL
        CONSTRAINT FK_ImageSectionMap_ImageKey
        REFERENCES Images.Image (ImageKey),
    SectionKey INT NOT NULL
        CONSTRAINT FK_ImageSectionMap_SectionKey
        REFERENCES Sources.Section (SectionKey),
    IsPrimaryImage BIT NOT NULL,
    CreatedByUserKey INT NOT NULL
        CONSTRAINT FK_ImageSectionMap_CreatedByUserKey
        REFERENCES Accounts.AspNetUsers (UserKey),
    CreatedDate DATETIME2(7) NOT NULL
        CONSTRAINT D_ImageSectionMap_CreateDate
            DEFAULT (GETUTCDATE()),
    ModifiedByUserKey INT NOT NULL
        CONSTRAINT FK_ImageSectionMap_ModifiedByUserKey
        REFERENCES Accounts.AspNetUsers (UserKey),
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime),
    CONSTRAINT PK_ImageSectionMap
        PRIMARY KEY (
                        ImageKey,
                        SectionKey
                    )
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Images.ImageSectionMap_History));

GO
CREATE UNIQUE INDEX UX_ImageSectionMap_PrimaryImage
ON Images.ImageSectionMap (SectionKey)
WHERE IsPrimaryImage = 1;
GO

GRANT INSERT, UPDATE, DELETE, SELECT ON Images.ImageSectionMap TO HemaWeb;
GO
