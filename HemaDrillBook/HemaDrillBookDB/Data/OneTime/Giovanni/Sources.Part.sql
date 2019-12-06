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
	(22, 6, N'The First Book of Dialogs', 1, 'Sword'),
	(23, 6, N'The Fourth Day of the First Book Dealing with the Dagger', 2, 'Dagger'),
    (24, 6, N'Extras', 999, 'Extras');



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

