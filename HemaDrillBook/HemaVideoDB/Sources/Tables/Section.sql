CREATE TABLE Sources.Section
(
    SectionKey INT NOT NULL 
        CONSTRAINT PK_Section PRIMARY KEY,
    BookKey INT NOT NULL
        CONSTRAINT FK_Section_BookKey
        REFERENCES Sources.Book (BookKey),
    ParentSectionKey INT NULL
        CONSTRAINT FK_SectionKey_ParentSectionKey
        REFERENCES Sources.Section (SectionKey),
    SectionName NVARCHAR(250) NOT NULL,
	PageReference NVARCHAR(50) NULL,
	DisplayOrder FLOAT NOT NULL,
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Sources.Section_History) );

GO



CREATE UNIQUE NONCLUSTERED INDEX UX_Section_SectionName_1
ON Sources.Section
(
    BookKey,
    SectionName
)
WHERE ParentSectionKey IS NULL;

GO
CREATE UNIQUE NONCLUSTERED INDEX UX_Section_SectionName_2
ON Sources.Section
(
    BookKey,
    ParentSectionKey,
    SectionName
)
WHERE ParentSectionKey IS NOT NULL;


