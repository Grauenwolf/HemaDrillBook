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
	(25, 7, N'Book 1', 1, 'Book-1'),
	(26, 7, N'Book 2', 2, 'Book-2'),
    (27, 7, N'Extras', 999, 'Extras');



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

