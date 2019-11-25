CREATE VIEW Translations.TranslationDetail
AS
SELECT bt.TranslationKey,
       bt.BookKey,
       bt.TranslatorKey,
       bt.TranslationTitle,
       bt.TranslationUrl,
       bt.Copyright,
       t.TranslatorName
FROM Translations.Translation bt
    LEFT JOIN Translations.Translator t
        ON t.TranslatorKey = bt.TranslatorKey;
GO
GRANT SELECT ON Translations.TranslationDetail TO HemaWeb;
