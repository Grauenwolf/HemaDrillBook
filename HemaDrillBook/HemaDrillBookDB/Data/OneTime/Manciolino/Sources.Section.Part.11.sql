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

(5153, 11, NULL, N'Sword and Large Buckler', NULL, 1, 'Sword-and-Large-Buckler'),
(5154, 11, 5153, N'Chapter 1 thru 3: Coda Lunga e Alta', NULL, 1, 'Coda-Lunga-e-Alta'),
(5155, 11, 5154, N'Chapter 1 Part A Counter 1', NULL, 1, 'Chapter-1-Part-A-Counter-1'),
(5156, 11, 5154, N'Chapter 1 Part A Counter 2', NULL, 2, 'Chapter-1-Part-A-Counter-2'),
(5157, 11, 5154, N'Chapter 1 Part A Counter 3', NULL, 3, 'Chapter-1-Part-A-Counter-3'),
(5158, 11, 5154, N'Chapter 1 Part A Counter 4', NULL, 4, 'Chapter-1-Part-A-Counter-4'),
(5159, 11, 5154, N'Chapter 1 Part A Counter 5', NULL, 5, 'Chapter-1-Part-A-Counter-5'),
(5160, 11, 5154, N'Chapter 1 Part B Counter 1', NULL, 6, 'Chapter-1-Part-B-Counter-1'),
(5161, 11, 5154, N'Chapter 1 Part B Counter 2', NULL, 7, 'Chapter-1-Part-B-Counter-2'),
(5162, 11, 5154, N'Chapter 1 Part B Counter 3', NULL, 8, 'Chapter-1-Part-B-Counter-3'),
(5163, 11, 5154, N'Chapter 1 Part B Counter 4', NULL, 9, 'Chapter-1-Part-B-Counter-4'),
(5164, 11, 5154, N'Chapter 1 Part B Counter 5', NULL, 10, 'Chapter-1-Part-B-Counter-5'),
(5165, 11, 5154, N'Chapter 1 Part B Counter 6', NULL, 11, 'Chapter-1-Part-B-Counter-6'),
(5166, 11, 5154, N'Chapter 2', NULL, 12, 'Chapter-2'),
(5167, 11, 5154, N'Chapter 3 Play 1', NULL, 13, 'Chapter-3-Play-1'),
(5168, 11, 5154, N'Chapter 3 Play 2', NULL, 14, 'Chapter-3-Play-2'),
(5169, 11, 5154, N'Chapter 3 Play 3', NULL, 15, 'Chapter-3-Play-3'),
(5170, 11, 5153, N'Chapter 4 thru 7: Coda Lunga e Stretta', NULL, 2, 'Coda-Lunga-e-Stretta'),
(5171, 11, 5170, N'Chapter 4', NULL, 1, 'Chapter-4'),
(5172, 11, 5170, N'Chapter 5', NULL, 2, 'Chapter-5'),
(5173, 11, 5170, N'Chapter 6', NULL, 3, 'Chapter-6'),
(5174, 11, 5170, N'Chapter 7', NULL, 4, 'Chapter-7'),
(5175, 11, 5153, N'Chapter 8: Cinghiara Porta di Ferro', NULL, 3, 'Cinghiara-Porta-di-Ferro'),
(5176, 11, 5175, N'Chapter 8 Play 1', NULL, 1, 'Chapter-8-Play-1'),
(5177, 11, 5175, N'Chapter 8 Play 2', NULL, 2, 'Chapter-8-Play-2'),
(5178, 11, 5175, N'Chapter 8 Play 3', NULL, 3, 'Chapter-8-Play-3'),
(5179, 11, 5175, N'Chapter 8 Play 4', NULL, 4, 'Chapter-8-Play-4'),
(5180, 11, 5175, N'Chapter 8 Play 5', NULL, 5, 'Chapter-8-Play-5'),
(5181, 11, 5175, N'Chapter 8 Play 6', NULL, 6, 'Chapter-8-Play-6'),
(5182, 11, 5175, N'Chapter 8 Play 7', NULL, 7, 'Chapter-8-Play-7'),
(5183, 11, 5153, N'Chapter 9: Cinghiara Porta di Stretta', NULL, 4, 'Cinghiara-Porta-di-Stretta'),
(5184, 11, 5183, N'Chapter 9 Play 1', NULL, 1, 'Chapter-9-Play-1'),
(5185, 11, 5183, N'Chapter 9 Play 2', NULL, 2, 'Chapter-9-Play-2'),
(5186, 11, 5183, N'Chapter 9 Play 3', NULL, 3, 'Chapter-9-Play-3'),
(5187, 11, 5183, N'Chapter 9 Play 4', NULL, 4, 'Chapter-9-Play-4'),
(5188, 11, 5183, N'Chapter 9 Play 5', NULL, 5, 'Chapter-9-Play-5'),
(5189, 11, 5183, N'Chapter 9 Play 6', NULL, 6, 'Chapter-9-Play-6'),
(5190, 11, 5183, N'Chapter 9 Play 7', NULL, 7, 'Chapter-9-Play-7'),
(5191, 11, 5183, N'Chapter 9 Play 8', NULL, 8, 'Chapter-9-Play-8'),
(5192, 11, 5153, N'Chapter 10', NULL, 5, 'Chapter-10'),
(5193, 11, 5192, N'Play 1 (Coda Lunga e Alta', NULL, 1, 'Chapter-10-Play-1'),
(5194, 11, 5192, N'Play 2', NULL, 2, 'Chapter-10-Play-2'),
(5195, 11, 5192, N'Play 3', NULL, 3, 'Chapter-10-Play-3'),
(5196, 11, 5192, N'Play 4', NULL, 4, 'Chapter-10-Play-4'),
(5197, 11, 5192, N'Play 5', NULL, 5, 'Chapter-10-Play-5'),
(5198, 11, 5192, N'Play 6', NULL, 6, 'Chapter-10-Play-6'),
(5199, 11, 5192, N'Play 7', NULL, 7, 'Chapter-10-Play-7'),
(5200, 11, 5192, N'Play 8 (vs left-handed fencer)', NULL, 8, 'Chapter-10-Play-8'),
(5201, 11, 5192, N'Play 9', NULL, 9, 'Chapter-10-Play-9'),
(5202, 11, 5192, N'Play 10 (vs right-handed fencer)', NULL, 10, 'Chapter-10-Play-10'),
(5203, 11, 5192, N'Play 11', NULL, 11, 'Chapter-10-Play-11'),
(5204, 11, 5192, N'Play 12 (Coda Lunga e Alta', NULL, 12, 'Chapter-10-Play-12'),
(5205, 11, NULL, N'Two Swords', NULL, 2, 'Two-Swords'),
(5206, 11, 5205, N'Part 1 (Opening)', NULL, 1, 'Part-1'),
(5207, 11, 5205, N'Part 2 (Combat)', NULL, 2, 'Part-2'),
(5208, 11, 5205, N'Part 3 (Retreat)', NULL, 3, 'Part-3'),
(5209, 11, NULL, N'Sword Alone', NULL, 3, 'Sword-Alone'),
(5210, 11, 5209, N'Play 1', NULL, 1, 'Play-1'),
(5211, 11, 5209, N'Play 2', NULL, 2, 'Play-2'),
(5212, 11, 5209, N'Play 3', NULL, 3, 'Play-3'),
(5213, 11, 5209, N'Play 4', NULL, 4, 'Play-4'),
(5214, 11, 5209, N'Play 5', NULL, 5, 'Play-5'),
(5215, 11, 5209, N'Play 6', NULL, 6, 'Play-6');


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
