IF $(OneTimeLoad) = 1
BEGIN

DECLARE @Translator TABLE
(
TranslatorKey int NOT NULL PRIMARY KEY,
TranslatorName nvarchar(100) NOT NULL,
CreatedByUserKey int NOT NULL,
CreatedDate datetime2(7) NOT NULL,
ModifiedByUserKey int NOT NULL,
ModifiedDate datetime2(7) NOT NULL

);

INSERT INTO @Translator
(  TranslatorKey,
TranslatorName,
CreatedByUserKey,
CreatedDate,
ModifiedByUserKey,
ModifiedDate )
VALUES

(1, N'Eric Myers and Steve Hick', -1, '2018-04-24T03:55:39.6733333', -1, '2018-04-24T03:55:39.6733333'),
(2, N'Jeffrey Forgeng', -1, '2018-04-24T05:24:19.1066667', -1, '2018-04-24T05:24:19.1066667'),
(3, N'Joey  Nitti', -1, '2018-04-24T05:24:19.1066667', -1, '2018-04-24T05:24:19.1066667'),
(4, N'Tom Leoni', -1, '2018-04-24T05:24:19.1066667', -1, '2018-04-24T05:24:19.1066667'),
(5, N'Eric Myers and Steve Hick', -1, '2018-04-24T05:24:56.4066667', -1, '2018-04-24T05:24:56.4066667'),
(6, N'Dieter Bachmann', -1, '2018-04-24T05:37:59.4466667', -1, '2018-04-24T05:37:59.4466667')

;
SET IDENTITY_INSERT Translations.Translator ON;


MERGE INTO Translations.Translator t
USING @Translator s
ON t.TranslatorKey = s.TranslatorKey
WHEN NOT MATCHED THEN
    INSERT
(  TranslatorKey,
TranslatorName,
CreatedByUserKey,
CreatedDate,
ModifiedByUserKey,
ModifiedDate )
    VALUES
    (  s.TranslatorKey,
s.TranslatorName,
s.CreatedByUserKey,
s.CreatedDate,
s.ModifiedByUserKey,
s.ModifiedDate )
WHEN MATCHED THEN
    UPDATE SET  TranslatorName = s.TranslatorName,
CreatedByUserKey = s.CreatedByUserKey,
CreatedDate = s.CreatedDate,
ModifiedByUserKey = s.ModifiedByUserKey,
ModifiedDate = s.ModifiedDate;

SET IDENTITY_INSERT Translations.Translator OFF;
END;
GO
