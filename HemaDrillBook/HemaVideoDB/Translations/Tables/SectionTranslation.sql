CREATE TABLE Translations.SectionTranslation
(
    SectionKey INT NOT NULL
        CONSTRAINT FK_SectionTranslation_Section
        REFERENCES Sources.Section (SectionKey),
    TranslationKey INT NOT NULL
        CONSTRAINT FK_SectionTranslation_Translation
        REFERENCES Translations.Translation (TranslationKey),
    Translation NVARCHAR(MAX) NOT NULL
        CONSTRAINT C_SectionTranslation_Translation CHECK (LEN(Translation) > 0),
    CreatedByUserKey INT NOT NULL
        REFERENCES dbo.AspNetUsers (UserKey),
    CreatedDate DATETIME2(7) NOT NULL
        CONSTRAINT D_SectionTranslation_CreatedDate
            DEFAULT (GETUTCDATE()),
    ModifiedByUserKey INT NOT NULL
        REFERENCES dbo.AspNetUsers (UserKey),
    ModifiedDate DATETIME2(7) NOT NULL
        CONSTRAINT D_SectionTranslation_ModifiedDate
            DEFAULT (GETUTCDATE()),
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime),
    CONSTRAINT PK_SectionTranslation
        PRIMARY KEY (
                        SectionKey,
                        TranslationKey
                    )
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Translations.SectionTranslation_History));
GO
GRANT SELECT, INSERT, UPDATE, DELETE ON Translations.SectionTranslation TO HemaWeb;