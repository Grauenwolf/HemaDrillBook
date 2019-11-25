CREATE TABLE Sources.Author
(
    AuthorKey INT NOT NULL
        CONSTRAINT PK_Author PRIMARY KEY,
    AuthorName NVARCHAR(500) NOT NULL,
    AuthorSlug CHAR(50) NOT NULL
        CONSTRAINT UX_Author_AuthorSlug
        UNIQUE,
    CONSTRAINT UX_Author_AuthorName
        UNIQUE (AuthorName),
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Sources.Author_History) );
