CREATE TABLE Translations.Translation
(	
	TranslationKey INT IDENTITY CONSTRAINT PK_Translation PRIMARY KEY,
    BookKey INT NOT NULL
        CONSTRAINT FK_Translation_Book
        REFERENCES Sources.Book (BookKey),
    TranslatorKey INT NOT NULL
        CONSTRAINT FK_Translation_Translator
        REFERENCES Translations.Translator (TranslatorKey),
	TranslationTitle NVARCHAR(200) NULL
        CONSTRAINT C_Translation_TranslationTitle CHECK (LEN(TranslationTitle) > 0),
	TranslationUrl NVARCHAR(300) NULL
        CONSTRAINT C_Translation_Url CHECK (LEN(TranslationUrl) > 0),
    Copyright NVARCHAR(MAX) NULL
        CONSTRAINT C_Translation_Copyright CHECK (LEN(Copyright) > 0),
    CreatedByUserKey INT NOT NULL
        REFERENCES dbo.AspNetUsers (UserKey),
    CreatedDate DATETIME2(7) NOT NULL
        CONSTRAINT D_Translation_CreatedDate
            DEFAULT (GETUTCDATE()),
    ModifiedByUserKey INT NOT NULL
        REFERENCES dbo.AspNetUsers (UserKey),
    ModifiedDate DATETIME2(7) NOT NULL
        CONSTRAINT D_Translation_ModifiedDate
            DEFAULT (GETUTCDATE()),
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime),
	CONSTRAINT C_Translation_Purchase CHECK (TranslationTitle IS NOT NULL OR TranslationUrl IS NULL) -- URL needs a title
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Translations.Translation_History));

