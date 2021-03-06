﻿CREATE TABLE Sources.Section
(
    SectionKey INT NOT NULL IDENTITY
        CONSTRAINT PK_Section PRIMARY KEY,
    PartKey INT NOT NULL
        CONSTRAINT FK_Section_PartKey
        REFERENCES Sources.Part (PartKey),
    ParentSectionKey INT NULL
        CONSTRAINT FK_SectionKey_ParentSectionKey
        REFERENCES Sources.Section (SectionKey),
    SectionName NVARCHAR(250) NOT NULL
        CONSTRAINT C_Section_SectionName CHECK (LEN(SectionName) > 0),
    PageReference NVARCHAR(50) NULL,
    DisplayOrder FLOAT NOT NULL,
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    SectionSlug VARCHAR(50) NULL,
    PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Sources.Section_History));

GO

GRANT SELECT, INSERT, UPDATE ON Sources.Section TO HemaWeb;

GO

CREATE UNIQUE NONCLUSTERED INDEX UX_Section_SectionName_1
ON Sources.Section (
                       PartKey,
                       SectionName
                   )
WHERE ParentSectionKey IS NULL;

GO
CREATE UNIQUE NONCLUSTERED INDEX UX_Section_SectionName_2
ON Sources.Section (
                       PartKey,
                       ParentSectionKey,
                       SectionName
                   )
WHERE ParentSectionKey IS NOT NULL;

GO
CREATE UNIQUE NONCLUSTERED INDEX UX_Section_Slug
ON Sources.Section (
                       PartKey,
                       SectionSlug
                   )
WHERE SectionSlug IS NOT NULL;
GO
CREATE NONCLUSTERED INDEX IX_Section_PartKey
ON Sources.Section (PartKey)
INCLUDE (
            ParentSectionKey,
            SectionName,
            PageReference,
            DisplayOrder,
            SectionSlug
        );