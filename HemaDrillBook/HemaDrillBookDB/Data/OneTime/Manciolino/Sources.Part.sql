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
    (8, 5, N'Book 1', 1, 'Book-1'),
    (9, 5, N'Book 2', 2, 'Book-2'),
    (10, 5, N'Book 3', 3, 'Book-3'),
    (11, 5, N'Book 4', 4, 'Book-4'),
    (12, 5, N'Book 5', 5, 'Book-5'),
    (13, 5, N'Book 6', 5, 'Book-6');



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
