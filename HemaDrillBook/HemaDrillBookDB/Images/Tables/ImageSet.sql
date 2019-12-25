CREATE TABLE Images.ImageSet
(
    ImageSetKey INT NOT NULL IDENTITY
        CONSTRAINT PK_ImageSet PRIMARY KEY,
    ImageSetName NVARCHAR(50) NOT NULL
        CONSTRAINT C_ImageSet_ImageSetName CHECK (LEN(ImageSetName) > 0),
    PartKey INT NOT NULL
        CONSTRAINT FK_ImageSet_PartKey
        REFERENCES Sources.Part (PartKey),
    CopyrightHolder NVARCHAR(100) NULL
        CONSTRAINT C_ImageSet_CopyrightHolder CHECK (LEN(CopyrightHolder) > 0),
    Copyright NVARCHAR(MAX) NULL
        CONSTRAINT C_ImageSet_Copyright CHECK (LEN(Copyright) > 0),
    CreatedByUserKey INT NOT NULL
        CONSTRAINT FK_ImageSet_CreatedByUserKey
        REFERENCES Accounts.AspNetUsers (UserKey),
    CreatedDate DATETIME2(7) NOT NULL
        CONSTRAINT D_ImageSet_CreateDate
            DEFAULT (GETUTCDATE()),
    ModifiedByUserKey INT NOT NULL
        CONSTRAINT FK_ImageSet_ModifiedByUserKey
        REFERENCES Accounts.AspNetUsers (UserKey),
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Images.ImageSet_History));
