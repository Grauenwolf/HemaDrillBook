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

(5116, 10, NULL, N'False Stretta', NULL, 1, 'False-Stretta'),
(5117, 10, 5116, N'False Stretta 1', NULL, 1, 'False-Stretta-1'),
(5118, 10, 5116, N'False Stretta 2', NULL, 2, 'False-Stretta-2'),
(5119, 10, 5116, N'False Stretta 3', NULL, 3, 'False-Stretta-3'),
(5120, 10, 5116, N'False Stretta 4', NULL, 4, 'False-Stretta-4'),
(5121, 10, 5116, N'False Stretta 5', NULL, 5, 'False-Stretta-5'),
(5122, 10, 5116, N'False Stretta 6', NULL, 6, 'False-Stretta-6'),
(5123, 10, 5116, N'False Stretta 7', NULL, 7, 'False-Stretta-7'),
(5124, 10, 5116, N'False Stretta 8', NULL, 8, 'False-Stretta-8'),
(5125, 10, 5116, N'False Stretta 9', NULL, 9, 'False-Stretta-9'),
(5126, 10, 5116, N'False Stretta 10', NULL, 10, 'False-Stretta-10'),
(5127, 10, 5116, N'False Stretta 11', NULL, 11, 'False-Stretta-11'),
(5128, 10, 5116, N'False Stretta 12', NULL, 12, 'False-Stretta-12'),
(5129, 10, 5116, N'False Stretta 13', NULL, 13, 'False-Stretta-13'),
(5130, 10, 5116, N'False Stretta 14', NULL, 14, 'False-Stretta-14'),
(5131, 10, 5116, N'False Stretta 15', NULL, 15, 'False-Stretta-15'),
(5132, 10, 5116, N'False Stretta 16', NULL, 16, 'False-Stretta-16'),
(5133, 10, 5116, N'False Stretta 17', NULL, 17, 'False-Stretta-17'),
(5134, 10, NULL, N'True Stretta', NULL, 2, 'True-Stretta'),
(5135, 10, 5134, N'True Stretta 1', NULL, 1, 'True-Stretta-1'),
(5136, 10, 5134, N'True Stretta 2', NULL, 2, 'True-Stretta-2'),
(5137, 10, 5134, N'True Stretta 3', NULL, 3, 'True-Stretta-3'),
(5138, 10, 5134, N'True Stretta 4', NULL, 4, 'True-Stretta-4'),
(5139, 10, 5134, N'True Stretta 5', NULL, 5, 'True-Stretta-5'),
(5140, 10, 5134, N'True Stretta 6', NULL, 6, 'True-Stretta-6'),
(5141, 10, 5134, N'True Stretta 7', NULL, 7, 'True-Stretta-7'),
(5142, 10, 5134, N'True Stretta 8', NULL, 8, 'True-Stretta-8'),
(5143, 10, 5134, N'True Stretta 9', NULL, 9, 'True-Stretta-9'),
(5144, 10, 5134, N'True Stretta 10', NULL, 10, 'True-Stretta-10'),
(5145, 10, 5134, N'True Stretta 11', NULL, 11, 'True-Stretta-11'),
(5146, 10, 5134, N'True Stretta 12', NULL, 12, 'True-Stretta-12'),
(5147, 10, 5134, N'True Stretta 13', NULL, 13, 'True-Stretta-13'),
(5148, 10, 5134, N'True Stretta 14', NULL, 14, 'True-Stretta-14'),
(5149, 10, 5134, N'True Stretta 15', NULL, 15, 'True-Stretta-15'),
(5150, 10, 5134, N'True Stretta 16', NULL, 16, 'True-Stretta-16'),
(5151, 10, 5134, N'True Stretta 17', NULL, 17, 'True-Stretta-17')

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
