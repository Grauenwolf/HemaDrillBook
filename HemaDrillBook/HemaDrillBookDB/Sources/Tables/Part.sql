CREATE TABLE Sources.Part
(
    PartKey INT NOT NULL
        CONSTRAINT PK_Part PRIMARY KEY,
    BookKey INT NOT NULL
        CONSTRAINT FK_Part_BookKey
        REFERENCES Sources.Book (BookKey),
    PartName NVARCHAR(250) NOT NULL
        CONSTRAINT C_Part_PartName CHECK (LEN(PartName) > 0),
    DisplayOrder FLOAT NOT NULL,
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    PartSlug VARCHAR(50) NULL,
    PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Sources.Part_History));

GO



CREATE UNIQUE NONCLUSTERED INDEX UX_Part_PartName
ON Sources.Part (
                    BookKey,
                    PartName
                );

GO


CREATE UNIQUE NONCLUSTERED INDEX UX_Part_Slug
ON Sources.Part (
                    BookKey,
                    PartSlug
                );
