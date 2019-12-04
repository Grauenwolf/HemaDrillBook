CREATE VIEW Search.BookByPlay
WITH SCHEMABINDING
AS
SELECT DISTINCT
       pd.BookKey,
       pd.BookName,
       pd.PlayKey
FROM Interpretations.PlayDetail pd;
GO
GRANT SELECT ON Search.BookByPlay TO HemaWeb;