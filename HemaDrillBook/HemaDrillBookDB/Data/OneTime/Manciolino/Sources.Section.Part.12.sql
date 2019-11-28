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

(5217, 12, NULL, N'Sword and Cape', NULL, 1, 'Sword-and-Cape'),
(5218, 12, 5217, N'Coda Lunga e Alta 2', NULL, 1, 'Coda-Lunga-e-Alta-2'),
(5219, 12, 5217, N'Coda Lunga e Alta 3', NULL, 2, 'Coda-Lunga-e-Alta-3'),
(5220, 12, 5217, N'Coda Lunga e Alta 4', NULL, 3, 'Coda-Lunga-e-Alta-4'),
(5221, 12, 5217, N'Coda Lunga e Alta 5', NULL, 4, 'Coda-Lunga-e-Alta-5'),
(5222, 12, 5217, N'Coda Lunga e Alta 6', NULL, 5, 'Coda-Lunga-e-Alta-6'),
(5223, 12, 5217, N'Coda Lunga e Alta 7', NULL, 6, 'Coda-Lunga-e-Alta-7'),
(5224, 12, 5217, N'Coda Lunga e Alta 8', NULL, 7, 'Coda-Lunga-e-Alta-8'),
(5225, 12, 5217, N'Coda Lunga e Alta 9', NULL, 8, 'Coda-Lunga-e-Alta-9'),
(5226, 12, 5217, N'Coda Lunga e Alta 10', NULL, 9, 'Coda-Lunga-e-Alta-10'),
(5227, 12, 5217, N'Coda Lunga e Alta 11', NULL, 10, 'Coda-Lunga-e-Alta-11'),
(5228, 12, 5217, N'Coda Lunga e Stretta 1', NULL, 11, 'Coda-Lunga-e-Stretta-1'),
(5229, 12, 5217, N'Coda Lunga e Stretta 2', NULL, 12, 'Coda-Lunga-e-Stretta-2'),
(5230, 12, 5217, N'Coda Lunga e Stretta 3', NULL, 13, 'Coda-Lunga-e-Stretta-3'),
(5231, 12, 5217, N'Coda Lunga e Stretta 4', NULL, 14, 'Coda-Lunga-e-Stretta-4'),
(5232, 12, 5217, N'Coda Lunga e Stretta 5', NULL, 15, 'Coda-Lunga-e-Stretta-5'),
(5233, 12, 5217, N'Coda Lunga e Stretta 6', NULL, 16, 'Coda-Lunga-e-Stretta-6'),
(5234, 12, 5217, N'Coda Lunga e Stretta 7', NULL, 17, 'Coda-Lunga-e-Stretta-7'),
(5235, 12, 5217, N'Two on Two', NULL, 18, 'Two-on-Two'),
(5236, 12, NULL, N'Sword and Dagger', NULL, 2, 'Sword-and-Dagger'),
(5237, 12, 5236, N'Coda Dagger 2', NULL, 1, 'Coda-Dagger-2'),
(5238, 12, 5236, N'Coda Dagger 3', NULL, 2, 'Coda-Dagger-3'),
(5239, 12, 5236, N'Coda Dagger 4', NULL, 3, 'Coda-Dagger-4'),
(5240, 12, 5236, N'Coda Dagger 5', NULL, 4, 'Coda-Dagger-5'),
(5241, 12, NULL, N'Sword and Rotella', NULL, 3, 'Sword-and-Rotella'),
(5242, 12, 5241, N'Part 1 (Opening)', NULL, 1, 'Part-1'),
(5243, 12, 5241, N'Part 2 (Combat)', NULL, 2, 'Part-2'),
(5244, 12, 5241, N'Part 3 (Retreat)', NULL, 3, 'Part-3')

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
