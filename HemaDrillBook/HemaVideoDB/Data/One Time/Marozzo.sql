/***** Book *****/

DECLARE @BookKey INT = 8;
DECLARE @FirstAuthorKey INT = 8;

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
(@BookKey, N'Opera Nova (Marozzo)', 'A New Work', 'Marozzo');

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
--(@BookKey, N'On Fencing, or the Science of Arms');


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
(@FirstAuthorKey, N'Achille Marozzo', 'Marozzo');



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
(8001,NULL,'Book 1',NULL,1),
(8002,8001,'Sword and Buckler',NULL,1),
(8003,8002,'Assault 1 Part 1','Cap 10',1),
(8004,8002,'Assault 1 Part 2','Cap 10.2',2),
(8005,8002,'Assault 1 Part 3','Cap 10.3',3),
(8006,8002,'Assault 1 Part 4','Cap 10.4',4),
(8007,8002,'Assault 1 Part 5','Cap 10.5',5),
(8008,8002,'Assault 1 Part 6','Cap 10.6',6),
(8009,8002,'Assault 1 Part 7','Cap 10.7',7),
(8010,8002,'Assault 2 Part 1','Cap 11',8),
(8011,8002,'Assault 2 Part 2','Cap 11.2',9),
(8012,8002,'Assault 2 Part 3','Cap 11.3',10),
(8013,8002,'Assault 2 Part 4','Cap 11.4',11),
(8014,8002,'Assault 2 Part 5','Cap 11.5',12),
(8015,8002,'Assault 2 Part 6','Cap 11.6',13),
(8016,8002,'Assault 2 Part 7','Cap 11.7',14),
(8017,8002,'Assault 2 Part 8','Cap 11.8',15),
(8018,8002,'Assault 3 Part 1 with Counter','Cap 13/14',16),
(8019,8002,'Assault 3 Part 2 with Counter','Cap 14/15',17),
(8020,8002,'Assault 3 Part 3 with Counter','Cap 15/16',18),
(8021,8002,'Assault 3 Part 4 with Counter','Cap 16/17',19),
(8022,8002,'Assault 3 Part 5 with Counter','Cap 17/18',20),
(8023,8002,'Assault 3 Part 6 with Counter',NULL,21),
(8024,8002,'Assault 3 Part 7 with 4 Counters',NULL,22),
(8025,8002,'Assault 3 Part 8 with Counter',NULL,23),
(8026,8001,'Half Sword Plays',NULL,2),
(8027,8026,'True Edge on True Edge 1 with Counter',NULL,1),
(8028,8026,'True Edge on True Edge 2 with Counter',NULL,2),
(8029,8026,'True Edge on True Edge 3 with Counter',NULL,3),
(8030,8026,'True Edge on True Edge 4 with Counter',NULL,4),
(8031,8026,'True Edge on True Edge 5 with Counter',NULL,5),
(8032,8026,'True Edge on True Edge 6 with Counter',NULL,6),
(8033,NULL,'Book 2',NULL,2),
(8034,8033,'Sword and Dagger',NULL,1),
(8035,8034,'Sword & Dagger 1',NULL,1),
(8036,8034,'Sword & Dagger 2',NULL,2),
(8037,8034,'Sword & Dagger 3',NULL,3),
(8038,8034,'Sword & Dagger 4',NULL,4),
(8039,8034,'Sword & Dagger 5',NULL,5),
(8040,8034,'Sword & Dagger 6',NULL,6),
(8041,8034,'Sword & Dagger 7',NULL,7),
(8042,8034,'Sword & Dagger 8',NULL,8),
(8043,8034,'Sword & Dagger 9',NULL,9),
(8044,8034,'Sword & Dagger 10 (Capitolo 46)',NULL,10),
(8045,8034,'Sword & Dagger 11 (Capitolo 47)',NULL,11),
(8046,8034,'Sword & Dagger 12 (Capitolo 48)',NULL,12),
(8047,8034,'Sword & Dagger 13 (Capitolo 49)',NULL,13),
(8048,8034,'Sword & Dagger 14 (Capitolo 50)',NULL,14),
(8049,8033,'Dagger Alone',NULL,2),
(8050,8049,'Dagger 1',NULL,1),
(8051,8049,'Dagger 2',NULL,2),
(8052,8049,'Dagger 3',NULL,3),
(8053,8049,'Dagger 4',NULL,4),
(8054,8049,'Dagger 5',NULL,5),
(8055,8033,'Dagger and Cape',NULL,3),
(8056,8055,'Dagger & Cape 1',NULL,1),
(8057,8055,'Dagger & Cape 2',NULL,2),
(8058,8055,'Dagger & Cape 3',NULL,3),
(8059,8055,'Dagger & Cape 4',NULL,4),
(8060,8055,'Dagger & Cape 5',NULL,5),
(8061,8033,'Sword and Cape',NULL,4),
(8062,8061,'Sword & Cape 1',NULL,1),
(8063,8061,'Sword & Cape 2',NULL,2),
(8064,8061,'Sword & Cape 3',NULL,3),
(8065,8061,'Sword & Cape 4',NULL,4),
(8066,8061,'Sword & Cape 5',NULL,5),
(8067,8061,'Sword & Cape 6',NULL,6),
(8068,8061,'Sword & Cape 7',NULL,7),
(8069,8061,'Sword & Cape 8',NULL,8),
(8070,8061,'Sword & Cape 9',NULL,9),
(8071,8061,'Sword & Cape 10',NULL,10),
(8072,8033,'Two Swords',NULL,5),
(8073,8072,'Two Swords 1',NULL,1),
(8074,8072,'Two Swords 2',NULL,2),
(8075,8072,'Two Swords 3',NULL,3),
(8076,8072,'Two Swords 4',NULL,4),
(8077,8072,'Two Swords 5',NULL,5),
(8078,8072,'Two Swords 6',NULL,6),
(8079,8072,'Two Swords 7',NULL,7),
(8080,8072,'Two Swords 8',NULL,8),
(8081,8033,'Sword and Large Buckler',NULL,6),
(8082,8081,'Sword & Large Buckler Intro (Capitolo 85)',NULL,1),
(8083,8081,'Sword & Large Buckler 1 (Capitolo 86)',NULL,2),
(8084,8081,'Sword & Large Buckler 2 (Capitolo 87)',NULL,3),
(8085,8081,'Sword & Large Buckler 3',NULL,4),
(8086,8081,'Sword & Large Buckler 4',NULL,5),
(8087,8081,'Sword & Large Buckler 5',NULL,6),
(8088,8081,'Sword & Large Buckler 6',NULL,7),
(8089,8081,'Sword & Large Buckler 7',NULL,8),
(8090,8081,'Sword & Large Buckler 8',NULL,9),
(8091,8033,'Sword Alone',NULL,7),
(8092,8091,'Sword 1 (Capitolo 94)',NULL,1),
(8093,8091,'Sword 2 (Capitolo 95)',NULL,2),
(8094,8091,'Sword 3 (Capitolo 96)',NULL,3),
(8095,8091,'Sword 4 (Capitolo 97)',NULL,4),
(8096,8091,'Sword 5 (Capitolo 98)',NULL,5),
(8097,8091,'Sword 6 (Capitolo 99)',NULL,6),
(8098,8091,'Sword 7 (Capitolo 100)',NULL,7),
(8099,8033,'Sword and Rotella',NULL,8),
(8100,8099,'Sword & Rotella Intro (Capitolo 101)',NULL,1),
(8101,8099,'Sword & Rotella 1 (Capitolo 102)',NULL,2),
(8102,8099,'Sword & Rotella 2 (Capitolo 103)',NULL,3),
(8103,8099,'Sword & Rotella 3 (Capitolo 104)',NULL,4),
(8104,8099,'Sword & Rotella 4 (Capitolo 105)',NULL,5),
(8105,8099,'Sword & Rotella 5 (Capitolo 106)',NULL,6),
(8106,8099,'Sword & Rotella 6 (Capitolo 107)',NULL,7),
(8107,8099,'Sword & Rotella 7 (Capitolo 108)',NULL,8),
(8108,8099,'Sword & Rotella 8 (Capitolo 109)',NULL,9),
(8109,8099,'Sword & Rotella 9 (Capitolo 110)',NULL,10),
(8110,8099,'Sword & Rotella 10 (Capitolo 111)',NULL,11),
(8111,8099,'Sword & Rotella 11 (Capitolo 112)',NULL,12),
(8112,8033,'Sword and Targa',NULL,9),
(8113,8112,'Sword & Targa Assault 1 Part 1',NULL,1),
(8114,8112,'Sword & Targa Assault 1 Part 2',NULL,2),
(8115,8112,'Sword & Targa Assault 1 Part 3',NULL,3),
(8116,8112,'Sword & Targa Assault 1 Part 4',NULL,4),
(8117,8112,'Sword & Targa Assault 1 Part 5',NULL,5),
(8118,8112,'Sword & Targa Assault 1 Part 6',NULL,6),
(8119,8112,'Sword & Targa Assault 1 Part 7',NULL,7),
(8120,8112,'Sword & Targa Assault 1 Part 8',NULL,8),
(8121,8112,'Sword & Targa Assault 1 Part 9',NULL,9),
(8122,8112,'Sword & Targa Assault 1 Part 10',NULL,10),
(8123,8112,'Sword & Targa Assault 1 Part 11',NULL,11),
(8124,8112,'Sword & Targa Assault 1 Part 12',NULL,12),
(8125,8112,'Sword & Targa Assault 2 Part 1',NULL,13),
(8126,8112,'Sword & Targa Assault 2 Part 2',NULL,14),
(8127,8112,'Sword & Targa Assault 2 Part 3',NULL,15),
(8128,8112,'Sword & Targa Assault 2 Part 4',NULL,16),
(8129,8112,'Sword & Targa Assault 2 Part 5',NULL,17),
(8130,8112,'Sword & Targa Assault 2 Part 6',NULL,18),
(8131,8112,'Sword & Targa Assault 2 Part 7',NULL,19),
(8132,8112,'Sword & Targa Assault 2 Part 8',NULL,20),
(8133,8112,'Sword & Targa Assault 2 Part 9',NULL,21),
(8134,8112,'Sword & Targa Assault 2 Part 10',NULL,22),
(8135,8112,'Sword & Targa Assault 2 Part 11',NULL,23),
(8136,8033,'Against the Left Handed',NULL,10),
(8137,8136,'Left Handed 1',NULL,1),
(8138,8136,'Left Handed 2',NULL,2),
(8139,8136,'Left Handed 3',NULL,3),
(8140,8136,'Left Handed 4',NULL,4),
(8141,8033,'Sword and Imbraciatura',NULL,11),
(8142,8141,'Sword & Imbraciatura 1',NULL,1),
(8143,8141,'Sword & Imbraciatura 2',NULL,2),
(8144,8141,'Sword & Imbraciatura 3',NULL,3),
(8145,8141,'Sword & Imbraciatura 4',NULL,4),
(8146,8033,'Mixed Weapons',NULL,12),
(8147,8146,'Imbraciatura vs Pole Arms',NULL,1),
(8148,8146,'Targa vs Pole Arms 1',NULL,2),
(8149,8146,'Targa vs Pole Arms 2',NULL,3),
(8150,8146,'Targa vs Pole Arms 3',NULL,4),
(8151,8146,'Man vs Horse',NULL,5),
(8152,NULL,'Book 3',NULL,3),
(8153,8152,'Great Sword',NULL,1),
(8154,8153,'Assault 1 Part 1',NULL,1),
(8155,8153,'Assault 1 Part 2',NULL,2),
(8156,8153,'Assault 1 Part 3',NULL,3),
(8157,8153,'Assault 1 Part 4',NULL,4),
(8158,8153,'Assault 1 Part 5',NULL,5),
(8159,8153,'Assault 1 Part 6',NULL,6),
(8160,8153,'Assault 1 Part 7',NULL,7),
(8161,8153,'Assault 1 Part 8',NULL,8),
(8162,8153,'Assault 1 Part 9',NULL,9),
(8163,8153,'Assault 1 Part 10',NULL,10),
(8164,8153,'Assault 2 Part 1',NULL,11),
(8165,8153,'Assault 2 Part 2',NULL,12),
(8166,8153,'Assault 2 Part 3',NULL,13),
(8167,8153,'Assault 2 Part 4',NULL,14),
(8168,8153,'Assault 2 Part 5',NULL,15),
(8169,8153,'Assault 2 Part 6',NULL,16),
(8170,8153,'Assault 2 Part 7',NULL,17),
(8171,8153,'Assault 2 Part 8',NULL,18),
(8172,8153,'Assault 2 Part 9',NULL,19),
(8173,8153,'Assault 2 Part 10',NULL,20),
(8174,8153,'True Edge on True Edge 1',NULL,21),
(8175,8153,'True Edge on True Edge 2',NULL,22),
(8176,8153,'True Edge on True Edge 3',NULL,23),
(8177,8153,'True Edge on True Edge 4',NULL,24),
(8178,8153,'True Edge on True Edge 5',NULL,25),
(8179,8153,'True Edge on True Edge 6',NULL,26),
(8180,8153,'True Edge on True Edge 7',NULL,27),
(8181,8153,'True Edge on True Edge 8',NULL,28),
(8182,8153,'True Edge on True Edge 9',NULL,29),
(8183,8153,'True Edge on True Edge 10',NULL,30),
(8184,8153,'True Edge on True Edge 11',NULL,31),
(8185,8153,'True Edge on True Edge 12',NULL,32),
(8186,8153,'True Edge on True Edge 13 (Definition)',NULL,33),
(8187,8153,'False Edge on False Edge 1',NULL,34),
(8188,8153,'False Edge on False Edge 2',NULL,35),
(8189,8153,'False Edge on False Edge 3',NULL,36),
(8190,8153,'False Edge on False Edge 4',NULL,37),
(8191,8153,'False Edge on False Edge 5',NULL,38),
(8192,8153,'False Edge on False Edge 6',NULL,39),
(8193,8153,'False Edge on False Edge 7',NULL,40),
(8194,NULL,'Book 4',NULL,4),
(8195,8194,'Partisan and Rotella',NULL,1),
(8196,8195,'Partisan & Rotella 1',NULL,1),
(8197,8195,'Partisan & Rotella 2',NULL,2),
(8198,8195,'Partisan & Rotella 3',NULL,3),
(8199,8195,'Partisan & Rotella 4',NULL,4),
(8200,8195,'Partisan & Rotella 5',NULL,5),
(8201,8195,'Partisan & Rotella 6',NULL,6),
(8202,8195,'Partisan & Rotella 7',NULL,7),
(8203,8195,'Partisan & Rotella 8',NULL,8),
(8204,8194,'Partisan',NULL,2),
(8205,8204,'Partisan 1',NULL,1),
(8206,8204,'Partisan 2',NULL,2),
(8207,8204,'Partisan 3',NULL,3),
(8208,8204,'Partisan 4',NULL,4),
(8209,8204,'Partisan 5',NULL,5),
(8210,8204,'Partisan 6',NULL,6),
(8211,8194,'Pike',NULL,3),
(8212,8211,'Pike 1',NULL,1),
(8213,8211,'Pike 2',NULL,2),
(8214,8211,'Pike 3',NULL,3),
(8215,8211,'Pike 4',NULL,4),
(8216,8194,'Spiedo',NULL,4),
(8217,8216,'Spiedo 1',NULL,1),
(8218,8216,'Spiedo 2',NULL,2),
(8219,8216,'Spiedo 3',NULL,3),
(8220,8216,'Spiedo 4',NULL,4),
(8221,8216,'Spiedo 5',NULL,5),
(8222,8216,'Spiedo 6',NULL,6),
(8223,8194,'Bill',NULL,5),
(8224,8223,'Bill 1',NULL,1),
(8225,8223,'Bill 2',NULL,2),
(8226,8223,'Bill 3',NULL,3),
(8227,8223,'Bill 4',NULL,4),
(8228,8223,'Bill 5',NULL,5),
(8229,8194,'Mixed Weapons',NULL,6),
(8230,8229,'Mixed Polearm 1',NULL,1),
(8231,8229,'Mixed Polearm 2',NULL,2),
(8232,NULL,'Book 5',NULL,5),
(8233,8232,'Wrestling (with the Dagger)',NULL,1),
(8234,8233,'Wrestling 1',NULL,1),
(8235,8233,'Wrestling 2',NULL,2),
(8236,8233,'Wrestling 3',NULL,3),
(8237,8233,'Wrestling 4',NULL,4),
(8238,8233,'Wrestling 5',NULL,5),
(8239,8233,'Wrestling 6',NULL,6),
(8240,8233,'Wrestling 7',NULL,7),
(8241,8233,'Wrestling 8',NULL,8),
(8242,8233,'Wrestling 9',NULL,9),
(8243,8233,'Wrestling 10',NULL,10),
(8244,8233,'Wrestling 11',NULL,11),
(8245,8233,'Wrestling 12',NULL,12),
(8246,8233,'Wrestling 13',NULL,13),
(8247,8233,'Wrestling 14',NULL,14),
(8248,8233,'Wrestling 15',NULL,15),
(8249,8233,'Wrestling 16',NULL,16),
(8250,8233,'Wrestling 17',NULL,17),
(8251,8233,'Wrestling 18',NULL,18),
(8252,8233,'Wrestling 19',NULL,19),
(8253,8233,'Wrestling 20',NULL,20),
(8254,8233,'Wrestling 21',NULL,21),
(8255,8233,'Wrestling 22',NULL,22);



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
(8003,1,'paxk0FAUBuA',NULL),
(8003,1,'O0qB9dA0z6o',NULL),
(8003,1,'966FlGmHMxY',NULL),
(8003,1,'aAx8e8nYKmU',NULL),
(8003,1,'DrmbJXnk54c',NULL),
(8003,1,'hytftALwAHA',NULL),
(8004,1,'UeoqbZUm09A',NULL),
(8004,1,'Q-QyFhO6gR8',NULL),
(8004,1,'W0oaB4S8wMw',NULL),
(8005,1,'SC6yxEqWDdI',NULL),
(8005,1,'F-E4WHQKuQE',NULL),
(8005,1,'GY84q9VHoCM',NULL),
(8005,1,'RZLwLqVa828',NULL),
(8006,1,'yyFQ84YVnDw',NULL),
(8006,1,'di3jmJUq-7o',NULL),
(8007,1,'qHQCWcjeo54',NULL),
(8008,1,'Ezj6oXW59NQ',NULL),
(8009,1,'uhX_Ytuo0rg',NULL),
(8010,1,'D71YmcR1f8c',NULL),
(8011,1,'_wYKYtoIM44',NULL),
(8012,1,'DBR0zVl7NLk',NULL),
(8045,1,'3uywmOu9rOg',NULL),
(8073,1,'S8xGvWkdjQ4',NULL),
(8074,1,'rJCtyl-WRCI',NULL),
(8094,1,'hREnZNhRDKs',NULL),
(8154,1,'xuqPBe7AKXA',NULL),
(8154,1,'Xoq5jeT2UE0',NULL),
(8154,1,'gSdgHDfGPEs',NULL),
(8154,1,'f-ZXWQFRlw0',NULL),
(8154,1,'8KSKUQr_KKo',NULL),
(8154,1,'lrDKaCcXeVA',NULL),
(8154,1,'G6E0nvaPcTM',NULL),
(8154,1,'8gY4X32o_Y4',NULL),
(8155,1,'gSdgHDfGPEs',NULL),
(8155,1,'8KSKUQr_KKo',NULL),
(8155,1,'7VdF9ogX81o',NULL),
(8155,1,'lrDKaCcXeVA',NULL),
(8155,1,'8gY4X32o_Y4',NULL),
(8156,1,'XX9ecISUn40',NULL),
(8156,1,'8KSKUQr_KKo',NULL),
(8156,1,'jLAs034EZFw',NULL),
(8156,1,'lrDKaCcXeVA',NULL),
(8156,1,'8gY4X32o_Y4',NULL),
(8157,1,'N4Xx334tHko',NULL),
(8157,1,'lrDKaCcXeVA',NULL),
(8157,1,'8gY4X32o_Y4',NULL),
(8158,1,'kQdEK3U3FW8',NULL),
(8158,1,'lrDKaCcXeVA',NULL),
(8158,1,'8gY4X32o_Y4',NULL),
(8159,1,'lXah7HbPOlo',NULL),
(8159,1,'lrDKaCcXeVA',NULL),
(8159,1,'8gY4X32o_Y4',NULL),
(8160,1,'pZ5d9Sf98lQ',NULL),
(8160,1,'lrDKaCcXeVA',NULL),
(8161,1,'Nim3fIPt4Po',NULL),
(8161,1,'lrDKaCcXeVA',NULL),
(8161,1,'8gY4X32o_Y4',NULL),
(8162,1,'OuvLj2bibBA',NULL),
(8162,1,'lrDKaCcXeVA',NULL),
(8162,1,'8gY4X32o_Y4',NULL),
(8163,1,'h7lK48eTpOM',NULL),
(8163,1,'lrDKaCcXeVA',NULL),
(8163,1,'8gY4X32o_Y4',NULL),
(8174,1,'1qMhNmK5dfM',NULL),
(8175,1,'TcUdjcX7gG4',NULL),
(8176,1,'1GgJUtvcjOI',NULL),
(8177,1,'AxjoJU_dWQc',NULL),
(8178,1,'lKIMy_HU_7s',NULL),
(8179,1,'GhkQlx0_fmY',NULL),
(8180,1,'HosunYQz8l0',NULL),
(8181,1,'0--Q6wez4gY',NULL),
(8234,1,'q-CQOExyqjI',NULL),
(8234,1,'L3QjuFWXUDw',NULL),
(8235,1,'X5EiyWV9rRs',NULL),
(8236,1,'CwOJ1A2kdN4',NULL),
(8236,1,'L3QjuFWXUDw',NULL),
(8237,1,'mrj-8H0SVM4',NULL),
(8238,1,'NWvidJBd6rs',NULL),
(8239,1,'nOmBqHXF_Ks',NULL),
(8240,1,'AGv6Pg5xSPQ',NULL),
(8241,1,'X6d1ebdKoAc',NULL),
(8242,1,'JrCBQ7LjZaI',NULL),
(8243,1,'LN6361Jk3_U',NULL),
(8244,1,'UMpAKsx_HMs',NULL),
(8245,1,'SbCUJSCe8I0',NULL),
(8246,1,'j4Fuctmko84',NULL),
(8247,1,'h4rQreNqmro',NULL),
(8248,1,'E_ZjpSmpqrY',NULL),
(8249,1,'Eqr_5kukvbQ',NULL),
(8250,1,'SSfUoUkkOZU',NULL),
(8251,1,'uwAzQbyhhVQ',NULL),
(8252,1,'jUg8kjJ72Tw',NULL),
(8253,1,'DA--CqzaHB8',NULL),
(8254,1,'V-MKsADZhyM',NULL),
(8255,1,'Pvz0oNkqLjs',NULL);


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

--EXEC Sources.AddWeaponsForSection 7002, 1;
--EXEC Sources.AddWeaponsForSection 7051, 10;
--EXEC Sources.AddWeaponsForSection 7099, 17;
--EXEC Sources.AddWeaponsForSection 7113, 1;
--EXEC Sources.AddWeaponsForSection 7168, 10;
--EXEC Sources.AddWeaponsForSection 7202, 9, 8;
--EXEC Sources.AddWeaponsForSection 7208, 1, 19;
