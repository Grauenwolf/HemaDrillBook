IF $(OneTimeLoad) = 1
BEGIN

    DECLARE @Part TABLE
    (
        PartKey INT NOT NULL PRIMARY KEY,
        BookKey INT NOT NULL,
        PartName NVARCHAR(250) NOT NULL,
        DisplayOrder FLOAT NOT NULL,
        PartSlug VARCHAR(50) NULL
    );

    INSERT INTO @Part
    (
        PartKey,
        BookKey,
        PartName,
        DisplayOrder,
        PartSlug
    )
    VALUES
    (1, 1, N'Book 1 Part 1 Longsword', 1, 'Longsword'),
    (2, 1, N'Book 2 Part 2 Dussack', 2, 'Dussack'),
    (3, 1, N'Book 2 Part 3 Sidesword (Rappier)', 3, 'Rappier'),
    (4, 1, N'Book 3 Part 4 Dagger and Wrestling', 4, 'Dagger'),
    (5, 1, N'Book 3 Part 5 Quarterstaff', 5, 'Quarterstaff'),
    (6, 1, N'Book 3 Part 5 Halberd', 6, 'Halberd'),
    (7, 1, N'Book 3 Part 5 Pike', 7, 'Pike');


    MERGE INTO Sources.Part t
    USING @Part s
    ON t.PartKey = s.PartKey
    WHEN NOT MATCHED THEN
        INSERT
        (
            PartKey,
            BookKey,
            PartName,
            DisplayOrder,
            PartSlug
        )
        VALUES
        (s.PartKey, s.BookKey, s.PartName, s.DisplayOrder, s.PartSlug)
    WHEN MATCHED THEN
        UPDATE SET BookKey = s.BookKey,
                   PartName = s.PartName,
                   DisplayOrder = s.DisplayOrder,
                   PartSlug = s.PartSlug;

END;
GO
