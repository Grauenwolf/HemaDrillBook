CREATE VIEW Search.MeasureByPlay
WITH SCHEMABINDING
AS
SELECT m.MeasureKey,
       m.MeasureName,
       m.AlternateMeasureName,
       p.PlayKey
FROM Tags.Measure m
    INNER JOIN Interpretations.Play p
        ON m.MeasureKey = p.MeasureKey;

GO
GRANT SELECT ON Search.MeasureByPlay TO HemaWeb;