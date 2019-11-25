CREATE VIEW Interpretations.TechniquesByBook
AS
SELECT A.BookKey,
       COUNT(A.PlayKey) AS PlayCount,
       A.[Key],
       A.Name,
       A.AlternateName
FROM
(
    SELECT pd.BookKey,
           psd.PlayKey,
           psd.TechniqueKey1 AS [Key],
           psd.TechniqueName1 AS Name,
           psd.AlternateTechniqueName1 AS AlternateName
    FROM Interpretations.PlayStepDetail psd
        INNER JOIN Interpretations.PlayDetail pd
            ON psd.PlayKey = pd.PlayKey
    WHERE psd.TechniqueKey1 IS NOT NULL
    UNION
    SELECT pd.BookKey,
           psd.PlayKey,
           psd.TechniqueKey2,
           psd.TechniqueName2,
           psd.AlternateTechniqueName2
    FROM Interpretations.PlayStepDetail psd
        INNER JOIN Interpretations.PlayDetail pd
            ON psd.PlayKey = pd.PlayKey
    WHERE psd.TechniqueKey2 IS NOT NULL
    UNION
    SELECT pd.BookKey,
           psd.PlayKey,
           psd.TechniqueKey3,
           psd.TechniqueName3,
           psd.AlternateTechniqueName3
    FROM Interpretations.PlayStepDetail psd
        INNER JOIN Interpretations.PlayDetail pd
            ON psd.PlayKey = pd.PlayKey
    WHERE psd.TechniqueKey3 IS NOT NULL
) A
GROUP BY A.BookKey,
		 A.[Key],
         A.Name,
         A.AlternateName;
		 GO
GRANT SELECT ON Interpretations.TechniquesByBook TO HemaWeb;
