DECLARE @Target TABLE
(
    TargetKey INT NOT NULL,
    TargetName NVARCHAR(50) NOT NULL
);



INSERT INTO @Target
(
    TargetKey,
    TargetName
)
VALUES
(1, 'Head'),
(2, 'Hands'),
(3, 'Rigth Arm'),
(4, 'Left Arm'),
(5, 'Leg'),
(6, 'Left Leg'),
(7, 'Right Leg'),
(8, 'Arms'),
(9, 'Chest'),
(10, 'Face'),
(11, 'Left Ear'),
(12, 'Right Ear'),
(13, 'Left Thigh'),
(14, 'Right Thigh'),
(15, 'Right Hand'),
(16, 'Left Hand'),
(17, 'Thigh'),
(18, 'Right Side'),
(19, 'Left Side'),
(20, 'Flank'),
(21, 'Sword');

MERGE INTO Tags.Target t
USING @Target s
ON t.TargetKey = s.TargetKey
WHEN NOT MATCHED THEN
    INSERT
    (
        TargetKey,
        TargetName
    )
    VALUES
    (s.TargetKey, s.TargetName)
WHEN MATCHED AND t.TargetName != s.TargetName THEN
    UPDATE SET t.TargetName = s.TargetName
WHEN NOT MATCHED BY SOURCE THEN
    DELETE;
