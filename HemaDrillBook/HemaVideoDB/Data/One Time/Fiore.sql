/***** Book *****/

DECLARE @BookKey INT = 9;
DECLARE @FirstAuthorKey INT = 9;

DECLARE @Book TABLE
(
    BookKey INT NOT NULL,
    BookName NVARCHAR(500) NOT NULL,
    AlternateBookName NVARCHAR(500) NULL,
    Slug CHAR(50) NOT NULL,
	Notes NVARCHAR(max) NULL
);

INSERT INTO @Book
(
    BookKey,
    BookName,
    AlternateBookName,
    Slug,
	Notes
)
VALUES
(@BookKey, N'Flower of Battle (Wiktenauer Completed Translation)', NULL, 'Fiore', 'This index uses the verse numbers found in the Getty/PD Completed Translation found on Wiktenauer. Other numbering systems are found in parens. G:Getty, GE:Getty Exiles Translation');

MERGE INTO Sources.Book t
USING @Book s
ON t.BookKey = s.BookKey
WHEN NOT MATCHED THEN
    INSERT
    (
        BookKey,
        BookName,
        AlternateBookName,
        BookSlug,
		Notes
    )
    VALUES
    (s.BookKey, s.BookName, s.AlternateBookName, s.Slug, s.Notes)
WHEN MATCHED AND s.BookName <> t.BookName
                 OR s.AlternateBookName <> t.AlternateBookName
                 OR s.Slug <> t.BookSlug
				 OR ISNULL(s.Notes, '') <> ISNULL(t.Notes, '') THEN
    UPDATE SET t.BookName = s.BookName,
               t.AlternateBookName = s.AlternateBookName,
               t.BookSlug = s.Slug,
			   t.Notes=s.Notes;

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
(@FirstAuthorKey, N'Fiore Furlano de’i Liberi de Cividale d’Austria', 'Fiore');



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
(9001,NULL,'Abrazare (Grappling)',NULL,1),
(9002,9001,'Grappling 2 (G 1)',NULL,1),
(9003,9001,'Grappling 3 (G 2)',NULL,2),
(9004,9001,'Grappling 4 (G 3)',NULL,3),
(9005,9001,'Grappling 5 (G 4)',NULL,4),
(9006,9001,'Grappling 6 (G 5)',NULL,5),
(9007,9001,'Grappling 7 (G 6)',NULL,6),
(9008,9001,'Grappling 8 (G 7)',NULL,7),
(9009,9001,'Grappling 9 (G 8)',NULL,8),
(9010,9001,'Grappling 10 (G 9)',NULL,9),
(9011,9001,'Grappling 11 (G 10)',NULL,10),
(9012,9001,'Grappling 12 (G 11)',NULL,11),
(9013,9001,'Grappling 13 (G 12)',NULL,12),
(9014,9001,'Grappling 14 (G 13)',NULL,13),
(9015,9001,'Grappling 15 (G 14)',NULL,14),
(9016,9001,'Grappling 16 (G 15)',NULL,15),
(9017,9001,'Grappling 17 (G 16)',NULL,16),
(9018,9001,'Grappling 18 (G 17)',NULL,17),
(9019,9001,'Grappling 19 (G 18)',NULL,18),
(9020,9001,'Grappling 20 (G 19)',NULL,19),
(9021,9001,'Grappling 21 (G 20)',NULL,20),
(9022,NULL,'Baton',NULL,2),
(9023,9022,'Baton 1',NULL,1),
(9024,9022,'Baton 2',NULL,2),
(9025,9022,'Baton 3',NULL,3),
(9026,9022,'Baton 4',NULL,4),
(9027,NULL,'Dagger',NULL,3),
(9362,9027,'Introduction',NULL,3),
(9028,9362,'Dagger 1',NULL,1),
(9029,9362,'Dagger 2',NULL,2),
(9030,9362,'Dagger 3',NULL,3),
(9031,9362,'Dagger 4',NULL,4),
(9032,9362,'Dagger 5',NULL,5),
(9033,9362,'Dagger 6',NULL,6),
(9034,9362,'Dagger 7',NULL,7),
(9035,9362,'Dagger 8',NULL,8),
(9036,9362,'Dagger 9',NULL,9),
(9037,9362,'Dagger 10',NULL,10),
(9038,9362,'Dagger 11',NULL,11),
(9039,9362,'Dagger 12',NULL,12),
(9040,9362,'Dagger 13',NULL,13),
(9041,9362,'Dagger 14',NULL,14),
(9042,9362,'Dagger 15',NULL,15),
(9043,9362,'Dagger 16',NULL,16),
(9044,9027,'First Master',NULL,17),
(9045,9044,'Dagger 17 (G 1)',NULL,1),
(9046,9044,'Dagger 18 (G 2)',NULL,2),
(9047,9044,'Dagger 19 (G 3)',NULL,3),
(9048,9044,'Dagger 20 (G 4)',NULL,4),
(9049,9044,'Dagger 21 (G 5)',NULL,5),
(9050,9044,'Dagger 22 (G 6)',NULL,6),
(9051,9044,'Dagger 23 (G 7)',NULL,7),
(9052,9044,'Dagger 24 (G 8)',NULL,8),
(9053,9044,'Dagger 25 (G 9)',NULL,9),
(9054,9044,'Dagger 26',NULL,10),
(9055,9044,'Dagger 27',NULL,11),
(9056,9044,'Dagger 28',NULL,12),
(9057,9044,'Dagger 29 (G 10)',NULL,13),
(9058,9044,'Dagger 30 (G 11)',NULL,14),
(9059,9044,'Dagger 31 (G 12)',NULL,15),
(9060,9044,'Dagger 32 (G 13)',NULL,16),
(9061,9044,'Dagger 33 (G 14)',NULL,17),
(9062,9044,'Dagger 34 (G 15)',NULL,18),
(9063,9044,'Dagger 35 (G 16)',NULL,19),
(9064,9044,'Dagger 36 (G 17)',NULL,20),
(9065,9044,'Dagger 37 (G 18)',NULL,21),
(9066,9044,'Dagger 38 (G 19)',NULL,22),
(9067,9044,'Dagger 39 (G 20)',NULL,23),
(9068,9044,'Dagger 40 (G 21)',NULL,24),
(9069,9027,'Second Master',NULL,18),
(9070,9069,'Dagger 41 (G 1)',NULL,1),
(9071,9069,'Dagger 42 (G 2)',NULL,2),
(9072,9069,'Dagger 43 (G 3)',NULL,3),
(9073,9069,'Dagger 44 (G 4)',NULL,4),
(9074,9027,'Third Master',NULL,19),
(9075,9074,'Dagger 45',NULL,1),
(9076,9074,'Dagger 46',NULL,2),
(9077,9074,'Dagger 47 (G 1)',NULL,3),
(9078,9074,'Dagger 48 (G 2)',NULL,4),
(9079,9074,'Dagger 49 (G 3)',NULL,5),
(9080,9074,'Dagger 50',NULL,6),
(9081,9074,'Dagger 51 (G 4)',NULL,7),
(9082,9074,'Dagger 52 (G 5)',NULL,8),
(9083,9074,'Dagger 53',NULL,9),
(9084,9074,'Dagger 54 (G 6)',NULL,10),
(9085,9074,'Dagger 55 (G 7)',NULL,11),
(9086,9027,'Fourth Master',NULL,20),
(9087,9086,'Dagger 56 (G 1)',NULL,1),
(9088,9086,'Dagger 57 (G 1)',NULL,2),
(9089,9086,'Dagger 58 (G 2)',NULL,3),
(9090,9086,'Dagger 59 (G 3)',NULL,4),
(9091,9086,'Dagger 60',NULL,5),
(9092,9086,'Dagger 61 (G 4)',NULL,6),
(9093,9086,'Dagger 62 (G 5)',NULL,7),
(9094,9086,'Dagger 63 (G 6)',NULL,8),
(9095,9086,'Dagger 64',NULL,9),
(9096,9086,'Dagger 65 (G 7)',NULL,10),
(9097,9027,'Fifth Master',NULL,21),
(9098,9097,'Dagger 66 (G 1)',NULL,1),
(9099,9097,'Dagger 67 (G 2)',NULL,2),
(9100,9097,'Dagger 68 (G 2)',NULL,3),
(9101,9097,'Dagger 69 (G 3)',NULL,4),
(9102,9097,'Dagger 70 (G 3)',NULL,5),
(9103,9097,'Dagger 71 (G 4)',NULL,6),
(9104,9097,'Dagger 72 (G 5)',NULL,7),
(9105,9097,'Dagger 73 (G 6)',NULL,8),
(9106,9097,'Dagger 74 (G 7)',NULL,9),
(9107,9097,'Dagger 75 (G 8)',NULL,10),
(9108,9097,'Dagger 76 (G 9)',NULL,11),
(9109,9097,'Dagger 77 (G 10)',NULL,12),
(9110,9097,'Dagger 78 (G 11)',NULL,13),
(9111,9097,'Dagger 79 (G 12)',NULL,14),
(9112,9097,'Dagger 80 (G 13)',NULL,15),
(9113,9027,'Sixth Master',NULL,22),
(9114,9113,'Dagger 81 (G 1)',NULL,1),
(9115,9113,'Dagger 82 (G 2)',NULL,2),
(9116,9113,'Dagger 83 (G 3)',NULL,3),
(9117,9113,'Dagger 84 (G 4)',NULL,4),
(9118,9113,'Dagger 85 (G 5)',NULL,5),
(9119,9113,'Dagger 86 (G 6)',NULL,6),
(9120,9113,'Dagger 87 (G 7)',NULL,7),
(9121,9113,'Dagger 88 (G 8)',NULL,8),
(9122,9113,'Dagger 89',NULL,9),
(9123,9027,'Seventh Master',NULL,23),
(9124,9123,'Dagger 90 (G 1)',NULL,1),
(9125,9123,'Dagger 91 (G 1)',NULL,2),
(9126,9123,'Dagger 92 (G 1)',NULL,3),
(9127,9123,'Dagger 93 (G 2)',NULL,4),
(9128,9027,'Eighth Master',NULL,24),
(9129,9128,'Dagger 94 (G 1)',NULL,1),
(9130,9128,'Dagger 95 (G 1)',NULL,2),
(9131,9128,'Dagger 96 (G 2)',NULL,3),
(9132,9128,'Dagger 97 (G 3)',NULL,4),
(9133,9128,'Dagger 98 (G 4)',NULL,5),
(9134,9027,'Ninth Master',NULL,25),
(9135,9134,'Dagger 99',NULL,1),
(9136,9134,'Dagger 100 (G 1)',NULL,2),
(9137,9134,'Dagger 101 (G 2)',NULL,3),
(9138,9134,'Dagger 102 (G 3)',NULL,4),
(9139,9134,'Dagger 103 (G 4)',NULL,5),
(9140,9134,'Dagger 104 (G 5)',NULL,6),
(9141,9134,'Dagger 105 (G 6)',NULL,7),
(9142,9134,'Dagger 106 (G 7)',NULL,8),
(9143,9134,'Dagger 107 (G 8)',NULL,9),
(9144,9134,'Dagger 108 (G 9)',NULL,10),
(9145,9134,'Dagger 109 (G 10)',NULL,11),
(9146,9134,'Dagger 110 (G 11) This is included in Play 10 in some translations.',NULL,12),
(9147,NULL,'Sword vs Dagger',NULL,4),
(9148,9147,'Sword vs Dagger 1 (G 1)',NULL,1),
(9149,9147,'Sword vs Dagger 2 (G 2)',NULL,2),
(9150,9147,'Sword vs Dagger 3 (G 3)',NULL,3),
(9151,9147,'Sword vs Dagger 4 (G 4)',NULL,4),
(9152,9147,'Sword vs Dagger 5',NULL,5),
(9153,9147,'Sword vs Dagger 6 (G 5)',NULL,6),
(9154,9147,'Sword vs Dagger 7 (G 6)',NULL,7),
(9155,9147,'Sword vs Dagger 8 (G 7)',NULL,8),
(9156,9147,'Sword vs Dagger 9 (G 8)',NULL,9),
(9157,9147,'Sword vs Dagger 10 (G 9)',NULL,10),
(9158,NULL,'Sword in One Hand',NULL,5),
(9159,9158,'Sword in One Hand 1 (G 1)',NULL,1),
(9160,9158,'Sword in One Hand 2 (G 2, GE 1)',NULL,2),
(9161,9158,'Sword in One Hand 3 (G 2, GE 1)',NULL,3),
(9162,9158,'Sword in One Hand 4',NULL,4),
(9163,9158,'Sword in One Hand 5 (G 3, GE 2)',NULL,5),
(9164,9158,'Sword in One Hand 6 (G 4, GE 3)',NULL,6),
(9165,9158,'Sword in One Hand 7 (G 5, GE 4)',NULL,7),
(9166,9158,'Sword in One Hand 8 (G 6, GE 5)',NULL,8),
(9167,9158,'Sword in One Hand 9 (G 7, GE 6)',NULL,9),
(9168,9158,'Sword in One Hand 10 (G 8, GE 7)',NULL,10),
(9169,9158,'Sword in One Hand 11 (G 9, GE 8)',NULL,11),
(9170,9158,'Sword in One Hand 12 (G 10, GE 9)',NULL,12),
(9171,9158,'Sword in One Hand 13 (G 11, GE 10)',NULL,13),
(9172,9158,'Sword in One Hand 14 (G 12, GE 11)',NULL,14),
(9173,9158,'Sword in One Hand 15 (G 13, GE 12)',NULL,15),
(9174,NULL,'Sword in Two Hands',NULL,6),
(9175,9174,'Sword in Two Hands 1',NULL,1),
(9176,9174,'Sword in Two Hands 2',NULL,2),
(9177,9174,'Sword in Two Hands 3',NULL,3),
(9178,9174,'Sword in Two Hands 4',NULL,4),
(9179,9174,'Sword in Two Hands 5',NULL,5),
(9180,9174,'Sword in Two Hands 6',NULL,6),
(9181,9174,'Sword in Two Hands 7',NULL,7),
(9182,9174,'Sword in Two Hands 8 - Downward Blows',NULL,8),
(9183,9174,'Sword in Two Hands 9 - Under Blows',NULL,9),
(9184,9174,'Sword in Two Hands 10 - Middle Blows',NULL,10),
(9185,9174,'Sword in Two Hands 11 - The Thrusts',NULL,11),

(9363,9174,'Guards',NULL,12),
(9186,9363,'Sword in Two Hands 12 - The Iron Gate',NULL,12),
(9187,9363,'Sword in Two Hands 13',NULL,13),
(9188,9363,'Sword in Two Hands 14 - The Stance of the Queen on the Right',NULL,14),
(9189,9363,'Sword in Two Hands 15 - The Stance of the Window',NULL,15),
(9190,9363,'Sword in Two Hands 16 - The Middle Iron Gate ',NULL,16),
(9191,9363,'Sword in Two Hands 17 - The Extended Stance',NULL,17),
(9192,9363,'Sword in Two Hands 18 - The Headband Stance called the Crown',NULL,18),
(9193,9363,'Sword in Two Hands 19 - The Stance of the Queen on the Right',NULL,19),
(9194,9363,'Sword in Two Hands 20 - The Wild Boar''s Tusk',NULL,20),
(9195,9363,'Sword in Two Hands 21 - The Shortened Stance',NULL,21),
(9196,9363,'Sword in Two Hands 22 - The Stance of the Queen on the Left',NULL,22),
(9197,9363,'Sword in Two Hands 23 - The Stance of the Long Tail',NULL,23),
(9198,9363,'Sword in Two Hands 24 - The Two-Horned Stance',NULL,24),
(9199,9363,'Sword in Two Hands 25 - The Stance of the Boar''s Tusk in the Middle',NULL,25),
(9200,9174,'Largo',NULL,26),
(9201,9200,'Sword in Two Hands 26',NULL,1),
(9202,9200,'Sword in Two Hands 27 (GE 1)',NULL,2),
(9203,9200,'Sword in Two Hands 28 (GE 2)',NULL,3),
(9204,9200,'Sword in Two Hands 29 (GE 3)',NULL,4),
(9205,9200,'Sword in Two Hands 30 (GE 4)',NULL,5),
(9206,9200,'Sword in Two Hands 31 (GE 5)',NULL,6),
(9207,9200,'Sword in Two Hands 32 (GE 6)',NULL,7),
(9208,9200,'Sword in Two Hands 33 (GE 7)',NULL,8),
(9209,9200,'Sword in Two Hands 34 (GE 8)',NULL,9),
(9210,9200,'Sword in Two Hands 35 (GE 9)',NULL,10),
(9211,9200,'Sword in Two Hands 36 (GE 10)',NULL,11),
(9212,9200,'Sword in Two Hands 37 (GE 11)',NULL,12),
(9213,9200,'Sword in Two Hands 38 (GE 12)',NULL,13),
(9214,9200,'Sword in Two Hands 39 (GE 13)',NULL,14),
(9215,9200,'Sword in Two Hands 40 (GE 14)',NULL,15),
(9216,9200,'Sword in Two Hands 41 (GE 15)',NULL,16),
(9217,9200,'Sword in Two Hands 42 (GE 16)',NULL,17),
(9218,9200,'Sword in Two Hands 43 (GE 17)',NULL,18),
(9219,9200,'Sword in Two Hands 44 (GE 18)',NULL,19),
(9220,9200,'Sword in Two Hands 45 (GE 19)',NULL,20),
(9221,9200,'Sword in Two Hands 46 (GE 20)',NULL,21),
(9222,9200,'Sword in Two Hands 47',NULL,22),
(9223,9174,'Stretto',NULL,27),
(9224,9223,'Sword in Two Hands 48',NULL,1),
(9225,9223,'Sword in Two Hands 49 (GE 1)',NULL,2),
(9226,9223,'Sword in Two Hands 50 (GE 2)',NULL,3),
(9227,9223,'Sword in Two Hands 51 (GE 3)',NULL,4),
(9228,9223,'Sword in Two Hands 52 (GE 4)',NULL,5),
(9229,9223,'Sword in Two Hands 53 (GE 5)',NULL,6),
(9230,9223,'Sword in Two Hands 54',NULL,7),
(9231,9223,'Sword in Two Hands 55 (GE 6)',NULL,8),
(9232,9223,'Sword in Two Hands 56 (GE 7)',NULL,9),
(9233,9223,'Sword in Two Hands 57 (GE 8)',NULL,10),
(9234,9223,'Sword in Two Hands 58',NULL,11),
(9235,9223,'Sword in Two Hands 59',NULL,12),
(9236,9223,'Sword in Two Hands 60',NULL,13),
(9237,9223,'Sword in Two Hands 61 (GE 9)',NULL,14),
(9238,9223,'Sword in Two Hands 62',NULL,15),
(9239,9223,'Sword in Two Hands 63 (GE 10)',NULL,16),
(9240,9223,'Sword in Two Hands 64 (GE 11)',NULL,17),
(9241,9223,'Sword in Two Hands 65 (GE 12)',NULL,18),
(9242,9223,'Sword in Two Hands 66',NULL,19),
(9243,9223,'Sword in Two Hands 67 (GE 13)',NULL,20),
(9244,9223,'Sword in Two Hands 68 (GE 14)',NULL,21),
(9245,9223,'Sword in Two Hands 69 (GE 15)',NULL,22),
(9246,9223,'Sword in Two Hands 70 (GE 15)',NULL,23),
(9247,9223,'Sword in Two Hands 71 (GE 16)',NULL,24),
(9248,9223,'Sword in Two Hands 72 (GE 17)',NULL,25),
(9249,9223,'Sword in Two Hands 73',NULL,26),
(9250,9223,'Sword in Two Hands 74 (GE 18)',NULL,27),
(9251,9223,'Sword in Two Hands 75 (GE 19)',NULL,28),
(9252,9223,'Sword in Two Hands 76 (GE 20)',NULL,29),
(9253,9223,'Sword in Two Hands 77 (GE 21)',NULL,30),
(9254,9223,'Sword in Two Hands 78 (GE 22)',NULL,31),
(9255,9223,'Sword in Two Hands 79 (GE 23)',NULL,32),
(9256,NULL,'Sword vs Spear',NULL,7),
(9257,9256,'Sword vs Spear 1',NULL,1),
(9258,9256,'Sword vs Spear 2',NULL,2),
(9259,9256,'Sword vs Spear 3',NULL,3),
(9260,NULL,'Sword in Armor',NULL,8),
(9261,9260,'Sword in Armor 1',NULL,1),
(9262,9260,'Sword in Armor 2',NULL,2),
(9263,9260,'Sword in Armor 3',NULL,3),
(9264,9260,'Sword in Armor 4',NULL,4),
(9265,9260,'Sword in Armor 5',NULL,5),
(9266,9260,'Sword in Armor 6',NULL,6),
(9267,9260,'Sword in Armor 7',NULL,7),
(9268,9260,'Sword in Armor 8',NULL,8),
(9269,9260,'Sword in Armor 9',NULL,9),
(9270,9260,'Sword in Armor 10',NULL,10),
(9271,9260,'Sword in Armor 11',NULL,11),
(9272,9260,'Sword in Armor 12',NULL,12),
(9273,9260,'Sword in Armor 13',NULL,13),
(9274,9260,'Sword in Armor 14',NULL,14),
(9275,9260,'Sword in Armor 15',NULL,15),
(9276,9260,'Sword in Armor 16',NULL,16),
(9277,9260,'Sword in Armor 17',NULL,17),
(9278,9260,'Sword in Armor 18',NULL,18),
(9279,9260,'Sword in Armor 19',NULL,19),
(9280,9260,'Sword in Armor 20',NULL,20),
(9281,9260,'Sword in Armor 21',NULL,21),
(9282,9260,'Sword in Armor 22',NULL,22),
(9283,9260,'Sword in Armor 23',NULL,23),
(9284,9260,'Sword in Armor 24',NULL,24),
(9285,9260,'Sword in Armor 25',NULL,25),
(9286,9260,'Sword in Armor 26',NULL,26),
(9287,9260,'Sword in Armor 27',NULL,27),
(9288,9260,'Sword in Armor 28',NULL,28),
(9289,9260,'Sword in Armor 29',NULL,29),
(9290,9260,'Sword in Armor 30',NULL,30),
(9291,NULL,'Axe in Armor',NULL,9),
(9292,9291,'Axe in Armor 1',NULL,1),
(9293,9291,'Axe in Armor 2',NULL,2),
(9294,9291,'Axe in Armor 3',NULL,3),
(9295,9291,'Axe in Armor 4',NULL,4),
(9296,9291,'Axe in Armor 5',NULL,5),
(9297,9291,'Axe in Armor 6',NULL,6),
(9298,9291,'Axe in Armor 7',NULL,7),
(9299,9291,'Axe in Armor 8',NULL,8),
(9300,9291,'Axe in Armor 9',NULL,9),
(9301,9291,'Axe in Armor 10',NULL,10),
(9302,9291,'Axe in Armor 11',NULL,11),
(9303,9291,'Axe in Armor 12',NULL,12),
(9304,9291,'Axe in Armor 13',NULL,13),
(9305,9291,'Axe in Armor 14',NULL,14),
(9306,9291,'Axe in Armor 15',NULL,15),
(9307,9291,'Axe in Armor 16',NULL,16),
(9308,9291,'Axe in Armor 17',NULL,17),
(9309,NULL,'Spear',NULL,10),
(9310,9309,'Spear 1',NULL,1),
(9311,9309,'Spear 2',NULL,2),
(9312,9309,'Spear 3',NULL,3),
(9313,9309,'Spear 4',NULL,4),
(9314,9309,'Spear 5',NULL,5),
(9315,9309,'Spear 6',NULL,6),
(9316,9309,'Spear 7',NULL,7),
(9317,9309,'Spear 8',NULL,8),
(9318,9309,'Spear 9',NULL,9),
(9319,9309,'Spear 10',NULL,10),
(9320,9309,'Spear vs Other Weapons',NULL,11),
(9321,9320,'Spear 11',NULL,1),
(9322,9320,'Spear 12',NULL,2),
(9323,9320,'Spear 13',NULL,3),
(9324,9320,'Spear 14',NULL,4),
(9325,9320,'Spear 15',NULL,5),
(9326,9320,'Spear 16',NULL,6),
(9327,9320,'Spear 17',NULL,7),
(9328,9320,'Spear 18',NULL,8),
(9329,9320,'Spear 19',NULL,9),
(9330,NULL,'Mounted Fencing',NULL,11),
(9331,9330,'Horseback 1',NULL,1),
(9332,9330,'Horseback 2',NULL,2),
(9333,9330,'Horseback 3',NULL,3),
(9334,9330,'Horseback 4',NULL,4),
(9335,9330,'Horseback 5',NULL,5),
(9336,9330,'Horseback 6',NULL,6),
(9337,9330,'Horseback 7',NULL,7),
(9338,9330,'Horseback 8',NULL,8),
(9339,9330,'Horseback 9',NULL,9),
(9340,9330,'Horseback 10',NULL,10),
(9341,9330,'Horseback 11',NULL,11),
(9342,9330,'Horseback 12',NULL,12),
(9343,9330,'Horseback 13',NULL,13),
(9344,9330,'Horseback 14',NULL,14),
(9345,9330,'Horseback 15',NULL,15),
(9346,9330,'Horseback 16',NULL,16),
(9347,9330,'Horseback 17',NULL,17),
(9348,9330,'Horseback 18',NULL,18),
(9349,9330,'Horseback 19',NULL,19),
(9350,9330,'Horseback 20',NULL,20),
(9351,9330,'Horseback 21',NULL,21),
(9352,9330,'Horseback 22',NULL,22),
(9353,9330,'Horseback 23',NULL,23),
(9354,9330,'Horseback 24',NULL,24),
(9355,9330,'Horseback 25',NULL,25),
(9356,9330,'Horseback 26',NULL,26),
(9357,9330,'Horseback 27',NULL,27),
(9358,9330,'Horseback 28',NULL,28),
(9359,9330,'Horseback 29',NULL,29),
(9360,9330,'Horseback 30',NULL,30),
(9361,9330,'Horseback 31',NULL,31);



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


--INSERT INTO @Video
--(
--    SectionKey,
--    VideoServiceKey,
--    VideoServiceVideoId,
--	StartTime
--)
--VALUES
--;


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

EXEC Sources.AddWeaponsForSection 9001, 9;
EXEC Sources.AddWeaponsForSection 9022, 33;
EXEC Sources.AddWeaponsForSection 9027, 8;
EXEC Sources.AddWeaponsForSection 9044, 9, 8;
EXEC Sources.AddWeaponsForSection 9069, 9, 8;
EXEC Sources.AddWeaponsForSection 9074, 9, 8;
EXEC Sources.AddWeaponsForSection 9086, 9, 8;
EXEC Sources.AddWeaponsForSection 9097, 9, 8;
EXEC Sources.AddWeaponsForSection 9134, 9, 8;
EXEC Sources.AddWeaponsForSection 9147, 8, 4;
EXEC Sources.AddWeaponsForSection 9158, 3;
EXEC Sources.AddWeaponsForSection 9174, 4;
EXEC Sources.AddWeaponsForSection 9256, 4, 26;
EXEC Sources.AddWeaponsForSection 9260, 34;
EXEC Sources.AddWeaponsForSection 9291, 35;
EXEC Sources.AddWeaponsForSection 9309, 26;
EXEC Sources.AddWeaponsForSection 9321, 26, 36;
EXEC Sources.AddWeaponsForSection 9322, 26, 36;
EXEC Sources.AddWeaponsForSection 9323, 26, 36;
EXEC Sources.AddWeaponsForSection 9324, 26, 33;
EXEC Sources.AddWeaponsForSection 9325, 26, 37;
EXEC Sources.AddWeaponsForSection 9326, 26, 38;
EXEC Sources.AddWeaponsForSection 9327, 26, 38;
EXEC Sources.AddWeaponsForSection 9328, 26, 38;
EXEC Sources.AddWeaponsForSection 9329, 26, 38;

EXEC Sources.AddWeaponsForSection 9331, 38;
EXEC Sources.AddWeaponsForSection 9332, 38;
EXEC Sources.AddWeaponsForSection 9333, 38;
EXEC Sources.AddWeaponsForSection 9334, 38;
EXEC Sources.AddWeaponsForSection 9335, 38;
EXEC Sources.AddWeaponsForSection 9336, 38;


EXEC Sources.AddWeaponsForSection 9336, 38, 39;
EXEC Sources.AddWeaponsForSection 9337, 38, 39;
EXEC Sources.AddWeaponsForSection 9338, 38, 39;
EXEC Sources.AddWeaponsForSection 9339, 38, 39;
EXEC Sources.AddWeaponsForSection 9340, 38, 39;

EXEC Sources.AddWeaponsForSection 9341, 39;
EXEC Sources.AddWeaponsForSection 9342, 39;
EXEC Sources.AddWeaponsForSection 9343, 39;
EXEC Sources.AddWeaponsForSection 9344, 39;
EXEC Sources.AddWeaponsForSection 9345, 39;
EXEC Sources.AddWeaponsForSection 9346, 39;
EXEC Sources.AddWeaponsForSection 9347, 39;
EXEC Sources.AddWeaponsForSection 9348, 39;
EXEC Sources.AddWeaponsForSection 9349, 39;
EXEC Sources.AddWeaponsForSection 9350, 39;
EXEC Sources.AddWeaponsForSection 9351, 39;
EXEC Sources.AddWeaponsForSection 9352, 39;

EXEC Sources.AddWeaponsForSection 9353, 40;
EXEC Sources.AddWeaponsForSection 9354, 40;
EXEC Sources.AddWeaponsForSection 9355, 40;
EXEC Sources.AddWeaponsForSection 9356, 40;
EXEC Sources.AddWeaponsForSection 9357, 40;
EXEC Sources.AddWeaponsForSection 9358, 40;
EXEC Sources.AddWeaponsForSection 9359, 40;

EXEC Sources.AddWeaponsForSection 9360, 38;
EXEC Sources.AddWeaponsForSection 9361, 39;


