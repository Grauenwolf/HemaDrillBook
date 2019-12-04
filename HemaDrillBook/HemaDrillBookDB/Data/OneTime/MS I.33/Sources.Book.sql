IF $(OneTimeLoad) = 1
BEGIN

    DECLARE @Book TABLE
    (
        BookKey INT NOT NULL PRIMARY KEY,
        BookName NVARCHAR(500) NOT NULL,
        BookSlug VARCHAR(50) NOT NULL,
        Notes NVARCHAR(MAX) NULL,
        WiktenauerUrl NVARCHAR(300) NULL
    );


    INSERT INTO @Book
    (
        BookKey,
        BookName,
        BookSlug,
        Notes,
        WiktenauerUrl
    )
    VALUES
    (2, N'MS I.33', 'MSI.33', NULL, N'http://wiktenauer.com/wiki/Walpurgis_Fechtbuch_(MS_I.33)');


    MERGE INTO Sources.Book t
    USING @Book s
    ON t.BookKey = s.BookKey
    WHEN NOT MATCHED THEN
        INSERT
        (
            BookKey,
            BookName,
            BookSlug,
            Notes,
            WiktenauerUrl
        )
        VALUES
        (s.BookKey, s.BookName, s.BookSlug, s.Notes, s.WiktenauerUrl)
    WHEN MATCHED THEN
        UPDATE SET BookName = s.BookName,
                   BookSlug = s.BookSlug,
                   Notes = s.Notes,
                   WiktenauerUrl = s.WiktenauerUrl;


    DECLARE @Author TABLE
    (
        AuthorKey INT NOT NULL PRIMARY KEY,
        AuthorName NVARCHAR(500) NOT NULL,
        AuthorSlug VARCHAR(50) NOT NULL
    );

    INSERT INTO @Author
    (
        AuthorKey,
        AuthorName,
        AuthorSlug
    )
    VALUES
    (2, N'Clerus Lutegerus', 'Lutegerus');


    MERGE INTO Sources.Author t
    USING @Author s
    ON t.AuthorKey = s.AuthorKey
    WHEN NOT MATCHED THEN
        INSERT
        (
            AuthorKey,
            AuthorName,
            AuthorSlug
        )
        VALUES
        (s.AuthorKey, s.AuthorName, s.AuthorSlug)
    WHEN MATCHED THEN
        UPDATE SET AuthorName = s.AuthorName,
                   AuthorSlug = s.AuthorSlug;



    DECLARE @BookAuthorMap TABLE
    (
        BookKey INT NOT NULL,
        AuthorKey INT NOT NULL,
        PRIMARY KEY (
                        BookKey,
                        AuthorKey
                    )
    );

    INSERT INTO @BookAuthorMap
    (
        BookKey,
        AuthorKey
    )
    VALUES
	(2, 2);


    MERGE INTO Sources.BookAuthorMap t
    USING @BookAuthorMap s
    ON t.BookKey = s.BookKey
       AND t.AuthorKey = s.AuthorKey
    WHEN NOT MATCHED THEN
        INSERT
        (
            BookKey,
            AuthorKey
        )
        VALUES
        (s.BookKey, s.AuthorKey);


		   DECLARE @AlternateBookName TABLE
    (
        AlternateBookNameKey INT NOT NULL PRIMARY KEY,
        BookKey INT NOT NULL,
        AlternateBookName NVARCHAR(500) NOT NULL
    );

    INSERT INTO @AlternateBookName
    (
        AlternateBookNameKey,
        BookKey,
        AlternateBookName
    )
    VALUES
    (201, 2, N'Walpurgis Fechtbuch'),
    (202, 2, N'Liber de Arte Dimicatoria '),
    (203, 2, N'The Tower Fechtbuch');

    
    SET IDENTITY_INSERT Sources.AlternateBookName ON;


    MERGE INTO Sources.AlternateBookName t
    USING @AlternateBookName s
    ON t.AlternateBookNameKey = s.AlternateBookNameKey
    WHEN NOT MATCHED THEN
        INSERT
        (
            AlternateBookNameKey,
            BookKey,
            AlternateBookName
        )
        VALUES
        (s.AlternateBookNameKey, s.BookKey, s.AlternateBookName)
    WHEN MATCHED THEN
        UPDATE SET BookKey = s.BookKey,
                   AlternateBookName = s.AlternateBookName;

    SET IDENTITY_INSERT Sources.AlternateBookName OFF;

END;
