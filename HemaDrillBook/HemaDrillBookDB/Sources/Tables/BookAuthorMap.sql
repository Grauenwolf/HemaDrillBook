CREATE TABLE Sources.BookAuthorMap
(
    BookKey INT NOT NULL 
        CONSTRAINT FK_BookAuthor_BookKey
        REFERENCES Sources.Book (BookKey),
    AuthorKey INT NOT NULL
        CONSTRAINT FK_BookAuthor_AuthorKey
        REFERENCES Sources.Author (AuthorKey),
    CONSTRAINT PK_BookAuthor
        PRIMARY KEY
        (
            BookKey,
            AuthorKey
        ),
    DisplayOrder FLOAT NOT NULL CONSTRAINT D_BookAuthor_DisplayOrder DEFAULT(1),
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Sources.BookAuthorMap_History) );

