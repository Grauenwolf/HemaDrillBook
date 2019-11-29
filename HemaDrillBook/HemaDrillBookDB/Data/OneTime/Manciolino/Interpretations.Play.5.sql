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
ModifiedDate datetime2(7) NOT NULL,
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
ModifiedDate,
AGuardKey,
PGuardKey,
AGuardModifierKey,
PGuardModifierKey,
MeasureKey,
Notes )
VALUES

(3, 5015, NULL, 1, '2018-04-15T01:36:07.0566667', 1, '2018-04-15T01:36:07.0566667', 66, 66, NULL, NULL, NULL, NULL),
(4, 5016, NULL, 1, '2018-04-15T01:46:46.6100000', 1, '2018-04-15T01:46:46.6100000', 66, 66, NULL, NULL, NULL, NULL),
(7, 5017, NULL, 1, '2018-04-15T02:06:15.6233333', 1, '2018-04-15T02:06:15.6233333', 66, 66, NULL, NULL, NULL, NULL),
(8, 5018, NULL, 1, '2018-04-15T02:20:53.3100000', 1, '2018-04-15T02:20:53.3100000', 66, 66, NULL, NULL, NULL, NULL),
(9, 5019, NULL, 1, '2018-04-15T02:36:24.3133333', 1, '2018-04-15T02:36:24.3133333', 66, 66, NULL, NULL, NULL, NULL),
(10, 5020, NULL, 1, '2018-04-15T02:40:36.3466667', 1, '2018-04-15T02:40:36.3466667', 66, 66, NULL, NULL, NULL, NULL),
(11, 5021, NULL, 1, '2018-04-15T02:46:24.1633333', 1, '2018-04-15T02:46:24.1633333', 66, 66, NULL, NULL, NULL, NULL),
(12, 5022, NULL, 1, '2018-04-15T04:03:26.3000000', 1, '2018-04-15T04:03:26.3000000', 66, 66, NULL, NULL, NULL, NULL),
(13, 5023, NULL, 1, '2018-04-15T04:03:49.9733333', 1, '2018-04-15T04:03:49.9733333', 66, 66, NULL, NULL, NULL, NULL),
(14, 5025, NULL, 1, '2018-04-15T06:09:22.2400000', 1, '2018-04-15T06:09:22.2400000', 73, 73, NULL, NULL, NULL, NULL),
(15, 5026, NULL, 1, '2018-04-15T06:20:41.4300000', 1, '2018-04-15T06:20:41.4300000', 73, 73, NULL, NULL, NULL, NULL),
(16, 5027, NULL, 1, '2018-04-15T06:26:39.0066667', 1, '2018-04-15T06:26:39.0066667', 73, 73, NULL, NULL, NULL, NULL),
(17, 5028, NULL, 1, '2018-04-15T06:30:33.4200000', 1, '2018-04-15T06:30:33.4200000', 73, 73, NULL, NULL, NULL, NULL),
(18, 5029, NULL, 1, '2018-04-15T06:33:55.0633333', 1, '2018-04-15T06:33:55.0633333', 73, 73, NULL, NULL, NULL, NULL),
(37, 5031, NULL, 1, '2018-04-17T21:45:44.3700000', 1, '2018-04-17T21:45:44.3700000', 69, 69, NULL, NULL, NULL, NULL),
(38, 5032, NULL, 1, '2018-04-17T21:47:37.3900000', 1, '2018-04-17T21:47:37.3900000', 69, 69, NULL, NULL, NULL, NULL),
(39, 5033, NULL, 1, '2018-04-17T21:52:00.2500000', 1, '2018-04-17T21:52:00.2500000', 69, 69, NULL, NULL, NULL, NULL),
(40, 5034, NULL, 1, '2018-04-17T21:53:18.8166667', 1, '2018-04-17T21:53:18.8166667', 69, 69, NULL, NULL, NULL, NULL),
(41, 5035, NULL, 1, '2018-04-17T21:57:35.7500000', 1, '2018-04-17T21:57:35.7500000', 69, 69, NULL, NULL, NULL, NULL),
(42, 5037, NULL, 1, '2018-04-17T23:13:38.4200000', 1, '2018-04-17T23:13:38.4200000', 71, 71, NULL, NULL, NULL, NULL),
(43, 5038, NULL, 1, '2018-04-17T23:24:22.9100000', 1, '2018-04-17T23:24:22.9100000', 71, 71, NULL, NULL, NULL, NULL),
(44, 5039, NULL, 1, '2018-04-17T23:31:07.0733333', 1, '2018-04-17T23:31:07.0733333', 71, 71, NULL, NULL, NULL, NULL),
(45, 5040, NULL, 1, '2018-04-17T23:36:43.9500000', 1, '2018-04-17T23:36:43.9500000', 71, 71, NULL, NULL, NULL, NULL)

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