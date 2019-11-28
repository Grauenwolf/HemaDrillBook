IF $(OneTimeLoad) = 1
BEGIN

DECLARE @Section TABLE
(
SectionKey int NOT NULL PRIMARY KEY,
PartKey int NOT NULL,
ParentSectionKey int NULL,
SectionName nvarchar(250) NOT NULL,
PageReference nvarchar(50) NULL,
DisplayOrder float NOT NULL,
SectionSlug varchar(50) NULL

);

INSERT INTO @Section
(  SectionKey,
PartKey,
ParentSectionKey,
SectionName,
PageReference,
DisplayOrder,
SectionSlug )
VALUES

(5246, 13, NULL, N'Play of Rotella and Partisan', NULL, 1, 'Rotella-Partisan'),
(5247, 13, 5246, N'Play 1', NULL, 1, 'Rotella-1'),
(5248, 13, 5246, N'Play 2', NULL, 2, 'Rotella-2'),
(5249, 13, 5246, N'Play 3', NULL, 3, 'Rotella-3'),
(5250, 13, 5246, N'Play 4', NULL, 4, 'Rotella-4'),
(5251, 13, 5246, N'Play 5', NULL, 5, 'Rotella-5'),
(5252, 13, NULL, N'Another Play of Rotella and Partisan', NULL, 2, 'Another-Rotella-Partisan'),
(5253, 13, 5252, N'Play 1', NULL, 1, 'Another-1'),
(5254, 13, 5252, N'Play 2', NULL, 2, 'Another-2'),
(5255, 13, 5252, N'Play 3', NULL, 3, 'Another-3'),
(5256, 13, NULL, N'Play of Single Partisan', NULL, 3, 'Partisan'),
(5257, 13, 5256, N'Play 1', NULL, 1, 'Partisan-1'),
(5258, 13, 5256, N'Play 2', NULL, 2, 'Partisan-2'),
(5259, 13, 5256, N'Play 3', NULL, 3, 'Partisan-3'),
(5260, 13, 5256, N'Play 4', NULL, 4, 'Partisan-4'),
(5261, 13, NULL, N'Play of Spiedo against Spiedo', NULL, 4, 'Spiedo'),
(5262, 13, 5261, N'Play 1', NULL, 1, 'Spiedo-1'),
(5263, 13, 5261, N'Play 2', NULL, 2, 'Spiedo-2'),
(5264, 13, NULL, N'Play of Ronca against Ronca', NULL, 5, 'Ronca'),
(5265, 13, 5264, N'Play 1', NULL, 1, 'Ronca-1'),
(5266, 13, 5264, N'Play 2', NULL, 2, 'Ronca-2'),
(5267, 13, 5264, N'Play 3', NULL, 3, 'Ronca-3'),
(5268, 13, 5264, N'Play 4', NULL, 4, 'Ronca-4'),
(5269, 13, NULL, N'Play of Hand-held Spears', NULL, 6, 'Spears'),
(5270, 13, 5269, N'Play 1', NULL, 1, 'Spears-1'),
(5271, 13, 5269, N'Play 2', NULL, 2, 'Spears-2'),
(5272, 13, 5269, N'Play 3', NULL, 3, 'Spears-3'),
(5273, 13, 5269, N'Play 4', NULL, 4, 'Spears-4'),
(5274, 13, 5269, N'Play 5', NULL, 5, 'Spears-5'),
(5275, 13, 5269, N'Play 6 (Counter to 5)', NULL, 6, 'Spears-6'),
(5276, 13, 5269, N'Play 7', NULL, 7, 'Spears-7'),
(5277, 13, 5269, N'Play 8', NULL, 8, 'Spears-8'),
(5278, 13, 5269, N'Play 9 (Counter to 8)', NULL, 9, 'Play-9'),
(5279, 13, 5269, N'Play 10', NULL, 10, 'Spears-10'),
(5280, 13, 5269, N'Play 11', NULL, 11, 'Spears-11')

;


MERGE INTO Sources.Section t
USING @Section s
ON t.SectionKey = s.SectionKey
WHEN NOT MATCHED THEN
    INSERT
(  SectionKey,
PartKey,
ParentSectionKey,
SectionName,
PageReference,
DisplayOrder,
SectionSlug )
    VALUES
    (  s.SectionKey,
s.PartKey,
s.ParentSectionKey,
s.SectionName,
s.PageReference,
s.DisplayOrder,
s.SectionSlug )
WHEN MATCHED THEN
    UPDATE SET  PartKey = s.PartKey,
ParentSectionKey = s.ParentSectionKey,
SectionName = s.SectionName,
PageReference = s.PageReference,
DisplayOrder = s.DisplayOrder,
SectionSlug = s.SectionSlug;

END;
GO
