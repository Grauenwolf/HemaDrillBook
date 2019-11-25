CREATE VIEW Translations.SectionTranslationDetail
AS
SELECT bt.BookKey,
       st.SectionKey,
       st.Translation,
       bt.Copyright,
       st.TranslationKey,
       t.TranslatorName,
       bt.TranslatorKey,
	   bt.TranslationTitle
FROM Translations.SectionTranslation st
    INNER JOIN Sources.Section s
        ON s.SectionKey = st.SectionKey
    INNER JOIN Translations.Translation bt
        ON bt.BookKey = s.BookKey
           AND bt.TranslationKey = st.TranslationKey
    INNER JOIN Translations.Translator t
        ON t.TranslatorKey = bt.TranslatorKey;
GO
GRANT SELECT ON Translations.SectionTranslationDetail TO HemaWeb;
