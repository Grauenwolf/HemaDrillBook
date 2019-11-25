CREATE VIEW Interpretations.GuardsByBook
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
           psd.GuardKey AS [Key],
           psd.GuardName AS Name,
           psd.AlternateGuardName AS AlternateName
    FROM Interpretations.PlayStepDetail psd
        INNER JOIN Interpretations.PlayDetail pd
            ON psd.PlayKey = pd.PlayKey
    WHERE psd.GuardKey IS NOT NULL
    UNION
    SELECT pd.BookKey,
           psd.PlayKey,
           psd.IntermediateGuardKey,
           psd.IntermediateGuardName,
           psd.IntermediateAlternateGuardName
    FROM Interpretations.PlayStepDetail psd
        INNER JOIN Interpretations.PlayDetail pd
            ON psd.PlayKey = pd.PlayKey
    WHERE psd.IntermediateGuardKey IS NOT NULL
    UNION
    SELECT pd.BookKey,
           pd.PlayKey,
           pd.AGuardKey,
           pd.AGuardName,
           pd.AAlternateGuardName
    FROM Interpretations.PlayDetail pd
    WHERE pd.AGuardKey IS NOT NULL
    UNION
    SELECT pd.BookKey,
           pd.PlayKey,
           pd.PGuardKey,
           pd.PGuardName,
           pd.PAlternateGuardName
    FROM Interpretations.PlayDetail pd
    WHERE pd.PGuardKey IS NOT NULL
) A
GROUP BY A.BookKey,
		 A.[Key],
         A.Name,
         A.AlternateName;
		 GO
GRANT SELECT ON Interpretations.GuardsByBook TO HemaWeb;