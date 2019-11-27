﻿CREATE TABLE Sources.Book
(
    BookKey INT NOT NULL
        CONSTRAINT PK_Book PRIMARY KEY,
    BookName NVARCHAR(500) NOT NULL
        CONSTRAINT UX_Book_BookName
        UNIQUE
        CONSTRAINT C_Book_BookName CHECK (LEN(BookName) > 0),
    BookSlug VARCHAR(50) NOT NULL
        CONSTRAINT UX_Book_BookSlug
        UNIQUE
        CONSTRAINT C_Book_BookSlug CHECK (LEN(BookSlug) > 0),
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    Notes NVARCHAR(MAX) NULL,
    WiktenauerUrl NVARCHAR(300) NULL
        CONSTRAINT C_Book_WiktenauerUrl CHECK (LEN(WiktenauerUrl) > 0),
    PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Sources.Book_History));
GO
GRANT SELECT ON Sources.Book TO HemaWeb;