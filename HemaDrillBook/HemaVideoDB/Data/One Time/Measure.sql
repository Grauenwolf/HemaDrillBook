DECLARE @Measure TABLE
(
    MeasureKey INT NOT NULL,
    MeasureName NVARCHAR(50) NOT NULL,
    AlternateMeasureName NVARCHAR(50) NULL
);

INSERT INTO @Measure
(
    MeasureKey,
    MeasureName,
    AlternateMeasureName
)
VALUES
(1, 'Larga', 'Wide'),
(2, 'Stretta', 'Narrow'),
(3 ,'First Instance', NULL),
(4 ,'Second Instance', NULL),
(5 ,'Third Instance', NULL),
(6,'Azioni Volanti', 'Flying Action'),
(7 ,'Dritta Via', NULL),
(8 ,'Fuori Misura', 'Out of Measure'),
(10 ,'Gioco Largo', 'Wide Game'),
(11 ,'Gioco Stretto', 'Narrow Game'),
(12 ,'Just Distance', NULL),
(13 ,'Media Proporcional', NULL), 
(14 ,'Misura Larga', 'Wide Measure'),
(15 ,'Misura Stretta', 'Narrow Measure'),
(16 ,'Narrow Measure', NULL),
(17 ,'Retta Linea', NULL),
(18 ,'Strettissma Misura', 'Narrowest Measure'),
(19 ,'Wide Measure', NULL),
(20 ,'Outside Measure', NULL),
(21, 'Zufechten', 'Onset')
;


MERGE INTO Tags.Measure t
USING @Measure s
ON t.MeasureKey = s.MeasureKey
WHEN NOT MATCHED THEN
    INSERT
    (
        MeasureKey,
        MeasureName,
        AlternateMeasureName
    )
    VALUES
    (s.MeasureKey, s.MeasureName, s.AlternateMeasureName)
WHEN MATCHED AND t.MeasureName != s.MeasureName
                 OR t.AlternateMeasureName != s.AlternateMeasureName THEN
    UPDATE SET MeasureName = s.MeasureName,
               AlternateMeasureName = s.AlternateMeasureName
WHEN NOT MATCHED BY SOURCE THEN
    DELETE;
