CREATE TABLE Translations.Translator
(
    TranslatorKey INT NOT NULL IDENTITY
        CONSTRAINT PK_Translator PRIMARY KEY,
    TranslatorName NVARCHAR(100) NOT NULL
        CONSTRAINT C_Translator_Name CHECK (LEN(TranslatorName) > 0),
    CreatedByUserKey INT NOT NULL
        REFERENCES dbo.AspNetUsers (UserKey),
    CreatedDate DATETIME2(7) NOT NULL
        CONSTRAINT D_Translator_CreatedDate
            DEFAULT (GETUTCDATE()),
    ModifiedByUserKey INT NOT NULL
        REFERENCES dbo.AspNetUsers (UserKey),
    ModifiedDate DATETIME2(7) NOT NULL
        CONSTRAINT D_Translator_ModifiedDate
            DEFAULT (GETUTCDATE()),
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Translations.Translator_History));

