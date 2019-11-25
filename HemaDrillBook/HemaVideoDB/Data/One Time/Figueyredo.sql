/***** Book *****/

DECLARE @BookKey INT = 3;
DECLARE @FirstAuthorKey INT = 3;

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
(@BookKey, N'Memorial Da Prattica do Montante', N'Memorial of the Practice of the Montante', 'Figueyredo-Montante');

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
(@BookKey, N'Memorial of the Practice of the Montante');


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
(@FirstAuthorKey, N'Diogo Gomes de Figueyredo', 'Figueyredo');



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
(3001,NULL,'Rules',NULL,1),
(3002,3001,'Simple Rule 1',NULL,1),
(3003,3001,'Composed Rule 1',NULL,2),
(3004,3001,'Simple Rule 2',NULL,3),
(3005,3001,'Composed Rule 2',NULL,4),
(3006,3001,'Simple Rule 3',NULL,5),
(3007,3001,'Composed Rule 3',NULL,6),
(3008,3001,'Simple Rule 4',NULL,7),
(3009,3001,'Composed Rule 4',NULL,8),
(3010,3001,'Simple Rule 5',NULL,9),
(3011,3001,'Composed Rule 5',NULL,10),
(3012,3001,'Simple Rule 6',NULL,11),
(3013,3001,'Composed Rule 6',NULL,12),
(3014,3001,'Simple Rule 7',NULL,13),
(3015,3001,'Composed Rule 7',NULL,14),
(3016,3001,'Simple Rule 8',NULL,15),
(3017,3001,'Composed Rule 8',NULL,16),
(3018,3001,'Simple Rule 9',NULL,17),
(3019,3001,'Composed Rule 9',NULL,18),
(3020,3001,'Simple Rule 10',NULL,19),
(3021,3001,'Composed Rule 10',NULL,20),
(3022,3001,'Simple Rule 11',NULL,21),
(3023,3001,'Composed Rule 11',NULL,22),
(3024,3001,'Simple Rule 12',NULL,23),
(3025,3001,'Composed Rule 12',NULL,24),
(3026,3001,'Simple Rule 13',NULL,25),
(3027,3001,'Composed Rule 13',NULL,26),
(3028,3001,'Simple Rule 14',NULL,27),
(3029,3001,'Composed Rule 14',NULL,28),
(3030,3001,'Simple Rule 15',NULL,29),
(3031,3001,'Composed Rule 15',NULL,30),
(3032,3001,'Simple Rule 16',NULL,31),
(3033,3001,'Composed Rule 16',NULL,32);


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
    VideoServiceVideoId
)
VALUES
(3002,1,'gYtFG9cOFP4'),
(3002,1,'2q6PsHrGEDc'),
(3002,1,'4lDIDRHzXbo'),
(3002,1,'nYNy_drriXs'),
(3002,1,'qZokVz7AvBw'),
(3002,1,'QAVHT1TL24s'),
(3002,1,'WERRCNYBQt8'),
(3002,1,'Mr3H2Zynesc'),
(3002,1,'mWZbu4om1oE'),
(3003,1,'oZFEUM5fdgU'),
(3003,1,'gYtFG9cOFP4'),
(3003,1,'2q6PsHrGEDc'),
(3003,1,'PEyqU0m-wNM'),
(3003,1,'Mr3H2Zynesc'),
(3003,1,'eL_yyowVokE'),
(3003,1,'jbJww6Lgh7A'),
(3003,1,'IR6rtxfR7NU'),
(3004,1,'-C7K36ejCe4'),
(3004,1,'mz_aDZGdCok'),
(3004,1,'nYNy_drriXs'),
(3004,1,'uZGl2Q6wJno'),
(3004,1,'8RQqAQ5BKek'),
(3004,1,'6fZH2GgHZDs'),
(3005,1,'-C7K36ejCe4'),
(3005,1,'oZFEUM5fdgU'),
(3005,1,'50n4uXOAdIc'),
(3005,1,'6fZH2GgHZDs'),
(3005,1,'mWOYOSoURW8'),
(3005,1,'pD0SpnTBKgo'),
(3006,1,'FTORIBx9t6g'),
(3006,1,'nYNy_drriXs'),
(3006,1,'qWYc6KXP0mM'),
(3006,1,'QNVojNVs2XE'),
(3007,1,'FTORIBx9t6g'),
(3007,1,'oZFEUM5fdgU'),
(3007,1,'QNVojNVs2XE'),
(3008,1,'z4kxdTZmfNE'),
(3008,1,'nYNy_drriXs'),
(3008,1,'REfx0Cgt_3Y'),
(3008,1,'AqwloeFI9Ug'),
(3009,1,'z4kxdTZmfNE'),
(3009,1,'oZFEUM5fdgU'),
(3009,1,'H36YEPYW97Y'),
(3009,1,'PcU2VSrM0IA'),
(3009,1,'NSnLedHLBXs'),
(3010,1,'tHViukOgQOI'),
(3010,1,'nYNy_drriXs'),
(3010,1,'1qeQsyJfbpE'),
(3010,1,'khrZBraMv34'),
(3011,1,'tHViukOgQOI'),
(3011,1,'oZFEUM5fdgU'),
(3012,1,'-YPjlQKrCFQ'),
(3012,1,'nYNy_drriXs'),
(3013,1,'-YPjlQKrCFQ'),
(3013,1,'oZFEUM5fdgU'),
(3014,1,'B5UxEp180MU'),
(3014,1,'nYNy_drriXs'),
(3015,1,'B5UxEp180MU'),
(3015,1,'oZFEUM5fdgU'),
(3016,1,'9QE-Ejcn1F4'),
(3016,1,'nYNy_drriXs'),
(3017,1,'9QE-Ejcn1F4'),
(3017,1,'oZFEUM5fdgU'),
(3018,1,'VyhJ7ERxF-w'),
(3018,1,'hLegKPJDpuY'),
(3018,1,'nYNy_drriXs'),
(3019,1,'hLegKPJDpuY'),
(3019,1,'oZFEUM5fdgU'),
(3020,1,'nR8TY_auc1k'),
(3020,1,'nYNy_drriXs'),
(3020,1,'MVs5xcpYn9c'),
(3021,1,'nR8TY_auc1k'),
(3021,1,'oZFEUM5fdgU'),
(3022,1,'HI5inbzgVtI'),
(3022,1,'nYNy_drriXs'),
(3023,1,'HI5inbzgVtI'),
(3023,1,'oZFEUM5fdgU'),
(3024,1,'2Ro6x03BuIg'),
(3024,1,'nYNy_drriXs'),
(3025,1,'2Ro6x03BuIg'),
(3025,1,'oZFEUM5fdgU'),
(3026,1,'anDUl2xT8Ik'),
(3026,1,'nYNy_drriXs'),
(3026,1,'yEJkLfe_ePg'),
(3027,1,'anDUl2xT8Ik'),
(3027,1,'oZFEUM5fdgU'),
(3028,1,'a8bPTlf0TW0'),
(3028,1,'nYNy_drriXs'),
(3029,1,'a8bPTlf0TW0'),
(3029,1,'oZFEUM5fdgU'),
(3030,1,'iTyJOAAY-p4'),
(3030,1,'nYNy_drriXs'),
(3031,1,'iTyJOAAY-p4'),
(3031,1,'oZFEUM5fdgU'),
(3032,1,'BMq2oqiPSx0'),
(3032,1,'nYNy_drriXs'),
(3033,1,'BMq2oqiPSx0'),
(3033,1,'oZFEUM5fdgU');

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

EXEC Sources.AddWeaponsForSection 3001, 20;

