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
    (5, N'Opera Nova', 'Manciolino', NULL, N'http://wiktenauer.com/wiki/Antonio_Manciolino');


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
    (5, N'Antonio Manciolino', 'Manciolino');


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
	(5, 5);


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




END;
GO
