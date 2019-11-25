CREATE TABLE dbo.BookEditor
(
    CONSTRAINT PK_BookEditor
        PRIMARY KEY
        (
            BookKey,
            UserKey
        ),
    BookKey INT NOT NULL
        CONSTRAINT FK_BookEditor_Book
        REFERENCES Sources.Book (BookKey),
    UserKey INT NOT NULL
        CONSTRAINT FK_BookEditor_User
        REFERENCES dbo.AspNetUsers (UserKey),
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.BookEditor_History));
