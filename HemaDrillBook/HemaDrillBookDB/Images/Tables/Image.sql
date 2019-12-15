CREATE TABLE Images.Image
(
    ImageKey INT NOT NULL IDENTITY
        CONSTRAINT PK_ImageKey PRIMARY KEY,
    ImageName NVARCHAR(100) NOT NULL
        CONSTRAINT C_Image_ImageName CHECK (LEN(RTRIM(ImageName)) > 0),
    FileName VARCHAR(50) NOT NULL
        CONSTRAINT C_Image_FileName CHECK (LEN(RTRIM(FileName)) > 0),
    FileSize INT NOT NULL
        CONSTRAINT C_Image_FileSize CHECK (FileSize > 0),
    CreatedByUserKey INT NOT NULL
        CONSTRAINT FK_Image_CreatedByUserKey
        REFERENCES Accounts.AspNetUsers (UserKey),
    CreatedDate DATETIME2(7) NOT NULL
        CONSTRAINT D_Image_CreateDate
            DEFAULT (GETUTCDATE()),
    ModifiedByUserKey INT NOT NULL
        CONSTRAINT FK_Image_ModifiedByUserKey
        REFERENCES Accounts.AspNetUsers (UserKey),
    ImageSetKey INT NULL
        CONSTRAINT FK_Image_ImageSet
        REFERENCES Images.ImageSet (ImageSetKey),
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Images.Image_History));
GO
GRANT INSERT, UPDATE, SELECT, DELETE ON Images.Image TO HemaWeb;
GO
CREATE UNIQUE INDEX UX_Image_ImageSet_FileName ON Images.Image(ImageSetKey, FileName) WHERE ImageSetKey IS NOT NULL;
GO
CREATE UNIQUE INDEX UX_Image_ImageSet_ImageName ON Images.Image(ImageSetKey, ImageName) WHERE ImageSetKey IS NOT NULL;