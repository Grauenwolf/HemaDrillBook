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
SectionSlug varchar(50) NULL UNIQUE

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

(5090, 9, NULL, N'Sword and Buckler Assault 1', NULL, 1, 'Assault-1'),
(5091, 9, 5090, N'Assault 1 Part 1 (Opening)', NULL, 1, 'Assault-1-Part-1'),
(5092, 9, 5090, N'Assault 1 Part 2 (Embellishment)', NULL, 2, 'Assault-1-Part-2'),
(5093, 9, 5090, N'Assault 1 Part 3 (First Combat, 1-10)', NULL, 3, 'Assault-1-Part-3'),
(5094, 9, 5090, N'Assault 1 Part 4 (Second Combat, 11-20)', NULL, 4, 'Assault-1-Part-4'),
(5095, 9, 5090, N'Assault 1 Part 5 (Third Combat, 22-26)', NULL, 5, 'Assault-1-Part-5'),
(5096, 9, 5090, N'Assault 1 Part 6 (Fourth Combat, 27-31)', NULL, 6, 'Assault-1-Part-6'),
(5097, 9, 5090, N'Assault 1 Part 7 (Retreat)', NULL, 7, 'Assault-1-Part-7'),
(5098, 9, NULL, N'Sword and Buckler Assault 2', NULL, 2, 'Assault-2'),
(5099, 9, 5098, N'Assault 2 Part 1 (Opening)', NULL, 1, 'Assault-2-Part-1'),
(5100, 9, 5098, N'Assault 2 Part 2 (Embellishment)', NULL, 2, 'Assault-2-Part-2'),
(5101, 9, 5098, N'Assault 2 Part 3 (First Combat, 1-14)', NULL, 3, 'Assault-2-Part-3'),
(5102, 9, 5098, N'Assault 2 Part 4 (Second Combat, 15-24)', NULL, 4, 'Assault-2-Part-4'),
(5103, 9, 5098, N'Assault 2 Part 5 (Third Combat, 25-43)', NULL, 5, 'Assault-2-Part-5'),
(5104, 9, 5098, N'Assault 2 Part 6 (Retreat)', NULL, 6, 'Assault-2-Part-6'),
(5105, 9, NULL, N'Sword and Buckler Assault 3', NULL, 3, 'Assault-3'),
(5106, 9, 5105, N'Assault 3 Part 1 (Opening)', NULL, 1, 'Assault-3-Part-1'),
(5107, 9, 5105, N'Assault 3 Part 2 (Embellishment)', NULL, 2, 'Assault-3-Part-2'),
(5108, 9, 5105, N'Assault 3 Part 3 (First Combat, 1-10)', NULL, 3, 'Assault-3-Part-3'),
(5109, 9, 5105, N'Assault 3 Part 4 (Second Combat, 11-19)', NULL, 4, 'Assault-3-Part-4'),
(5110, 9, 5105, N'Assault 3 Part 5 (Third Combat, 20-30)', NULL, 5, 'Assault-3-Part-5'),
(5111, 9, 5105, N'Assault 3 Part 6 (Fourth Combat, 31-52)', NULL, 6, 'Assault-3-Part-6'),
(5112, 9, 5105, N'Assault 3 Part 7 (Fifth Combat, 53-64)', NULL, 7, 'Assault-3-Part-7'),
(5113, 9, 5105, N'Assault 3 Part 8 (Sixth Combat, 65-71)', NULL, 8, 'Assault-3-Part-8'),
(5114, 9, 5105, N'Assault 3 Part 9 (Retreat)', NULL, 9, 'Assault-3-Part-9')

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
