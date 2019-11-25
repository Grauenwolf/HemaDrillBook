/***** Book *****/

DECLARE @BookKey INT = 5;
DECLARE @FirstAuthorKey INT = 5;

DECLARE @Book TABLE
(
    BookKey INT NOT NULL,
    BookName NVARCHAR(500) NOT NULL,
    AlternateBookName NVARCHAR(500) NULL,
    Slug CHAR(50) NOT NULL
);

INSERT INTO @Book
(
    BookKey,
    BookName,
    AlternateBookName,
    Slug
)
VALUES
(@BookKey, N'Opera Nova', NULL, 'Manciolino');

MERGE INTO Sources.Book t
USING @Book s
ON t.BookKey = s.BookKey
WHEN NOT MATCHED THEN
    INSERT
    (
        BookKey,
        BookName,
        AlternateBookName,
        BookSlug
    )
    VALUES
    (s.BookKey, s.BookName, s.AlternateBookName, s.Slug)
WHEN MATCHED AND s.BookName <> t.BookName
                 OR s.AlternateBookName <> t.AlternateBookName
                 OR s.Slug <> t.BookSlug THEN
    UPDATE SET t.BookName = s.BookName,
               t.AlternateBookName = s.AlternateBookName,
               t.BookSlug = s.Slug;

DECLARE @AlternateBookName TABLE
(
    BookKey INT NOT NULL,
    AlternateBookName NVARCHAR(500) NOT NULL
);

--INSERT INTO @AlternateBookName
--(
--    BookKey,
--    AlternateBookName
--)
--VALUES
--(@BookKey, N'Walpurgis Fechtbuch'),
--(@BookKey, N'Liber de Arte Dimicatoria '),
--(@BookKey, N'The Tower Fechtbuch');


MERGE INTO Sources.AlternateBookName t
USING @AlternateBookName s
ON s.BookKey = t.BookKey
   AND s.AlternateBookName = t.AlternateBookName
WHEN NOT MATCHED THEN
    INSERT
    (
        BookKey,
        AlternateBookName
    )
    VALUES
    (s.BookKey, s.AlternateBookName)
WHEN NOT MATCHED BY SOURCE AND t.BookKey = @BookKey THEN
    DELETE;

/**** AUTHOR *******/
DECLARE @Author TABLE
(
    AuthorKey INT NOT NULL,
    AuthorName NVARCHAR(500) NOT NULL,
    AuthorSlug CHAR(50) NOT NULL
);

INSERT INTO @Author
(
    AuthorKey,
    AuthorName,
    AuthorSlug
)
VALUES
(@FirstAuthorKey, N'Antonio Manciolino', 'Manciolino');



MERGE INTO Sources.Author t
USING @Author s
ON s.AuthorKey = t.AuthorKey
WHEN NOT MATCHED THEN
    INSERT
    (
        AuthorKey,
        AuthorName,
        AuthorSlug
    )
    VALUES
    (s.AuthorKey, s.AuthorName, s.AuthorSlug)
WHEN MATCHED AND t.AuthorName <> s.AuthorName THEN
    UPDATE SET t.AuthorName = s.AuthorName,
               t.AuthorSlug = s.AuthorSlug;


MERGE INTO Sources.BookAuthor t
USING @Author s
ON t.BookKey = @BookKey
   AND s.AuthorKey = t.AuthorKey
WHEN NOT MATCHED THEN
    INSERT
    (
        BookKey,
        AuthorKey
    )
    VALUES
    (@BookKey, s.AuthorKey)
WHEN NOT MATCHED BY SOURCE AND t.BookKey = @BookKey THEN
    DELETE;

/************ SECTIONS *************/
DECLARE @Section TABLE
(
    SectionKey INT NOT NULL PRIMARY KEY,
    ParentSectionKey INT NULL,
    SectionName NVARCHAR(250) NOT NULL,
    PageReference NVARCHAR(50) NULL,
    DisplayOrder FLOAT NOT NULL
);


INSERT INTO @Section
(
    SectionKey,
    ParentSectionKey,
    SectionName,
    PageReference,
    DisplayOrder
)
VALUES
(@BookKey * 1000 + 900, NULL, 'Extras', NULL, -1),
(@BookKey * 1000 + 901, @BookKey * 1000 + 900, 'History', NULL, 1),
(@BookKey * 1000 + 902, @BookKey * 1000 + 900, 'Weapons and Equipment', NULL, 2),
(@BookKey * 1000 + 903, @BookKey * 1000 + 900, 'General Discussion', NULL, 3),
(@BookKey * 1000 + 904, @BookKey * 1000 + 900, 'Misc. Drills and Lessons', NULL, 4);



INSERT INTO @Section
(
    SectionKey,
    ParentSectionKey,
    SectionName,
    PageReference,
    DisplayOrder
)
VALUES
(5001,NULL,'Book 1: Sword and Buckler',NULL,1),
(5002,5001,'Chapter 1: The Guards',NULL,1),
(5003,5002,'Guardia Alta',NULL,1),
(5004,5002,'Guardia di Testa',NULL,2),
(5005,5002,'Guardia di Faccia',NULL,3),
(5006,5002,'Guardia di Sopra il Braccio',NULL,4),
(5007,5002,'Guardia di Soto il Braccio',NULL,5),
(5008,5002,'Guardia di Porta di Fero Stretta',NULL,6),
(5009,5002,'Guardia di Porta di Fero Larga',NULL,7),
(5010,5002,'Chinghiara Porta di Fero',NULL,8),
(5011,5002,'Coda Lunga e Alta',NULL,9),
(5012,5002,'Coda Lunga e Stretta',NULL,10),
(5013,5001,'Chapter 2: The Blows',NULL,2),
(5014,5001,'Chapter 3: Guardia Alta',NULL,3),
(5015,5014,'Guardia Alta 1',NULL,1),
(5016,5014,'Guardia Alta 2',NULL,2),
(5017,5014,'Guardia Alta 3',NULL,3),
(5018,5014,'Guardia Alta 4',NULL,4),
(5019,5014,'Guardia Alta 5',NULL,5),
(5020,5014,'Guardia Alta 6',NULL,6),
(5021,5014,'Guardia Alta 7',NULL,7),
(5022,5014,'Guardia Alta 8',NULL,8),
(5023,5014,'Guardia Alta 9',NULL,9),
(5024,5001,'Chapter 5/6: Guardia di Testa',NULL,4),
(5025,5024,'Guardia di Testa 1',NULL,1),
(5026,5024,'Guardia di Testa 2',NULL,2),
(5027,5024,'Guardia di Testa 3',NULL,3),
(5028,5024,'Guardia di Testa 4',NULL,4),
(5029,5024,'Guardia di Testa 5',NULL,5),
(5030,5001,'Chapter 7/8: Guardia di Faccia',NULL,5),
(5031,5030,'Guardia di Faccia 1',NULL,1),
(5032,5030,'Guardia di Faccia 2',NULL,2),
(5033,5030,'Guardia di Faccia 3',NULL,3),
(5034,5030,'Guardia di Faccia 4',NULL,4),
(5035,5030,'Guardia di Faccia 5',NULL,5),
(5036,5001,'Chapter 9/10: Guardia di Sopra il Braccio',NULL,6),
(5037,5036,'Sopra il Braccio 1',NULL,1),
(5038,5036,'Sopra il Braccio 2',NULL,2),
(5039,5036,'Sopra il Braccio 3',NULL,3),
(5040,5036,'Sopra il Braccio 4',NULL,4),
(5041,5036,'Sopra il Braccio 5',NULL,5),
(5042,5036,'Sopra il Braccio 6',NULL,6),
(5043,5036,'Sopra il Braccio 7',NULL,7),
(5044,5036,'Sopra il Braccio 8',NULL,8),
(5045,5036,'Sopra il Braccio 9',NULL,9),
(5046,5036,'Sopra il Braccio 10',NULL,10),
(5047,5001,'Chapter 11/12: Guardia di Sotto il Braccio',NULL,7),
(5048,5047,'Sotto il Braccio 1',NULL,1),
(5049,5047,'Sotto il Braccio 2',NULL,2),
(5050,5047,'Sotto il Braccio 3',NULL,3),
(5051,5047,'Sotto il Braccio 4',NULL,4),
(5052,5047,'Sotto il Braccio 5',NULL,5),
(5053,5001,'Chapter 13/14: Porta di Ferro Stretta',NULL,8),
(5054,5053,'Porta di Ferro Stretta 1',NULL,1),
(5055,5053,'Porta di Ferro Stretta 2',NULL,2),
(5056,5053,'Porta di Ferro Stretta 3',NULL,3),
(5057,5053,'Porta di Ferro Stretta 4',NULL,4),
(5058,5053,'Porta di Ferro Stretta 5',NULL,5),
(5059,5001,'Chapter 15/16: Porta di Ferro Larga',NULL,9),
(5060,5059,'Porta di Ferro Larga 1',NULL,1),
(5061,5059,'Porta di Ferro Larga 2',NULL,2),
(5062,5059,'Porta di Ferro Larga 3',NULL,3),
(5063,5059,'Porta di Ferro Larga 4',NULL,4),
(5064,5059,'Porta di Ferro Larga 5',NULL,5),
(5065,5059,'Porta di Ferro Larga 6',NULL,6),
(5066,5059,'Porta di Ferro Larga 7',NULL,7),
(5067,5001,'Chapter 17/18: Cinghiara Porta di Ferro',NULL,10),
(5068,5067,'Cinghiara Porta di Ferro 1',NULL,1),
(5069,5067,'Cinghiara Porta di Ferro 2',NULL,2),
(5070,5067,'Cinghiara Porta di Ferro 3',NULL,3),
(5071,5067,'Cinghiara Porta di Ferro 4',NULL,4),
(5072,5067,'Cinghiara Porta di Ferro 5',NULL,5),
(5073,5067,'Cinghiara Porta di Ferro 6',NULL,6),
(5074,5067,'Cinghiara Porta di Ferro 7',NULL,7),
(5075,5067,'Cinghiara Porta di Ferro 8',NULL,8),
(5076,5001,'Chapter 19/20: Coda Lunga e Alta',NULL,11),
(5077,5076,'Coda Lunga e Alta 1',NULL,1),
(5078,5076,'Coda Lunga e Alta 2',NULL,2),
(5079,5076,'Coda Lunga e Alta 3',NULL,3),
(5080,5076,'Coda Lunga e Alta 4',NULL,4),
(5081,5076,'Coda Lunga e Alta 5',NULL,5),
(5082,5076,'Coda Lunga e Alta 6',NULL,6),
(5083,5076,'Coda Lunga e Alta 7',NULL,7),
(5084,5001,'Chapter 21/22: Coda Lunga e Stretta',NULL,12),
(5085,5084,'Coda Lunga e Stretta 1',NULL,1),
(5086,5084,'Coda Lunga e Stretta 2',NULL,2),
(5087,5084,'Coda Lunga e Stretta 3',NULL,3),
(5088,5084,'Coda Lunga e Stretta 4',NULL,4),
(5089,NULL,'Book 2',NULL,2),
(5090,5089,'Sword and Buckler Assault 1',NULL,1),
(5091,5090,'Assault 1 Part 1 (Opening)',NULL,1),
(5092,5090,'Assault 1 Part 1 (Embellishment)',NULL,2),
(5093,5090,'Assault 1 Part 2 (First Combat, 1-10)',NULL,3),
(5094,5090,'Assault 1 Part 3 (Second Combat, 11-20)',NULL,4),
(5095,5090,'Assault 1 Part 4 (Third Combat, 22-26)',NULL,5),
(5096,5090,'Assault 1 Part 5 (Fourth Combat, 27-31)',NULL,6),
(5097,5090,'Assault 1 Part 6 (Retreat)',NULL,7),
(5098,5089,'Sword and Buckler Assault 2',NULL,2),
(5099,5098,'Assault 2 Part 1 (Opening)',NULL,1),
(5100,5098,'Assault 1 Part 2 (Embellishment)',NULL,2),
(5101,5098,'Assault 2 Part 2 (First Combat, 1-14)',NULL,3),
(5102,5098,'Assault 2 Part 3 (Second Combat, 15-24)',NULL,4),
(5103,5098,'Assault 2 Part 4 (Third Combat, 25-43)',NULL,5),
(5104,5098,'Assault 2 Part 5 (Retreat)',NULL,6),
(5105,5089,'Sword and Buckler Assault 3',NULL,3),
(5106,5105,'Assault 3 Part 1 (Opening)',NULL,1),
(5107,5105,'Assault 1 Part 3 (Embellishment)',NULL,2),
(5108,5105,'Assault 3 Part 2 (First Combat, 1-10)',NULL,3),
(5109,5105,'Assault 3 Part 3 (Second Combat, 11-19)',NULL,4),
(5110,5105,'Assault 3 Part 4 (Third Combat, 20-30)',NULL,5),
(5111,5105,'Assault 3 Part 5 (Fourth Combat, 31-52)',NULL,6),
(5112,5105,'Assault 3 Part 6 (Fifth Combat, 53-64)',NULL,7),
(5113,5105,'Assault 3 Part 7 (Sixth Combat, 65-71)',NULL,8),
(5114,5105,'Assault 3 Part 8 (Retreat)',NULL,9),
(5115,NULL,'Book 3',NULL,3),
(5116,5115,'False Stretta',NULL,1),
(5117,5116,'False Stretta 1',NULL,1),
(5118,5116,'False Stretta 2',NULL,2),
(5119,5116,'False Stretta 3',NULL,3),
(5120,5116,'False Stretta 4',NULL,4),
(5121,5116,'False Stretta 5',NULL,5),
(5122,5116,'False Stretta 6',NULL,6),
(5123,5116,'False Stretta 7',NULL,7),
(5124,5116,'False Stretta 8',NULL,8),
(5125,5116,'False Stretta 9',NULL,9),
(5126,5116,'False Stretta 10',NULL,10),
(5127,5116,'False Stretta 11',NULL,11),
(5128,5116,'False Stretta 12',NULL,12),
(5129,5116,'False Stretta 13',NULL,13),
(5130,5116,'False Stretta 14',NULL,14),
(5131,5116,'False Stretta 15',NULL,15),
(5132,5116,'False Stretta 16',NULL,16),
(5133,5116,'False Stretta 17',NULL,17),
(5134,5115,'True Stretta',NULL,2),
(5135,5134,'True Stretta 1',NULL,1),
(5136,5134,'True Stretta 2',NULL,2),
(5137,5134,'True Stretta 3',NULL,3),
(5138,5134,'True Stretta 4',NULL,4),
(5139,5134,'True Stretta 5',NULL,5),
(5140,5134,'True Stretta 6',NULL,6),
(5141,5134,'True Stretta 7',NULL,7),
(5142,5134,'True Stretta 8',NULL,8),
(5143,5134,'True Stretta 9',NULL,9),
(5144,5134,'True Stretta 10',NULL,10),
(5145,5134,'True Stretta 11',NULL,11),
(5146,5134,'True Stretta 12',NULL,12),
(5147,5134,'True Stretta 13',NULL,13),
(5148,5134,'True Stretta 14',NULL,14),
(5149,5134,'True Stretta 15',NULL,15),
(5150,5134,'True Stretta 16',NULL,16),
(5151,5134,'True Stretta 17',NULL,17),
(5152,NULL,'Book 4',NULL,4),
(5153,5152,'Sword and Large Buckler',NULL,1),
(5154,5153,'Chapter 1 thru 3: Coda Lunga e Alta',NULL,1),
(5155,5154,'Chapter 1 Part A Counter 1',NULL,1),
(5156,5154,'Chapter 1 Part A Counter 2',NULL,2),
(5157,5154,'Chapter 1 Part A Counter 3',NULL,3),
(5158,5154,'Chapter 1 Part A Counter 4',NULL,4),
(5159,5154,'Chapter 1 Part A Counter 5',NULL,5),
(5160,5154,'Chapter 1 Part B Counter 1',NULL,6),
(5161,5154,'Chapter 1 Part B Counter 2',NULL,7),
(5162,5154,'Chapter 1 Part B Counter 3',NULL,8),
(5163,5154,'Chapter 1 Part B Counter 4',NULL,9),
(5164,5154,'Chapter 1 Part B Counter 5',NULL,10),
(5165,5154,'Chapter 1 Part B Counter 6',NULL,11),
(5166,5154,'Chapter 2',NULL,12),
(5167,5154,'Chapter 3 Play 1',NULL,13),
(5168,5154,'Chapter 3 Play 2',NULL,14),
(5169,5154,'Chapter 3 Play 3',NULL,15),
(5170,5153,'Chapter 4 thru 7: Coda Lunga e Stretta',NULL,2),
(5171,5170,'Chapter 4',NULL,1),
(5172,5170,'Chapter 5',NULL,2),
(5173,5170,'Chapter 6',NULL,3),
(5174,5170,'Chapter 7',NULL,4),
(5175,5153,'Chapter 8: Cinghiara Porta di Ferro',NULL,3),
(5176,5175,'Chapter 8 Play 1',NULL,1),
(5177,5175,'Chapter 8 Play 2',NULL,2),
(5178,5175,'Chapter 8 Play 3',NULL,3),
(5179,5175,'Chapter 8 Play 4',NULL,4),
(5180,5175,'Chapter 8 Play 5',NULL,5),
(5181,5175,'Chapter 8 Play 6',NULL,6),
(5182,5175,'Chapter 8 Play 7',NULL,7),
(5183,5153,'Chapter 9: Cinghiara Porta di Stretta',NULL,4),
(5184,5183,'Chapter 9 Play 1',NULL,1),
(5185,5183,'Chapter 9 Play 2',NULL,2),
(5186,5183,'Chapter 9 Play 3',NULL,3),
(5187,5183,'Chapter 9 Play 4',NULL,4),
(5188,5183,'Chapter 9 Play 5',NULL,5),
(5189,5183,'Chapter 9 Play 6',NULL,6),
(5190,5183,'Chapter 9 Play 7',NULL,7),
(5191,5183,'Chapter 9 Play 8',NULL,8),
(5192,5153,'Chapter 10',NULL,5),
(5193,5192,'Play 1 (Coda Lunga e Alta',NULL,1),
(5194,5192,'Play 2',NULL,2),
(5195,5192,'Play 3',NULL,3),
(5196,5192,'Play 4',NULL,4),
(5197,5192,'Play 5',NULL,5),
(5198,5192,'Play 6',NULL,6),
(5199,5192,'Play 7',NULL,7),
(5200,5192,'Play 8 (vs left-handed fencer)',NULL,8),
(5201,5192,'Play 9',NULL,9),
(5202,5192,'Play 10 (vs right-handed fencer)',NULL,10),
(5203,5192,'Play 11',NULL,11),
(5204,5192,'Play 12 (Coda Lunga e Alta',NULL,12),
(5205,5152,'Two Swords',NULL,2),
(5206,5205,'Part 1 (Opening)',NULL,1),
(5207,5205,'Part 2 (Combat)',NULL,2),
(5208,5205,'Part 3 (Retreat)',NULL,3),
(5209,5152,'Sword Alone',NULL,3),
(5210,5209,'Play 1',NULL,1),
(5211,5209,'Play 2',NULL,2),
(5212,5209,'Play 3',NULL,3),
(5213,5209,'Play 4',NULL,4),
(5214,5209,'Play 5',NULL,5),
(5215,5209,'Play 6',NULL,6),
(5216,NULL,'Book 5',NULL,5),
(5217,5216,'Sword and Cape',NULL,1),
(5218,5217,'Coda Lunga e Alta 2',NULL,1),
(5219,5217,'Coda Lunga e Alta 3',NULL,2),
(5220,5217,'Coda Lunga e Alta 4',NULL,3),
(5221,5217,'Coda Lunga e Alta 5',NULL,4),
(5222,5217,'Coda Lunga e Alta 6',NULL,5),
(5223,5217,'Coda Lunga e Alta 7',NULL,6),
(5224,5217,'Coda Lunga e Alta 8',NULL,7),
(5225,5217,'Coda Lunga e Alta 9',NULL,8),
(5226,5217,'Coda Lunga e Alta 10',NULL,9),
(5227,5217,'Coda Lunga e Alta 11',NULL,10),
(5228,5217,'Coda Lunga e Stretta 1',NULL,11),
(5229,5217,'Coda Lunga e Stretta 2',NULL,12),
(5230,5217,'Coda Lunga e Stretta 3',NULL,13),
(5231,5217,'Coda Lunga e Stretta 4',NULL,14),
(5232,5217,'Coda Lunga e Stretta 5',NULL,15),
(5233,5217,'Coda Lunga e Stretta 6',NULL,16),
(5234,5217,'Coda Lunga e Stretta 7',NULL,17),
(5235,5217,'Two on Two',NULL,18),
(5236,5216,'Sword and Dagger',NULL,2),
(5237,5236,'Coda Dagger 2',NULL,1),
(5238,5236,'Coda Dagger 3',NULL,2),
(5239,5236,'Coda Dagger 4',NULL,3),
(5240,5236,'Coda Dagger 5',NULL,4),
(5241,5216,'Sword and Rotella',NULL,3),
(5242,5241,'Part 1 (Opening)',NULL,1),
(5243,5241,'Part 2 (Combat)',NULL,2),
(5244,5241,'Part 3 (Retreat)',NULL,3),
(5245,NULL,'Book 6',NULL,6),
(5246,5245,'Play of Rotella and Partisan',NULL,1),
(5247,5246,'Play 1',NULL,1),
(5248,5246,'Play 2',NULL,2),
(5249,5246,'Play 3',NULL,3),
(5250,5246,'Play 4',NULL,4),
(5251,5246,'Play 5',NULL,5),
(5252,5245,'Another Play of Rotella and Partisan',NULL,2),
(5253,5252,'Play 1',NULL,1),
(5254,5252,'Play 2',NULL,2),
(5255,5252,'Play 3',NULL,3),
(5256,5245,'Play of Single Partisan',NULL,3),
(5257,5256,'Play 1',NULL,1),
(5258,5256,'Play 2',NULL,2),
(5259,5256,'Play 3',NULL,3),
(5260,5256,'Play 4',NULL,4),
(5261,5245,'Play of Spiedo against Spiedo',NULL,4),
(5262,5261,'Play 1',NULL,1),
(5263,5261,'Play 2',NULL,2),
(5264,5245,'Play of Ronca against Ronca',NULL,5),
(5265,5264,'Play 1',NULL,1),
(5266,5264,'Play 2',NULL,2),
(5267,5264,'Play 3',NULL,3),
(5268,5264,'Play 4',NULL,4),
(5269,5245,'Play of Hand-held Spears',NULL,6),
(5270,5269,'Play 1',NULL,1),
(5271,5269,'Play 2',NULL,2),
(5272,5269,'Play 3',NULL,3),
(5273,5269,'Play 4',NULL,4),
(5274,5269,'Play 5',NULL,5),
(5275,5269,'Play 6 (Counter to 5)',NULL,6),
(5276,5269,'Play 7',NULL,7),
(5277,5269,'Play 8',NULL,8),
(5278,5269,'Play 9 (Counter to 8)',NULL,9),
(5279,5269,'Play 10',NULL,10),
(5280,5269,'Play 11',NULL,11);



MERGE INTO Sources.Section t
USING @Section s
ON t.SectionKey = s.SectionKey
WHEN NOT MATCHED THEN
    INSERT
    (
        SectionKey,
        BookKey,
        ParentSectionKey,
        SectionName,
        DisplayOrder,
        PageReference
    )
    VALUES
    (s.SectionKey, @BookKey, s.ParentSectionKey, s.SectionName, s.DisplayOrder, s.PageReference)
WHEN MATCHED THEN
    UPDATE SET t.BookKey = @BookKey,
               t.ParentSectionKey = s.ParentSectionKey,
               t.SectionName = s.SectionName,
               t.PageReference = s.PageReference,
               t.DisplayOrder = s.DisplayOrder
WHEN NOT MATCHED BY SOURCE AND t.BookKey = @BookKey THEN
    DELETE;



/********** VIDEOS *************/

DECLARE @Video TABLE
(
    SectionKey INT NOT NULL,
    VideoServiceKey INT NOT NULL,
    VideoServiceVideoId VARCHAR(11) NULL,
    CreatedByUserKey INT NOT NULL
        DEFAULT (-1),
	StartTime TIME NULL
);


INSERT INTO @Video
(
    SectionKey,
    VideoServiceKey,
    VideoServiceVideoId,
	StartTime
)
VALUES
(5015,1,'RLqTNbm8dQ0',NULL),
(5015,1,'R3znDYuG7Kw',NULL),
(5015,1,'-m5jBrkKE_s',NULL),
(5016,1,'BIOiNNnbW6g',NULL),
(5016,1,'KjY5X7huGPQ',NULL),
(5017,1,'NJSXmKOsmXg',NULL),
(5019,1,'i74a1ajO1mM',NULL),
(5020,1,'a0FEXkr8yyg',NULL),
(5021,1,'PiLJFIzrFZg',NULL),
(5022,1,'Av442j07SU4',NULL),
(5023,1,'QwJlSegpyQg',NULL),
(5026,1,'7DEaTjzK0tA',NULL),
(5029,1,'JjgU5H-WFjs',NULL),
(5048,1,'sOVH8KxLAqE',NULL),
(5058,1,'cshHir5mREc',NULL),
(5091,1,'-yA2j7kNA2s',NULL),
(5091,1,'0yPtVRtYPRo',NULL),
(5091,1,'gxhghbcAhM8',NULL),
(5091,1,'dAxwVBBX4jk',NULL),
(5091,1,'31O4PwA7IDk',NULL),
(5091,1,'JBnCygw4mVc',NULL),
(5091,1,'kFyqRJ4x69w',NULL),
(5091,1,'Q6Ws3rZO9Is',NULL),
(5091,1,'2SZHgRsB_lo',NULL),
(5092,1,'-yA2j7kNA2s',NULL),
(5092,1,'0yPtVRtYPRo',NULL),
(5092,1,'VInxNKHWBcQ',NULL),
(5093,1,'-yA2j7kNA2s',NULL),
(5093,1,'31O4PwA7IDk',NULL),
(5093,1,'Upw2jeyMD0w',NULL),
(5093,1,'5CF6gG42uCY',NULL),
(5093,1,'Q6Ws3rZO9Is',NULL),
(5093,1,'3XkFJ9XswzM',NULL),
(5094,1,'0yPtVRtYPRo',NULL),
(5094,1,'afu_-a92lAo',NULL),
(5094,1,'Q6Ws3rZO9Is',NULL),
(5095,1,'0yPtVRtYPRo',NULL),
(5095,1,'Q6Ws3rZO9Is',NULL),
(5096,1,'0yPtVRtYPRo',NULL),
(5096,1,'Q6Ws3rZO9Is',NULL),
(5097,1,'0yPtVRtYPRo',NULL),
(5097,1,'Q6Ws3rZO9Is',NULL),
(5097,1,'2SZHgRsB_lo',NULL),
(5155,1,'Ye7TjZpUa84',NULL),
(5156,1,'EOkdyvHNtBs',NULL),
(5206,1,'Q-3zxM-2Nmo',NULL),
(5207,1,'Q-3zxM-2Nmo',NULL),
(5208,1,'Q-3zxM-2Nmo',NULL),
(5210,1,'d0xl_Z4B3Ug',NULL),
(5210,1,'VV2Tadq-PTk',NULL),
(5211,1,'d0xl_Z4B3Ug',NULL),
(5211,1,'ki-cRcZnJCM',NULL),
(5211,1,'TrxhOeXLHyA',NULL),
(5212,1,'d0xl_Z4B3Ug',NULL),
(5212,1,'IyzMJRcyL8A',NULL),
(5213,1,'d0xl_Z4B3Ug',NULL),
(5213,1,'xy_-vJ5nVnQ',NULL),
(5214,1,'d0xl_Z4B3Ug',NULL),
(5214,1,'fXHK2fG5uFM',NULL),
(5215,1,'d0xl_Z4B3Ug',NULL),
(5215,1,'X6_aTz8SFbc',NULL),
(5215,1,'fjsq9OFWfOM',NULL);


MERGE INTO Interpretations.Video t
USING @Video s
ON s.SectionKey = t.SectionKey
   AND s.VideoServiceKey = t.VideoServiceKey
   AND s.VideoServiceVideoId = t.VideoServiceVideoId
   AND (s.StartTime = t.StartTime OR (s.StartTime IS NULL AND t.StartTime IS NULL))
WHEN NOT MATCHED THEN
    INSERT
    (
        SectionKey,
        VideoServiceKey,
        VideoServiceVideoId,
        Url,
        StartTime,
        CreatedByUserKey
    )
    VALUES
    (s.SectionKey, s.VideoServiceKey, s.VideoServiceVideoId, NULL, StartTime, s.CreatedByUserKey)
	;

/**** WEAPONS *******/

EXEC Sources.AddWeaponsForSection 5001, 6;
EXEC Sources.AddWeaponsForSection 5089, 6;
EXEC Sources.AddWeaponsForSection 5115, 6;
EXEC Sources.AddWeaponsForSection 5153, 30;
EXEC Sources.AddWeaponsForSection 5205, 31;
EXEC Sources.AddWeaponsForSection 5209, 2;
EXEC Sources.AddWeaponsForSection 5217, 18;
EXEC Sources.AddWeaponsForSection 5236, 12;
EXEC Sources.AddWeaponsForSection 5241, 21;
EXEC Sources.AddWeaponsForSection 5246, 23;
EXEC Sources.AddWeaponsForSection 5252, 23;
EXEC Sources.AddWeaponsForSection 5256, 19;
EXEC Sources.AddWeaponsForSection 5261, 24;
EXEC Sources.AddWeaponsForSection 5264, 25;
EXEC Sources.AddWeaponsForSection 5269, 26;

