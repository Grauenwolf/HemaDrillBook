/***** Book *****/

DECLARE @BookKey INT = 6;
DECLARE @FirstAuthorKey INT = 6;

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
(@BookKey, N'Dell''Arte di Scrima Libri Tre', 'Three Books on the Art of Defense', 'dall''Agocchie');

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
(@BookKey, N'Three Books on the Art of Defense');


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
(@FirstAuthorKey, N'Giovanni dall''Agocchie di Bologna', 'dall''Agocchie');



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
(6001,NULL,'The First Book of Dialogs',NULL,1),
(6002,6001,'Why the art of fencing is so little valued',NULL,1),
(6003,6001,'Why fencing is the foundation of the military art',NULL,2),
(6004,6001,'Theory and practice, foundations of the arts',NULL,3),
(6005,6001,'Art of fencing has six headings',NULL,4),
(6006,6001,'Blows are of multiple sorts',NULL,5),
(6007,6001,'There are eight guards which are the most important',NULL,6),
(6008,6007,'Coda lunga',NULL,1),
(6009,6007,'Porta di ferro',NULL,2),
(6010,6007,'Porta di ferro stretta, and larga',NULL,3),
(6011,6007,'Coda lunga of three types',NULL,4),
(6012,6007,'Guard and its types',NULL,5),
(6013,6001,'Stepping in the Guards',NULL,13),
(6014,NULL,'The Second Day of the First Book',NULL,2),
(6015,6014,'Unaccompanied sword:  why it is preferred to the other arms',NULL,1),
(6016,6014,'Parrying with the sword: in how many ways it can be done',NULL,2),
(6017,6014,'Wounding with the thrust is better than with the cut',NULL,3),
(6018,6014,'On the motion of the feet and the body',NULL,4),
(6019,6014,'Ways of defending yourself from the enemy, and of harming him',NULL,5),
(6020,6019,'Coda Lunga Stretta',NULL,1),
(6021,6020,'Dritto Fendente to Head',NULL,1),
(6022,6020,'Mandritto to Head',NULL,2),
(6023,6020,'Mandritto to Leg',NULL,3),
(6024,6020,'Mandritto Ridoppio',NULL,4),
(6025,6020,'Riverso Fendente to Head',NULL,5),
(6026,6020,'Riverso to Head',NULL,6),
(6027,6020,'Riverso to Leg',NULL,7),
(6028,6020,'Riverso Ridoppio',NULL,8),
(6029,6020,'Imbroccata',NULL,9),
(6030,6020,'Stoccata',NULL,10),
(6031,6019,'Coda Lunga Alta',NULL,2),
(6032,6031,'Mandritto to Head',NULL,1),
(6033,6031,'Mandritto to Leg',NULL,2),
(6034,6031,'Riverso to Head',NULL,3),
(6035,6031,'Riverso to Leg',NULL,4),
(6036,6031,'Imbroccata',NULL,5),
(6037,6031,'Stoccata',NULL,6),
(6038,6019,'Porta di Ferro Stretta',NULL,3),
(6039,6038,'Dritto Fendente to Head',NULL,1),
(6040,6038,'Mandritto to Body',NULL,2),
(6041,6038,'Mandritto to Leg',NULL,3),
(6042,6038,'Riverso to Head',NULL,4),
(6043,6038,'Riverso to Body',NULL,5),
(6044,6038,'Riverso to Leg',NULL,6),
(6045,6038,'Riverso Ridoppio',NULL,7),
(6046,6038,'Imbroccata',NULL,8),
(6047,6038,'Stoccata',NULL,9),
(6048,6019,'Cinghiale Porta di Ferro',NULL,4),
(6049,6048,'Mandritto to Head',NULL,1),
(6050,6048,'Riverso to Head',NULL,2),
(6051,6048,'Riverso to Leg',NULL,3),
(6052,6048,'Imbroccata',NULL,4),
(6053,6048,'Stoccata',NULL,5),
(6054,6019,'Which is the surer defense',NULL,5),
(6055,6019,'Guardia d’Alicorno',NULL,6),
(6056,6055,'Fendente to Head',NULL,1),
(6057,6055,'Mandritto',NULL,2),
(6058,6055,'Mandritto or Riverso to Leg',NULL,3),
(6059,6055,'Riverso to Head',NULL,4),
(6060,6055,'Imbroccata',NULL,5),
(6061,6055,'Stoccata',NULL,6),
(6062,6014,'All Guards Together',NULL,7),
(6063,NULL,'The Third Day of the First Book',NULL,3),
(6064,6063,'Of provoking and harming',NULL,1),
(6065,6064,'Why provocations are performed',NULL,1),
(6066,6064,'Coda Lunga Stretta',NULL,2),
(6067,6066,'Provocation 1',NULL,1),
(6068,6066,'Provocation 2',NULL,2),
(6069,6066,'Provocation 3',NULL,3),
(6070,6066,'Provocation 4',NULL,4),
(6071,6066,'Provocation 5',NULL,5),
(6072,6066,'Provocation 6',NULL,6),
(6073,6066,'Provocation 7',NULL,7),
(6074,6064,'Coda Lunga Alta',NULL,3),
(6075,6074,'Provocation 1',NULL,1),
(6076,6074,'Provocation 2',NULL,2),
(6077,6074,'Provocation 3',NULL,3),
(6078,6074,'Provocation 4',NULL,4),
(6079,6064,'Porta di Ferro Stretta',NULL,4),
(6080,6079,'Provocation 1',NULL,1),
(6081,6079,'Provocation 2',NULL,2),
(6082,6079,'Provocation 3',NULL,3),
(6083,6079,'Provocation 4',NULL,4),
(6084,6079,'Provocation 5',NULL,5),
(6085,6079,'Provocation 6',NULL,6),
(6086,6079,'Provocation 7',NULL,7),
(6087,6064,'Cinghiale Porta di Ferro',NULL,5),
(6088,6087,'Provocation 1',NULL,1),
(6089,6087,'Provocation 2',NULL,2),
(6090,6064,'Provocations in cinghiale porta di ferro',NULL,6),
(6091,6064,'Mezzi mandritti, why they are done, and why they are named so',NULL,7),
(6092,6064,'Guardia d’Alicorno',NULL,8),
(6093,6092,'Provocation 1',NULL,1),
(6094,6092,'Provocation 2',NULL,2),
(6095,6063,'The tempo for attacking is recognized in five ways',NULL,2),
(6096,6063,'Straits of the half sword',NULL,3),
(6097,6096,'False Edge Stretta 1',NULL,1),
(6098,6096,'False Edge Stretta 2',NULL,2),
(6099,6096,'False Edge Stretta 3',NULL,3),
(6100,6096,'False Edge Stretta 4',NULL,4),
(6101,6096,'False Edge Stretta 5',NULL,5),
(6102,6096,'False Edge Stretta 6',NULL,6),
(6103,6096,'True Edge Stretta 1',NULL,7),
(6104,6096,'True Edge Stretta 2',NULL,8),
(6105,6096,'True Edge Stretta 3',NULL,9),
(6106,6096,'True Edge Stretta 4',NULL,10),
(6107,6096,'True Edge Stretta 5',NULL,11),
(6108,6096,'True Edge Stretta 6',NULL,12),
(6109,6063,'On parrying with the true edge of the sword and striking with a thrust',NULL,4),
(6110,NULL,'The Fourth Day of the First Book Dealing with the Dagger',NULL,4),
(6111,6110,'Way of putting oneself in guard with the sword and dagger',NULL,1),
(6112,6110,'Defense and offense of the sword and dagger together',NULL,2),
(6113,6112,'Sword in coda lunga stretta, and your dagger in cinghiale porta di ferro',NULL,1),
(6114,6113,'Mandritto to Head',NULL,1),
(6115,6113,'Mandritto to Leg',NULL,2),
(6116,6113,'Riverso to Head',NULL,3),
(6117,6113,'Riverso to Leg',NULL,4),
(6118,6113,'Overhand Thrust',NULL,5),
(6119,6113,'Stoccata',NULL,6),
(6120,6112,'Sword in coda lunga alta and your dagger in porta di ferro alta',NULL,2),
(6121,6120,'Mandritto to Head',NULL,1),
(6122,6120,'Mandritto to Leg',NULL,2),
(6123,6120,'Riverso to Head',NULL,3),
(6124,6120,'Riverso to Leg',NULL,4),
(6125,6120,'Imbroccata to the Chest',NULL,5),
(6126,6120,'Underhand Thrust',NULL,6),
(6127,6112,'Sword in porta di ferro stretta and dagger in coda lunga alta',NULL,3),
(6128,6127,'Mandritto to Head',NULL,1),
(6129,6127,'Mandritto to Leg',NULL,2),
(6130,6127,'Riverso to Head',NULL,3),
(6131,6127,'Riverso to Leg',NULL,4),
(6132,6127,'Imbroccata to the Chest',NULL,5),
(6133,6127,'Stoccata to the Face',NULL,6),
(6134,6112,'Sword in cinghiale porta di ferro and your dagger in guardia di testa',NULL,4),
(6135,6134,'Mandritto to Head',NULL,1),
(6136,6134,'Mandritto to Leg',NULL,2),
(6137,6134,'Riverso to Head',NULL,3),
(6138,6134,'Riverso to Leg',NULL,4),
(6139,6134,'Imbroccata to the Chest',NULL,5),
(6140,6134,'Stoccata to the Face',NULL,6),
(6141,6112,'Guardia d’alicorno with the right foot forward, your dagger is in cinghiale porta di ferro',NULL,5),
(6142,6141,'Mandritto to Head',NULL,1),
(6143,6141,'Mandritto to Leg',NULL,2),
(6144,6141,'Riverso to Head',NULL,3),
(6145,6141,'Riverso to Leg',NULL,4),
(6146,6141,'Overhand Thrust',NULL,5),
(6147,6141,'Stoccata to the Face',NULL,6),
(6148,6112,'Guardia d’alicorno with the left foot forward, your dagger is in porta di ferro alta',NULL,6),
(6149,6148,'Mandritto to Head',NULL,1),
(6150,6148,'Mandritto to Leg',NULL,2),
(6151,6148,'Imbroccata to the Face',NULL,3),
(6152,6148,'Stoccata to the Face',NULL,4),
(6153,6112,'Sword in coda lunga stretta and your dagger in cinghiale porta di ferro <alta>',NULL,7),
(6154,6153,'Punta riversa to the Face',NULL,1),
(6155,6153,'Stoccata to the Flank',NULL,2),
(6156,6153,'Feints a Riverso to the Head',NULL,3),
(6157,6153,'Mandritto to Head (or leg)',NULL,4),
(6158,6153,'False Thrust to the Face',NULL,5),
(6159,6153,'Mandritto',NULL,6),
(6160,6153,'Mandritto, or a riverso, or a thrust',NULL,7),
(6161,6110,'The way to provoke and wound an enemy who doesn’t want to throw any blows',NULL,3),
(6162,6161,'Provocation 1: Swords in coda lunga stretta and daggers in cinghiale porta di ferro',NULL,1),
(6163,6162,'Falso and mandritto on his sword',NULL,1),
(6164,6162,'Tramazzone to his right hand',NULL,2),
(6165,6162,'Falso to his hands from beneath',NULL,3),
(6166,6162,'False thrust to his face',NULL,4),
(6167,6162,'Punta riversa to his face ',NULL,5),
(6168,6162,'Stoccata to his ches',NULL,6),
(6169,6162,'Press him by pulling your left foot near your right ',NULL,7),
(6170,6161,'Provocation 2: Swords in coda lunga alta and daggers in porta di ferro',NULL,2),
(6171,6170,'Falso dritto or two directed toward his dagger hand',NULL,1),
(6172,6170,'Mezzo mandritto to his dagger hand',NULL,2),
(6173,6170,'False thrust to his face',NULL,3),
(6174,6170,'False thrust, and false mandritto',NULL,4),
(6175,6161,'Provocation 3: Swords in porta di ferro stretta and daggers in coda lunga alta',NULL,3),
(6176,6175,'Hit the false edge of your sword against that of the enemy',NULL,1),
(6177,6175,'Punta riversa to his face, left foot',NULL,2),
(6178,6175,'Punta riversa to his face, rigt foot',NULL,3),
(6179,6175,'Two punte riverse',NULL,4),
(6180,6161,'Provocation 4: Swords in cinghiale porta di ferro and daggers in guardia di testa',NULL,4),
(6181,6180,'Thrust to his face w/riverso',NULL,1),
(6182,6180,'Thrust to his face w/mandritti to his head',NULL,2),
(6183,6180,'dritto tramazzone to his sword arm',NULL,3),
(6184,6180,'punta riversa to his face',NULL,4),
(6185,6161,'Provocation 5: Swords in guardia d’alicorno and daggers in cinghiale porta di ferro',NULL,5),
(6186,6185,'Imbroccata to the dagger hand',NULL,1),
(6187,6185,'Overhand thrust',NULL,2),
(6188,6161,'Provocation 5: Swords in alicorno with the left foot forward and daggers in porta di ferro alta',NULL,6),
(6189,6188,'Draw your right foot near your left one',NULL,1);


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
(6013,1,'in_FdDyelYU',NULL),
(6013,1,'6LTKIS_xCSc',NULL),
(6013,1,'E4vnypZbEyw',NULL),
(6013,1,'LsSP5KAJUe8',NULL),
(6013,1,'gdC-0kLcNaQ',NULL),
(6013,1,'5Sxv8oVYlZY',NULL),
(6013,1,'qc_ehdY8H7M',NULL),
(6013,1,'h27rmK9f2qQ',NULL),
(6013,1,'VdXau76N97s',NULL),
(6021,1,'koPJGPA-9KA',NULL),
(6022,1,'koPJGPA-9KA',NULL),
(6023,1,'koPJGPA-9KA',NULL),
(6024,1,'koPJGPA-9KA',NULL),
(6025,1,'koPJGPA-9KA',NULL),
(6026,1,'koPJGPA-9KA',NULL),
(6027,1,'koPJGPA-9KA',NULL),
(6028,1,'koPJGPA-9KA',NULL),
(6029,1,'koPJGPA-9KA',NULL),
(6030,1,'koPJGPA-9KA',NULL),
(6030,1,'-yqHKUU-haU',NULL),
(6039,1,'w3plcAKU7c4',NULL),
(6040,1,'AD0ncK5O460',NULL),
(6041,1,'DDjKqBVUJTs',NULL),
(6044,1,'ikGzb_LmyqI',NULL),
(6051,1,'6WwpjftlFZc',NULL),
(6056,1,'zCo1bjKjTgQ',NULL),
(6057,1,'zCo1bjKjTgQ',NULL),
(6058,1,'zCo1bjKjTgQ',NULL),
(6059,1,'zCo1bjKjTgQ',NULL),
(6060,1,'zCo1bjKjTgQ',NULL),
(6061,1,'zCo1bjKjTgQ',NULL),
(6062,1,'6dU6pc4PhHI',NULL),
(6062,1,'xjsfBPEZONo',NULL),
(6062,1,'qwfTFy_qvxQ',NULL),
(6062,1,'gdC-0kLcNaQ',NULL),
(6062,1,'jtBLsw56-3Y',NULL);

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

EXEC Sources.AddWeaponsForSection 6001, 2;
EXEC Sources.AddWeaponsForSection 6014, 2;
EXEC Sources.AddWeaponsForSection 6063, 2;
EXEC Sources.AddWeaponsForSection 6110, 12;
