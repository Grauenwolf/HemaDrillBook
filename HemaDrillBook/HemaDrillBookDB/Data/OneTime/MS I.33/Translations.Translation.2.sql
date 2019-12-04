IF $(OneTimeLoad) = 1
BEGIN

    DECLARE @Translation TABLE
    (
        TranslationKey INT NOT NULL PRIMARY KEY,
        BookKey INT NOT NULL,
        TranslatorKey INT NOT NULL,
        TranslationTitle NVARCHAR(200) NULL,
        TranslationUrl NVARCHAR(300) NULL,
        Copyright NVARCHAR(MAX) NULL,
        CreatedByUserKey INT NOT NULL,
        CreatedDate DATETIME2(7) NOT NULL,
        ModifiedByUserKey INT NOT NULL,
        ModifiedDate DATETIME2(7) NOT NULL
    );

    INSERT INTO @Translation
    (
        TranslationKey,
        BookKey,
        TranslatorKey,
        TranslationTitle,
        TranslationUrl,
        Copyright,
        CreatedByUserKey,
        CreatedDate,
        ModifiedByUserKey,
        ModifiedDate
    )
    VALUES
    (2, 2, 2, N'The Medieval Art of Swordsmanship: Royal Armouries MS I.33',
     N'https://www.amazon.com/Medieval-Art-Swordsmanship-Royal-Armouries/dp/0948092858', NULL, -1,
     '2018-04-24T05:24:19.1233333', -1, '2018-04-24T05:24:19.1233333'),
    (3, 2, 3, N'Royal  Armouries Ms.  I.33', N'https://hemastudy.wordpress.com/2016/05/05/new-translation-of-ms-i-33/',
     NULL, -1, '2018-04-24T05:24:19.1233333', -1, '2018-04-24T05:24:19.1233333'),
    (8, 2, 6, N'Lutgeri de arte dimicatoria', N'http://schwertfechten.ch/html/i33/i33en.html', NULL, -1,
     '2018-04-24T05:39:44.0600000', -1, '2018-04-24T05:39:44.0600000');
    SET IDENTITY_INSERT Translations.Translation ON;


    MERGE INTO Translations.Translation t
    USING @Translation s
    ON t.TranslationKey = s.TranslationKey
    WHEN NOT MATCHED THEN
        INSERT
        (
            TranslationKey,
            BookKey,
            TranslatorKey,
            TranslationTitle,
            TranslationUrl,
            Copyright,
            CreatedByUserKey,
            CreatedDate,
            ModifiedByUserKey
        )
        VALUES
        (s.TranslationKey, s.BookKey, s.TranslatorKey, s.TranslationTitle, s.TranslationUrl, s.Copyright,
         s.CreatedByUserKey, s.CreatedDate, s.ModifiedByUserKey)
    WHEN MATCHED THEN
        UPDATE SET BookKey = s.BookKey,
                   TranslatorKey = s.TranslatorKey,
                   TranslationTitle = s.TranslationTitle,
                   TranslationUrl = s.TranslationUrl,
                   Copyright = s.Copyright,
                   CreatedByUserKey = s.CreatedByUserKey,
                   CreatedDate = s.CreatedDate,
                   ModifiedByUserKey = s.ModifiedByUserKey;

    SET IDENTITY_INSERT Translations.Translation OFF;
END;
GO
