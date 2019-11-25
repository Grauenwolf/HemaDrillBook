/***** Drop old test data ****/

DELETE FROM Interpretations.Video WHERE SectionKey IN (SELECT SectionKey FROM Sources.Section s WHERE s.BookKey = -1)
DELETE FROM Sources.Section WHERE BookKey = -1
DELETE FROM Sources.BookAuthor WHERE BookKey = -1
DELETE FROM Sources.AlternateBookName WHERE BookKey = -1
DELETE FROM Sources.Book WHERE BookKey = -1





/***** Book *****/
DECLARE @BookKey INT = -1;
DECLARE @FirstAuthorKey INT = -1;

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
(@BookKey, N'Test', N'You can use this for testing.', 'Test');

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
(@FirstAuthorKey, N'Test Author', 'Test');



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
(9991900, NULL, 'Extras', NULL, -1),
(9991901, 1900, 'History', NULL, 1),
(9991902, 1900, 'Weapons and Equipment', NULL, 2),
(9991903, 1900, 'General Discussion', NULL, 3);


INSERT INTO @Section
(
    SectionKey,
    ParentSectionKey,
    SectionName,
    PageReference,
    DisplayOrder
)
VALUES
(9991001, NULL, 'The 7 Wards - 1r-1v', NULL, 1),
(9991002, NULL, '1st Ward - Underarm', NULL, 2),
(9991003, 9991002, '1st Ward - Halfshield - Fall Under, Overbind and Schiltslac', '2r-2v', 1),
(9991004, 9991002, '1st Ward - Halfshield - Fall Under - Overbind - Mutate and Nucken', '3r-4r', 2),
(9991005, 9991002, '1st Ward - Krucke - Overbind - Grapple the Arms - Schiltslac Counter', '4r-5r', 3),
(9991006, 9991002, 'Krucke - 1st Ward - Enter with Thrust', '5r-5v', 4),
(9991007, 9991002, 'Krucke - Krucke Bind - Thrust and Mind the Head ', '5v-6v', 5),
(9991008, 9991002, '1st Ward - Langort Obsessio - Overbind and Schiltslac', '6v-7r', 6),
(9991009, 9991002, '1st Ward - Langort Obsessio - Underbind, Mutate, and Nucken', '7v-8r', 7),
(9991010, NULL, '2nd Ward - Right Shoulder', NULL, 3),
(9991011, 9991010, '2nd Ward - Schutzen', '2nd Ward', 1),
(9991012, 9991010, 'Schutzen', '2nd Ward', 2),
(9991013, 9991010, '2nd Ward - Halfshield - Cut to Separate Sword and Shield - Stichslac Counter', '10v-11r', 3),
(9991014, 9991010, 'Halfshield - 1st Ward - Enter with Strike', '11v', 4),
(9991015, NULL, '3rd Ward - Left Shoulder', NULL, 4),
(9991016, 9991015, '3rd Ward - Schutzen', '3rd Ward', 1),
(9991017, 9991015, 'Schutzen', '3rd Ward', 2),
(9991018, 9991015, '3rd Ward - Halfshield - Fall Under Sword and Shield - Overbind and Schiltslac', '13r-14r', 3),
(9991019, 9991015, '3rd Ward - Langort Obsessio - Overbind etc', '14r-14v', 4),
(9991020, NULL, '4th Ward - Overhead', NULL, 5),
(9991021, 9991020, '4th Ward - Halfshield - Fall Under Sword and Shield - Overbind and Schiltslac', '14v', 1),
(9991022, 9991020, '4th Ward - 1st Ward Obsessio - Halfshield - Fall under Sword and Shield - Overbind and Schiltslac','15r-16r', 2),
(9991023, 9991020, '1st Ward - Langort Obsessio - Grab Sword - Schiltslac to Hand - Defend the Head', '16r-16v', 3),
(9991024, NULL, '6th Ward - Breast', NULL, 6),
(9991025, 9991024, '6th Ward - Halfshield - Thrust to the Left - Overbind etc', '17r', 1),
(9991026, NULL, '7th Ward - Langort (Longpoint)', NULL, 7),
(9991027, 9991026, '7th Ward - Overbind Right - Schutzen - Schiltslac Counter', '17v-18r', 1),
(9991028, 9991026, '7th Ward - Overbind Right - Arm Grapple - Kick Counter - pull back to 6th Ward', '18v-19r', 2),
(9991029, 9991026, '7th Ward - Underbind Left - Strike to Head - Counter', '19r-19v', 3),
(9991030, 9991026, '7th Ward - Overbind Left - Thrust to the left', '20r', 4),
(9991031, 9991026, '7th Ward - Overbind Right - Flee to the Side - Follows with Cut to Head', '20v', 5),
(9991032, 9991026, 'Upper langort - Bind to the Left - Overbind Right - Thrust Underneath - Cover - Thrust to the Right',  '21r-21v', 6),
(9991033, 9991026, 'Vidilpoge - Bind on the Arm - Turn the Hand and take their Sword', '22r', 7),
(9991034, 9991026, 'Vidilpoge - Bind on the Arm - Overbind Right, Schiltslac', '22v-23r', 8),
(9991035, 9991026, '7th Ward - Overbind Left, Thrust Underneath', '23r', 9),
(9991036, NULL, 'Priest Special Longpoint (PSL)', NULL, 8),
(9991037, 9991036, 'Halfshield - PSL - Fall Under Sword and Shield - Overbind and Separate Sword and Shield', '23v-24r', 1),
(9991038, 9991036, 'PSL - Halfshield - Fall Under Sword and Shield - Strikes Without Schiltslac - Thrust Counter',  '24v-25r', 2),
(9991039, 9991036, 'PSL - Rare Halfshield - Thrust Left - Overbind etc', '25r-26r', 3),
(9991040, 9991036, 'PSL Obsessio - 3rd Ward - Schutzen', '3rd Ward', 4),
(9991041, 9991036, '4th Ward - PSL Obsessio - Schutzen - Overbind', '26v', 5),
(9991042, 9991036, '5th Ward - PSL Obsessio - Overbind Right etc', '27r', 6),
(9991043, NULL, '5th Ward - Right Side', NULL, 9),
(9991044, 9991043, '5th Ward - Halfshield - Thrust Left - Schiltslac Counter', '27v-28r', 1),
(9991045, 9991043, '5th Ward - Halfshield Obsessio - Enters with Thrust - Schiltslac Counter', '28r-29r', 2),
(9991046, 9991043, '5th Ward - Obsessio Quandam Rara - Enters with Thrust - Counter Thrust to Left', '29r-29v', 3),
(9991047, NULL, 'Misc.', NULL, 10),
(9991048, 9991047, '4th Ward - PSL Obsessio - Halfshield - Overbind Right, Schiltslac', '30r-30v', 1),
(9991049, 9991047, 'PSL Obsessio - 4th Ward - Schutzen and enter with Thrust', '31r-31v', 2),
(9991050, 9991047, '1st Ward - Walpurgis Obsessio - Schutzen (Walpurgis) - Overbind Right, Schiltslac', '32r-32v', 3);


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
(9991001, 1, 'tt27o4ry0y0'),
(9991003, 1, 'FTZiAfC16NM'),
(9991003, 1, 'SKyNyYnQZW4'),
(9991003, 1, 'jxonUvrHw9M'),
(9991003, 1, '8lZkmob8p9k'),
(9991003, 1, 'VFIXhcUEIEU'),
(9991003, 1, 'otU-sQhwsA4'),
(9991003, 1, 'TcgzUFQYujY'),
(9991004, 1, 'jxonUvrHw9M'),
(9991004, 1, '9H__2ehaXbw'),
(9991005, 1, 'jxonUvrHw9M'),
(9991006, 1, 'jxonUvrHw9M'),
(9991011, 1, '1or1ErXImBU'),
(9991011, 1, 'qNzjrNNDF3s'),
(9991017, 1, 'k8D1rXp8MFg'),
(9991048, 1, 'zLCIMG42e98'),
(9991049, 1, 'GX616ru3seE');

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

