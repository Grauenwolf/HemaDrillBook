IF $(OneTimeLoad) = 1
BEGIN

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
(1, N'Joachim Meyer', 'Meyer'),
--(2, N'Clerus Lutegerus', 'Lutegerus'),
--(3, N'Diogo Gomes de Figueyredo', 'Figueyredo'),
--(4, N'Díaz de Viedma', 'Viedma'),
--(6, N'Giovanni dall''Agocchie di Bologna', 'dall''Agocchie'),
--(7, N'Salvator Fabris', 'Fabris'),
--(9, N'Fiore Furlano de’i Liberi de Cividale d’Austria', 'Fiore'),
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


END
GO
