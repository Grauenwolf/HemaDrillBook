
DECLARE @Measure TABLE
(
MeasureKey int PRIMARY KEY,
MeasureName nvarchar(50),
AlternateMeasureName nvarchar(50) NULL

);

INSERT INTO @Measure
(  MeasureKey,
MeasureName,
AlternateMeasureName )
VALUES

(1, N'Larga', N'Wide'),
(2, N'Stretta', N'Narrow'),
(3, N'First Instance', NULL),
(4, N'Second Instance', NULL),
(5, N'Third Instance', NULL),
(6, N'Azioni Volanti', N'Flying Action'),
(7, N'Dritta Via', NULL),
(8, N'Fuori Misura', N'Out of Measure'),
(10, N'Gioco Largo', N'Wide Game'),
(11, N'Gioco Stretto', N'Narrow Game'),
(12, N'Just Distance', NULL),
(13, N'Media Proporcional', NULL),
(14, N'Misura Larga', N'Wide Measure'),
(15, N'Misura Stretta', N'Narrow Measure'),
(16, N'Narrow Measure', NULL),
(17, N'Retta Linea', NULL),
(18, N'Strettissma Misura', N'Narrowest Measure'),
(19, N'Wide Measure', NULL),
(20, N'Outside Measure', NULL),
(21, N'Zufechten', N'Onset'),
(22, N'Bind', NULL)

;

SET IDENTITY_INSERT Tags.Measure ON;

MERGE INTO Tags.Measure t
USING @Measure s
ON t.MeasureKey = s.MeasureKey
WHEN NOT MATCHED THEN
    INSERT
(  MeasureKey,
MeasureName,
AlternateMeasureName )
    VALUES
    (  s.MeasureKey,
s.MeasureName,
s.AlternateMeasureName )
WHEN MATCHED THEN
    UPDATE SET  MeasureName = s.MeasureName,
AlternateMeasureName = s.AlternateMeasureName;

SET IDENTITY_INSERT Tags.Measure OFF;

