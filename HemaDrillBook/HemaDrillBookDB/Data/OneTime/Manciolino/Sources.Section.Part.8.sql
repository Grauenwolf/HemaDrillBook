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

(5002, 8, NULL, N'Chapter 1: The Guards', NULL, 1, 'Chapter-1'),
(5003, 8, 5002, N'Guardia Alta', NULL, 1, 'Guardia-Alta'),
(5004, 8, 5002, N'Guardia di Testa', NULL, 2, 'Guardia-di-Testa'),
(5005, 8, 5002, N'Guardia di Faccia', NULL, 3, 'Guardia-di-Faccia'),
(5006, 8, 5002, N'Guardia di Sopra il Braccio', NULL, 4, 'Guardia-di-Sopra-il-Braccio'),
(5007, 8, 5002, N'Guardia di Soto il Braccio', NULL, 5, 'Guardia-di-Soto-il-Braccio'),
(5008, 8, 5002, N'Guardia di Porta di Fero Stretta', NULL, 6, 'Guardia-di-Porta-di-Fero-Stretta'),
(5009, 8, 5002, N'Guardia di Porta di Fero Larga', NULL, 7, 'Guardia-di-Porta-di-Fero-Larga'),
(5010, 8, 5002, N'Chinghiara Porta di Fero', NULL, 8, 'Chinghiara-Porta-di-Fero'),
(5011, 8, 5002, N'Coda Lunga e Alta', NULL, 9, 'Coda-Lunga-e-Alta'),
(5012, 8, 5002, N'Coda Lunga e Stretta', NULL, 10, 'Coda-Lunga-e-Stretta'),
(5013, 8, NULL, N'Chapter 2: The Blows', NULL, 2, 'Chapter-2'),
(5014, 8, NULL, N'Chapter 3: Guardia Alta', NULL, 3, 'Chapter-3'),
(5015, 8, 5014, N'Guardia Alta 1', NULL, 1, 'Guardia-Alta-1'),
(5016, 8, 5014, N'Guardia Alta 2', NULL, 2, 'Guardia-Alta-2'),
(5017, 8, 5014, N'Guardia Alta 3', NULL, 3, 'Guardia-Alta-3'),
(5018, 8, 5014, N'Guardia Alta 4', NULL, 4, 'Guardia-Alta-4'),
(5019, 8, 5014, N'Guardia Alta 5', NULL, 5, 'Guardia-Alta-5'),
(5020, 8, 5014, N'Guardia Alta 6', NULL, 6, 'Guardia-Alta-6'),
(5021, 8, 5014, N'Guardia Alta 7', NULL, 7, 'Guardia-Alta-7'),
(5022, 8, 5014, N'Guardia Alta 8', NULL, 8, 'Guardia-Alta-8'),
(5023, 8, 5014, N'Guardia Alta 9', NULL, 9, 'Guardia-Alta-9'),
(5024, 8, NULL, N'Chapter 5/6: Guardia di Testa', NULL, 4, 'Chapter-5-6'),
(5025, 8, 5024, N'Guardia di Testa 1', NULL, 1, 'Guardia-di-Testa-1'),
(5026, 8, 5024, N'Guardia di Testa 2', NULL, 2, 'Guardia-di-Testa-2'),
(5027, 8, 5024, N'Guardia di Testa 3', NULL, 3, 'Guardia-di-Testa-3'),
(5028, 8, 5024, N'Guardia di Testa 4', NULL, 4, 'Guardia-di-Testa-4'),
(5029, 8, 5024, N'Guardia di Testa 5', NULL, 5, 'Guardia-di-Testa-5'),
(5030, 8, NULL, N'Chapter 7/8: Guardia di Faccia', NULL, 5, 'Chapter-7-8'),
(5031, 8, 5030, N'Guardia di Faccia 1', NULL, 1, 'Guardia-di-Faccia-1'),
(5032, 8, 5030, N'Guardia di Faccia 2', NULL, 2, 'Guardia-di-Faccia-2'),
(5033, 8, 5030, N'Guardia di Faccia 3', NULL, 3, 'Guardia-di-Faccia-3'),
(5034, 8, 5030, N'Guardia di Faccia 4', NULL, 4, 'Guardia-di-Faccia-4'),
(5035, 8, 5030, N'Guardia di Faccia 5', NULL, 5, 'Guardia-di-Faccia-5'),
(5036, 8, NULL, N'Chapter 9/10: Guardia di Sopra il Braccio', NULL, 6, 'Chapter-9-10'),
(5037, 8, 5036, N'Sopra il Braccio 1', NULL, 1, 'Sopra-il-Braccio-1'),
(5038, 8, 5036, N'Sopra il Braccio 2', NULL, 2, 'Sopra-il-Braccio-2'),
(5039, 8, 5036, N'Sopra il Braccio 3', NULL, 3, 'Sopra-il-Braccio-3'),
(5040, 8, 5036, N'Sopra il Braccio 4', NULL, 4, 'Sopra-il-Braccio-4'),
(5041, 8, 5036, N'Sopra il Braccio 5', NULL, 5, 'Sopra-il-Braccio-5'),
(5042, 8, 5036, N'Sopra il Braccio 6', NULL, 6, 'Sopra-il-Braccio-6'),
(5043, 8, 5036, N'Sopra il Braccio 7', NULL, 7, 'Sopra-il-Braccio-7'),
(5044, 8, 5036, N'Sopra il Braccio 8', NULL, 8, 'Sopra-il-Braccio-8'),
(5045, 8, 5036, N'Sopra il Braccio 9', NULL, 9, 'Sopra-il-Braccio-9'),
(5046, 8, 5036, N'Sopra il Braccio 10', NULL, 10, 'Sopra-il-Braccio-10'),
(5047, 8, NULL, N'Chapter 11/12: Guardia di Sotto il Braccio', NULL, 7, 'Chapter-11-12'),
(5048, 8, 5047, N'Sotto il Braccio 1', NULL, 1, 'Sotto-il-Braccio-1'),
(5049, 8, 5047, N'Sotto il Braccio 2', NULL, 2, 'Sotto-il-Braccio-2'),
(5050, 8, 5047, N'Sotto il Braccio 3', NULL, 3, 'Sotto-il-Braccio-3'),
(5051, 8, 5047, N'Sotto il Braccio 4', NULL, 4, 'Sotto-il-Braccio-4'),
(5052, 8, 5047, N'Sotto il Braccio 5', NULL, 5, 'Sotto-il-Braccio-5'),
(5053, 8, NULL, N'Chapter 13/14: Porta di Ferro Stretta', NULL, 8, 'Chapter-13-14'),
(5054, 8, 5053, N'Porta di Ferro Stretta 1', NULL, 1, 'Porta-di-Ferro-Stretta-1'),
(5055, 8, 5053, N'Porta di Ferro Stretta 2', NULL, 2, 'Porta-di-Ferro-Stretta-2'),
(5056, 8, 5053, N'Porta di Ferro Stretta 3', NULL, 3, 'Porta-di-Ferro-Stretta-3'),
(5057, 8, 5053, N'Porta di Ferro Stretta 4', NULL, 4, 'Porta-di-Ferro-Stretta-4'),
(5058, 8, 5053, N'Porta di Ferro Stretta 5', NULL, 5, 'Porta-di-Ferro-Stretta-5'),
(5059, 8, NULL, N'Chapter 15/16: Porta di Ferro Larga', NULL, 9, 'Chapter-15-16'),
(5060, 8, 5059, N'Porta di Ferro Larga 1', NULL, 1, 'Porta-di-Ferro-Larga-1'),
(5061, 8, 5059, N'Porta di Ferro Larga 2', NULL, 2, 'Porta-di-Ferro-Larga-2'),
(5062, 8, 5059, N'Porta di Ferro Larga 3', NULL, 3, 'Porta-di-Ferro-Larga-3'),
(5063, 8, 5059, N'Porta di Ferro Larga 4', NULL, 4, 'Porta-di-Ferro-Larga-4'),
(5064, 8, 5059, N'Porta di Ferro Larga 5', NULL, 5, 'Porta-di-Ferro-Larga-5'),
(5065, 8, 5059, N'Porta di Ferro Larga 6', NULL, 6, 'Porta-di-Ferro-Larga-6'),
(5066, 8, 5059, N'Porta di Ferro Larga 7', NULL, 7, 'Porta-di-Ferro-Larga-7'),
(5067, 8, NULL, N'Chapter 17/18: Cinghiara Porta di Ferro', NULL, 10, 'Chapter-17-18'),
(5068, 8, 5067, N'Cinghiara Porta di Ferro 1', NULL, 1, 'Cinghiara-Porta-di-Ferro-1'),
(5069, 8, 5067, N'Cinghiara Porta di Ferro 2', NULL, 2, 'Cinghiara-Porta-di-Ferro-2'),
(5070, 8, 5067, N'Cinghiara Porta di Ferro 3', NULL, 3, 'Cinghiara-Porta-di-Ferro-3'),
(5071, 8, 5067, N'Cinghiara Porta di Ferro 4', NULL, 4, 'Cinghiara-Porta-di-Ferro-4'),
(5072, 8, 5067, N'Cinghiara Porta di Ferro 5', NULL, 5, 'Cinghiara-Porta-di-Ferro-5'),
(5073, 8, 5067, N'Cinghiara Porta di Ferro 6', NULL, 6, 'Cinghiara-Porta-di-Ferro-6'),
(5074, 8, 5067, N'Cinghiara Porta di Ferro 7', NULL, 7, 'Cinghiara-Porta-di-Ferro-7'),
(5075, 8, 5067, N'Cinghiara Porta di Ferro 8', NULL, 8, 'Cinghiara-Porta-di-Ferro-8'),
(5076, 8, NULL, N'Chapter 19/20: Coda Lunga e Alta', NULL, 11, 'Chapter-19-20'),
(5077, 8, 5076, N'Coda Lunga e Alta 1', NULL, 1, 'Coda-Lunga-e-Alta-1'),
(5078, 8, 5076, N'Coda Lunga e Alta 2', NULL, 2, 'Coda-Lunga-e-Alta-2'),
(5079, 8, 5076, N'Coda Lunga e Alta 3', NULL, 3, 'Coda-Lunga-e-Alta-3'),
(5080, 8, 5076, N'Coda Lunga e Alta 4', NULL, 4, 'Coda-Lunga-e-Alta-4'),
(5081, 8, 5076, N'Coda Lunga e Alta 5', NULL, 5, 'Coda-Lunga-e-Alta-5'),
(5082, 8, 5076, N'Coda Lunga e Alta 6', NULL, 6, 'Coda-Lunga-e-Alta-6'),
(5083, 8, 5076, N'Coda Lunga e Alta 7', NULL, 7, 'Coda-Lunga-e-Alta-7'),
(5084, 8, NULL, N'Chapter 21/22: Coda Lunga e Stretta', NULL, 12, 'Chapter-21-22'),
(5085, 8, 5084, N'Coda Lunga e Stretta 1', NULL, 1, 'Coda-Lunga-e-Stretta-1'),
(5086, 8, 5084, N'Coda Lunga e Stretta 2', NULL, 2, 'Coda-Lunga-e-Stretta-2'),
(5087, 8, 5084, N'Coda Lunga e Stretta 3', NULL, 3, 'Coda-Lunga-e-Stretta-3'),
(5088, 8, 5084, N'Coda Lunga e Stretta 4', NULL, 4, 'Coda-Lunga-e-Stretta-4')

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
