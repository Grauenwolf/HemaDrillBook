IF $(OneTimeLoad) = 1
BEGIN


DECLARE @Target TABLE
(
TargetKey int PRIMARY KEY,
TargetName nvarchar(50) NOT NULL

);

INSERT INTO @Target
(  TargetKey,
TargetName )
VALUES

(1, N'Head'),
(2, N'Hands'),
(3, N'Rigth Arm'),
(4, N'Left Arm'),
(5, N'Leg'),
(6, N'Left Leg'),
(7, N'Right Leg'),
(8, N'Arms'),
(9, N'Chest'),
(10, N'Face'),
(11, N'Left Ear'),
(12, N'Right Ear'),
(13, N'Left Thigh'),
(14, N'Right Thigh'),
(15, N'Right Hand'),
(16, N'Left Hand'),
(17, N'Thigh'),
(18, N'Right Side'),
(19, N'Left Side'),
(20, N'Flank'),
(21, N'Sword'),
(23, N'Temple'),
(24, N'Right Temple'),
(25, N'Left Temple'),
(26, N'Upper-Left Opening'),
(27, N'Left Head'),
(28, N'Upper-Right Opening'),
(29, N'Lower-Left Opening'),
(30, N'Lower-Right Opening'),
(31, N'Wrist'),
(32, N'Elbow'),
(33, N'Arm (Unspecified)'),
(34, N'Nearest Opening')

;

SET IDENTITY_INSERT Tags.Target ON;

MERGE INTO Tags.Target t
USING @Target s
ON t.TargetKey = s.TargetKey
WHEN NOT MATCHED THEN
    INSERT
(  TargetKey,
TargetName )
    VALUES
    (  s.TargetKey,
s.TargetName )
WHEN MATCHED THEN
    UPDATE SET  TargetName = s.TargetName;

SET IDENTITY_INSERT Tags.Target OFF;


END
GO
