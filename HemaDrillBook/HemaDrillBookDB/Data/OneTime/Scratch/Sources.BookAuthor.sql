IF $(OneTimeLoad) = 1
BEGIN

DECLARE @BookAuthor TABLE
(
    BookKey INT NOT NULL ,
    AuthorKey INT NOT NULL,
	
	PRIMARY KEY(BookKey, AuthorKey)
);

INSERT INTO @BookAuthor
(
    BookKey,
    AuthorKey
)
VALUES
(1, 1),
--(2, 2),
--(3, 3),
--(4, 4),
--(6, 6),
--(7, 7),
--(9, 9),
(5, 5);


MERGE INTO Sources.BookAuthor t
USING @BookAuthor s
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


END
GO
