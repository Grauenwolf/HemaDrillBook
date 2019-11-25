CREATE VIEW Interpretations.TargetsByBook
AS
SELECT A.BookKey,
       COUNT(A.PlayKey) AS PlayCount,
       A.[Key],
       A.Name,
       NULL AS AlternateName
FROM
(
    SELECT pd.BookKey,
           psd.PlayKey,
           psd.TargetKey1 AS [Key],
           psd.TargetName1 AS Name
    FROM Interpretations.PlayStepDetail psd
        INNER JOIN Interpretations.PlayDetail pd
            ON psd.PlayKey = pd.PlayKey
    WHERE psd.TargetKey1 IS NOT NULL
    UNION
    SELECT pd.BookKey,
           psd.PlayKey,
           psd.TargetKey2,
           psd.TargetName2
    FROM Interpretations.PlayStepDetail psd
        INNER JOIN Interpretations.PlayDetail pd
            ON psd.PlayKey = pd.PlayKey
    WHERE psd.TargetKey2 IS NOT NULL
    UNION
    SELECT pd.BookKey,
           psd.PlayKey,
           psd.TargetKey3,
           psd.TargetName3
    FROM Interpretations.PlayStepDetail psd
        INNER JOIN Interpretations.PlayDetail pd
            ON psd.PlayKey = pd.PlayKey
    WHERE psd.TargetKey3 IS NOT NULL
) A
GROUP BY A.BookKey,
		 A.[Key],
         A.Name;

		 GO
GRANT SELECT ON Interpretations.TargetsByBook TO HemaWeb;
