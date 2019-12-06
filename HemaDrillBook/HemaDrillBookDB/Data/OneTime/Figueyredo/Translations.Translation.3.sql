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
    (7, 3, 1, NULL, NULL,
     N'Users may, without further permission, display, save, and print this work for personal, non commercial use, provided that the copyright notice is not severed from the work. Libraries may store this material and non commercially redistribute it to their patrons in electronic or printed form for personal, non commercial use, provided that the copyright notice is not severed from the work.',
     -1 , '2018-04-24T05:24:56.4066667', -1, '2018-04-24T05:24:56.4066667');
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
        UPDATE SET t.BookKey = s.BookKey,
                   t.TranslatorKey = s.TranslatorKey,
                   t.TranslationTitle = s.TranslationTitle,
                   t.TranslationUrl = s.TranslationUrl,
                   t.Copyright = s.Copyright,
                   t.CreatedByUserKey = s.CreatedByUserKey,
                   t.CreatedDate = s.CreatedDate,
                   t.ModifiedByUserKey = s.ModifiedByUserKey;

    SET IDENTITY_INSERT Translations.Translation OFF;
END;
GO
