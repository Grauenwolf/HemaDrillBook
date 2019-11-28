CREATE TABLE Sources.Section_History
(
    SectionKey INT NOT NULL,
    PartKey INT NOT NULL,
    ParentSectionKey INT NULL,
    SectionName NVARCHAR(250) NOT NULL,
    PageReference NVARCHAR(50) NULL,
    DisplayOrder FLOAT NOT NULL,
    SysStartTime DATETIME2 NOT NULL,
    SysEndTime DATETIME2 NOT NULL,
    SectionSlug VARCHAR(50) NULL
);


GO

--CREATE CLUSTERED COLUMNSTORE INDEX IX_Section_History
--    ON Sources.Section_History;
GO

CREATE NONCLUSTERED INDEX IX_Section_History_SysColumns
    ON Sources.Section_History (SysEndTime, SysStartTime, SectionKey);

GO
