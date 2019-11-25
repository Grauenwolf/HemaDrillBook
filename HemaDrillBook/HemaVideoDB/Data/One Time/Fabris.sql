/***** Book *****/

DECLARE @BookKey INT = 7;
DECLARE @FirstAuthorKey INT = 7;

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
(@BookKey, N'Lo Schermo, overo Scienza d’Arme', 'On Fencing, or the Science of Arms', 'Fabris');

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

INSERT INTO @AlternateBookName
(
    BookKey,
    AlternateBookName
)
VALUES
(@BookKey, N'On Fencing, or the Science of Arms');


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
(@FirstAuthorKey, N'Salvator Fabris', 'Fabris');



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
(7001,NULL,'Book 1',NULL,1),
(7002,7001,'Part 1 Sword Alone',NULL,1),
(7003,7002,'Plate 1',NULL,1),
(7004,7002,'Plate 2',NULL,2),
(7005,7002,'Plate 3',NULL,3),
(7006,7002,'Plate 4',NULL,4),
(7007,7002,'Plate 5',NULL,5),
(7008,7002,'Plate 6',NULL,6),
(7009,7002,'Plate 7',NULL,7),
(7010,7002,'Plate 8',NULL,8),
(7011,7002,'Plate 9',NULL,9),
(7012,7002,'Plate 10',NULL,10),
(7013,7002,'Plate 11',NULL,11),
(7014,7002,'Plate 12',NULL,12),
(7015,7002,'Plate 13',NULL,13),
(7016,7002,'Plate 14',NULL,14),
(7017,7002,'Plate 15',NULL,15),
(7018,7002,'Plate 16',NULL,16),
(7019,7002,'Plate 17',NULL,17),
(7020,7002,'Plate 18',NULL,18),
(7021,7002,'Plate 19',NULL,19),
(7022,7002,'Plate 20',NULL,20),
(7023,7002,'Plate 21',NULL,21),
(7024,7002,'Plate 22',NULL,22),
(7025,7002,'Plate 23',NULL,23),
(7026,7002,'Plate 24',NULL,24),
(7027,7002,'Plate 25',NULL,25),
(7028,7002,'Plate 26',NULL,26),
(7029,7002,'Plate 27',NULL,27),
(7030,7002,'Plate 28',NULL,28),
(7031,7002,'Plate 29',NULL,29),
(7032,7002,'Plate 30',NULL,30),
(7033,7002,'Plate 31',NULL,31),
(7034,7002,'Plate 32',NULL,32),
(7035,7002,'Plate 33',NULL,33),
(7036,7002,'Plate 34',NULL,34),
(7037,7002,'Plate 35',NULL,35),
(7038,7002,'Plate 36',NULL,36),
(7039,7002,'Plate 37',NULL,37),
(7040,7002,'Plate 38',NULL,38),
(7041,7002,'Plate 39',NULL,39),
(7042,7002,'Plate 40',NULL,40),
(7043,7002,'Plate 41',NULL,41),
(7044,7002,'Plate 42',NULL,42),
(7045,7002,'Plate 43',NULL,43),
(7046,7002,'Plate 44',NULL,44),
(7047,7002,'Plate 45',NULL,45),
(7048,7002,'Plate 46',NULL,46),
(7049,7002,'Plate 47',NULL,47),
(7050,7002,'Plate 48',NULL,48),
(7051,7001,'Part 2 Sword and Dagger',NULL,2),
(7052,7051,'Plate 49',NULL,1),
(7053,7051,'Plate 50',NULL,2),
(7054,7051,'Plate 51',NULL,3),
(7055,7051,'Plate 52',NULL,4),
(7056,7051,'Plate 53',NULL,5),
(7057,7051,'Plate 54',NULL,6),
(7058,7051,'Plate 55',NULL,7),
(7059,7051,'Plate 56',NULL,8),
(7060,7051,'Plate 57',NULL,9),
(7061,7051,'Plate 58',NULL,10),
(7062,7051,'Plate 59',NULL,11),
(7063,7051,'Plate 60',NULL,12),
(7064,7051,'Plate 61',NULL,13),
(7065,7051,'Plate 62',NULL,14),
(7066,7051,'Plate 63',NULL,15),
(7067,7051,'Plate 64',NULL,16),
(7068,7051,'Plate 65',NULL,17),
(7069,7051,'Plate 66',NULL,18),
(7070,7051,'Plate 67',NULL,19),
(7071,7051,'Plate 68',NULL,20),
(7072,7051,'Plate 69',NULL,21),
(7073,7051,'Plate 70',NULL,22),
(7074,7051,'Plate 71',NULL,23),
(7075,7051,'Plate 72',NULL,24),
(7076,7051,'Plate 73',NULL,25),
(7077,7051,'Plate 74',NULL,26),
(7078,7051,'Plate 75',NULL,27),
(7079,7051,'Plate 76',NULL,28),
(7080,7051,'Plate 77',NULL,29),
(7081,7051,'Plate 78',NULL,30),
(7082,7051,'Plate 79',NULL,31),
(7083,7051,'Plate 80',NULL,32),
(7084,7051,'Plate 81',NULL,33),
(7085,7051,'Plate 82',NULL,34),
(7086,7051,'Plate 83',NULL,35),
(7087,7051,'Plate 84',NULL,36),
(7088,7051,'Plate 85',NULL,37),
(7089,7051,'Plate 86',NULL,38),
(7090,7051,'Plate 87',NULL,39),
(7091,7051,'Plate 88',NULL,40),
(7092,7051,'Plate 89',NULL,41),
(7093,7051,'Plate 90',NULL,42),
(7094,7051,'Plate 91',NULL,43),
(7095,7051,'Plate 92',NULL,44),
(7096,7051,'Plate 93',NULL,45),
(7097,7051,'Plate 94',NULL,46),
(7098,7051,'Plate 95',NULL,47),
(7099,7001,'Part 3 Sword and Cape',NULL,3),
(7100,7099,'Plate 97',NULL,1),
(7101,7099,'Plate 98',NULL,2),
(7102,7099,'Plate 99',NULL,3),
(7103,7099,'Plate 100',NULL,4),
(7104,7099,'Plate 101',NULL,5),
(7105,7099,'Plate 102',NULL,6),
(7106,7099,'Plate 103',NULL,7),
(7107,7099,'Plate 104',NULL,8),
(7108,7099,'Plate 105',NULL,9),
(7109,7099,'Plate 106',NULL,10),
(7110,7099,'Plate 107',NULL,11),
(7111,7099,'Plate 108',NULL,12),
(7112,NULL,'Book 2',NULL,2),
(7113,7112,'Part 1 Sword Alone',NULL,1),
(7114,7113,'First Rule',NULL,1),
(7115,7114,'Plate 109',NULL,1),
(7116,7114,'Plate 110',NULL,2),
(7117,7114,'Plate 111',NULL,3),
(7118,7114,'Plate 112',NULL,4),
(7119,7114,'Plate 113',NULL,5),
(7120,7114,'Plate 114',NULL,6),
(7121,7114,'Plate 115',NULL,7),
(7122,7114,'Plate 116',NULL,8),
(7123,7113,'Second Rule',NULL,2),
(7124,7123,'Plate 117',NULL,1),
(7125,7123,'Plate 118',NULL,2),
(7126,7123,'Plate 119',NULL,3),
(7127,7123,'Plate 120',NULL,4),
(7128,7123,'Plate 121',NULL,5),
(7129,7123,'Plate 122',NULL,6),
(7130,7123,'Plate 123',NULL,7),
(7131,7113,'Third Rule',NULL,3),
(7132,7131,'Plate 124',NULL,1),
(7133,7131,'Plate 125',NULL,2),
(7134,7131,'Plate 126',NULL,3),
(7135,7131,'Plate 127',NULL,4),
(7136,7131,'Plate 128',NULL,5),
(7137,7131,'Plate 129',NULL,6),
(7138,7113,'Fourth Rule',NULL,4),
(7139,7138,'Plate 130',NULL,1),
(7140,7138,'Plate 131',NULL,2),
(7141,7138,'Plate 132',NULL,3),
(7142,7138,'Plate 133',NULL,4),
(7143,7138,'Plate 134',NULL,5),
(7144,7138,'Plate 135',NULL,6),
(7145,7138,'Plate 136',NULL,7),
(7146,7138,'Plate 137',NULL,8),
(7147,7138,'Plate 138',NULL,9),
(7148,7138,'Plate 139',NULL,10),
(7149,7138,'Plate 140',NULL,11),
(7150,7138,'Plate 141',NULL,12),
(7151,7113,'Fifth Rule',NULL,5),
(7152,7151,'Plate 142',NULL,1),
(7153,7151,'Plate 143',NULL,2),
(7154,7151,'Plate 144',NULL,3),
(7155,7151,'Plate 145',NULL,4),
(7156,7151,'Plate 146',NULL,5),
(7157,7151,'Plate 147',NULL,6),
(7158,7151,'Plate 148',NULL,7),
(7159,7151,'Plate 149',NULL,8),
(7160,7151,'Plate 150',NULL,9),
(7161,7113,'Sixth Rule',NULL,6),
(7162,7161,'Plate 151',NULL,1),
(7163,7161,'Plate 152',NULL,2),
(7164,7161,'Plate 153',NULL,3),
(7165,7161,'Plate 154',NULL,4),
(7166,7161,'Plate 155',NULL,5),
(7167,7161,'Plate 156 (Mislabled as 157)',NULL,6),
(7168,7112,'Part 2 Sword and Dagger',NULL,2),
(7169,7168,'First Rule',NULL,1),
(7170,7169,'Plate 157',NULL,1),
(7171,7169,'Plate 158',NULL,2),
(7172,7169,'Plate 159',NULL,3),
(7173,7168,'Second Rule',NULL,2),
(7174,7173,'Plate 160',NULL,1),
(7175,7173,'Plate 161',NULL,2),
(7176,7173,'Plate 162',NULL,3),
(7177,7173,'Plate 163',NULL,4),
(7178,7168,'Third Rule',NULL,3),
(7179,7178,'Plate 164',NULL,1),
(7180,7178,'Plate 165',NULL,2),
(7181,7178,'Plate 166',NULL,3),
(7182,7178,'Plate 167',NULL,4),
(7183,7178,'Plate 168',NULL,5),
(7184,7178,'Plate 169',NULL,6),
(7185,7178,'Plate 170',NULL,7),
(7186,7178,'Plate 171',NULL,8),
(7187,7168,'Fourth Rule',NULL,4),
(7188,7187,'Plate 172',NULL,1),
(7189,7187,'Plate 173',NULL,2),
(7190,7187,'Plate 174',NULL,3),
(7191,7187,'Plate 175',NULL,4),
(7192,7187,'Plate 176',NULL,5),
(7193,7187,'Plate 177',NULL,6),
(7194,7187,'Plate 178',NULL,7),
(7195,7112,'Part 3',NULL,3),
(7196,7195,'Plate 179',NULL,1),
(7197,7195,'Plate 180',NULL,2),
(7198,7195,'Plate 181',NULL,3),
(7199,7195,'Plate 182',NULL,4),
(7200,7195,'Plate 183',NULL,5),
(7201,7195,'Plate 184',NULL,6),
(7202,7195,'Empty Hand vs. Dagger',NULL,7),
(7203,7202,'Plate 185',NULL,1),
(7204,7202,'Plate 186',NULL,2),
(7205,7202,'Plate 187',NULL,3),
(7206,7202,'Plate 188',NULL,4),
(7207,7202,'Plate 189',NULL,5),
(7208,7195,'Sword vs. Polearms',NULL,8),
(7209,7208,'Plate 190',NULL,1);


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
(7006,1,'XAI_4ttn8MA','0:1:28'),
(7006,1,'XAI_4ttn8MA','0:4:24'),
(7007,1,'KKA-FRuDuLQ',NULL),
(7007,1,'XAI_4ttn8MA','0:3:24'),
(7008,1,'XAI_4ttn8MA','0:2:02'),
(7011,1,'5E4607cWQaM',NULL),
(7012,1,'5E4607cWQaM',NULL),
(7013,1,'5E4607cWQaM','0:1:10'),
(7016,1,'SsBBrcJUrqA','0:0:37'),
(7017,1,'SsBBrcJUrqA','0:1:06'),
(7018,1,'SsBBrcJUrqA','0:1:06'),
(7020,1,'XAI_4ttn8MA','0:1:50'),
(7021,1,'nEvJO9hgW2A',NULL),
(7023,1,'KKA-FRuDuLQ',NULL),
(7024,1,'5E4607cWQaM',NULL),
(7025,1,'SsBBrcJUrqA',NULL),
(7026,1,'5E4607cWQaM',NULL),
(7027,1,'KIYEmT4RJyE',NULL),
(7028,1,'SsBBrcJUrqA',NULL),
(7029,1,'KKA-FRuDuLQ',NULL),
(7030,1,'5E4607cWQaM',NULL),
(7031,1,'KKA-FRuDuLQ',NULL),
(7031,1,'SsBBrcJUrqA',NULL),
(7033,1,'KKA-FRuDuLQ',NULL),
(7033,1,'SsBBrcJUrqA',NULL),
(7034,1,'KKA-FRuDuLQ',NULL),
(7037,1,'KKA-FRuDuLQ',NULL),
(7037,1,'KIYEmT4RJyE',NULL),
(7040,1,'SsBBrcJUrqA',NULL),
(7043,1,'KKA-FRuDuLQ',NULL),
(7045,1,'_9PmbAZPbtw',NULL),
(7045,1,'idu7m5CHilo',NULL),
(7046,1,'B8hUMVGLtGo',NULL),
(7047,1,'qpKQPCw6ImI',NULL),
(7047,1,'dZNxdGS41qQ',NULL),
(7050,1,'KKA-FRuDuLQ',NULL),
(7055,1,'KKA-FRuDuLQ',NULL),
(7068,1,'5E4607cWQaM',NULL),
(7079,1,'KKA-FRuDuLQ',NULL),
(7106,1,'KKA-FRuDuLQ',NULL),
(7209,1,'NnGQH0PGoKo',NULL);

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

EXEC Sources.AddWeaponsForSection 7002, 1;
EXEC Sources.AddWeaponsForSection 7051, 10;
EXEC Sources.AddWeaponsForSection 7099, 17;
EXEC Sources.AddWeaponsForSection 7113, 1;
EXEC Sources.AddWeaponsForSection 7168, 10;
EXEC Sources.AddWeaponsForSection 7202, 9, 8;
EXEC Sources.AddWeaponsForSection 7208, 1, 19;
