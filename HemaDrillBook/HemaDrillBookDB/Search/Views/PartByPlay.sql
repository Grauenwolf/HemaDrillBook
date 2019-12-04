CREATE VIEW Search.PartByPlay
WITH SCHEMABINDING
AS
SELECT DISTINCT
       pd.PartKey,
       pd.PartName,
	   pd.BookKey,
       pd.PlayKey,
	   p.DisplayOrder
FROM Interpretations.PlayDetail pd
INNER JOIN Sources.Part p ON pd.PartKey = p.PartKey
;
GO
GRANT SELECT ON Search.PartByPlay TO HemaWeb;
