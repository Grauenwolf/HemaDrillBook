CREATE TABLE Sources.AlternateBookName
(
    AlternateBookNameKey INT NOT NULL IDENTITY
        CONSTRAINT PK_AlternateBookName PRIMARY KEY,
    BookKey INT NOT NULL
        CONSTRAINT FK_AlternateBookName_BookKey
        REFERENCES Sources.Book (BookKey),
    AlternateBookName NVARCHAR(500) NOT NULL,
	CONSTRAINT UX_AlternateBookName UNIQUE (BookKey, AlternateBookName),
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Sources.AlternateBookName_History) );

