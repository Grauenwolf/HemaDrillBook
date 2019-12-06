IF $(OneTimeLoad) = 1
BEGIN

DECLARE @Play TABLE
(
PlayKey int NOT NULL PRIMARY KEY,
SectionKey int NOT NULL,
VariantName nvarchar(200) NULL,
CreatedByUserKey int NOT NULL,
CreatedDate datetime2(7) NOT NULL,
ModifiedByUserKey int NOT NULL,
AGuardKey int NULL,
PGuardKey int NULL,
AGuardModifierKey int NULL,
PGuardModifierKey int NULL,
MeasureKey int NULL,
Notes nvarchar(max) NULL

);

INSERT INTO @Play
(  PlayKey,
SectionKey,
VariantName,
CreatedByUserKey,
CreatedDate,
ModifiedByUserKey,
AGuardKey,
PGuardKey,
AGuardModifierKey,
PGuardModifierKey,
MeasureKey,
Notes )
VALUES

(46, 7004, NULL, 1, '2018-04-23T04:48:40.4466667', 1, 33, NULL, 6, NULL, NULL, NULL),
(47, 7004, N'Patient disengages', 1, '2018-04-23T04:51:03.2333333', 1, 33, NULL, 6, NULL, NULL, NULL),
(19, 7007, NULL, 1, '2018-04-15T06:48:47.1233333', 1, 37, NULL, 5, NULL, 20, NULL),
(20, 7007, N'Directed at your point A', 1, '2018-04-15T07:15:47.6600000', 1, 37, NULL, 5, NULL, 20, NULL),
(21, 7007, N'Directed at your point B', 1, '2018-04-15T07:17:41.8633333', 1, 37, NULL, 5, NULL, 20, NULL),
(22, 7008, N'A: Without Parry', 1, '2018-04-15T07:25:05.2033333', 1, 37, NULL, NULL, NULL, NULL, NULL),
(23, 7008, N'B: With Parry', 1, '2018-04-15T07:26:45.6066667', 1, 37, NULL, NULL, NULL, NULL, NULL),
(24, 7023, NULL, 1, '2018-04-15T07:31:49.2600000', 1, 40, 40, 5, NULL, 14, NULL),
(25, 7023, N'Variant: Common Fencer 1', 1, '2018-04-15T07:38:09.0900000', 1, 40, 40, 6, NULL, 14, NULL),
(26, 7023, N'Variant: Common Fencer 2', 1, '2018-04-15T07:38:55.1600000', 1, 40, 40, 6, NULL, 14, NULL),
(27, 7023, N'Variant: Preferred', 1, '2018-04-15T07:43:19.7333333', 1, 40, 40, 6, NULL, 14, NULL),
(48, 7024, NULL, 1, '2018-04-23T05:03:52.2733333', 1, 40, 40, 5, 5, NULL, NULL),
(49, 7024, N'Alternate Play', 1, '2018-04-23T05:05:54.3266667', 1, 40, 40, 5, 5, NULL, NULL),
(50, 7025, NULL, 1, '2018-04-23T05:10:51.8300000', 1, NULL, NULL, NULL, NULL, 14, NULL)

;
SET IDENTITY_INSERT Interpretations.Play ON;


MERGE INTO Interpretations.Play t
USING @Play s
ON t.PlayKey = s.PlayKey
WHEN NOT MATCHED THEN
    INSERT
(  PlayKey,
SectionKey,
VariantName,
CreatedByUserKey,
CreatedDate,
ModifiedByUserKey,
AGuardKey,
PGuardKey,
AGuardModifierKey,
PGuardModifierKey,
MeasureKey,
Notes )
    VALUES
    (  s.PlayKey,
s.SectionKey,
s.VariantName,
s.CreatedByUserKey,
s.CreatedDate,
s.ModifiedByUserKey,
s.AGuardKey,
s.PGuardKey,
s.AGuardModifierKey,
s.PGuardModifierKey,
s.MeasureKey,
s.Notes )
WHEN MATCHED THEN
    UPDATE SET  SectionKey = s.SectionKey,
VariantName = s.VariantName,
CreatedByUserKey = s.CreatedByUserKey,
CreatedDate = s.CreatedDate,
ModifiedByUserKey = s.ModifiedByUserKey,
AGuardKey = s.AGuardKey,
PGuardKey = s.PGuardKey,
AGuardModifierKey = s.AGuardModifierKey,
PGuardModifierKey = s.PGuardModifierKey,
MeasureKey = s.MeasureKey,
Notes = s.Notes;

SET IDENTITY_INSERT Interpretations.Play OFF;
END;
GO
