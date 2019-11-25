CREATE VIEW Interpretations.MeasureByBook
AS
SELECT A.BookKey,
       COUNT(A.PlayKey) AS PlayCount,
       A.[Key],
       A.Name,
       AlternateName AS AlternateName
FROM
(
    SELECT pd.BookKey,
           pd.PlayKey,
           pd.MeasureKey AS [Key],
           pd.MeasureName AS Name,
		   pd.AlternateMeasureName AS AlternateName
    FROM Interpretations.PlayDetail pd
    WHERE pd.MeasureKey IS NOT NULL
) A
GROUP BY A.BookKey,
		 A.[Key],
         A.Name,
		 A.AlternateName;
		 GO
GRANT SELECT ON Interpretations.MeasureByBook TO HemaWeb;