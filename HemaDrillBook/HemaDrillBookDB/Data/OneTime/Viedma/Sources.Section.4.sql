IF $(OneTimeLoad) = 1
BEGIN

    DECLARE @Section TABLE
    (
        SectionKey INT NOT NULL PRIMARY KEY,
        BookKey INT NOT NULL,
        ParentSectionKey INT NULL,
        SectionName NVARCHAR(250) NOT NULL,
        PageReference NVARCHAR(50) NULL,
        DisplayOrder FLOAT NOT NULL,
        SectionSlug VARCHAR(50) NULL
            UNIQUE
    );

    INSERT INTO @Section
    (
        SectionKey,
        BookKey,
        ParentSectionKey,
        SectionName,
        PageReference,
        DisplayOrder,
        SectionSlug
    )
    VALUES
    (4002, 20, NULL, N'Rule 1', NULL, 1, 'Rule-1'),
    (4003, 20, NULL, N'Rule 2', NULL, 2, 'Rule-2'),
    (4004, 20, NULL, N'Rule 3', NULL, 3, 'Rule-3');

    MERGE INTO Sources.Section t
    USING @Section s
    ON t.SectionKey = s.SectionKey
    WHEN NOT MATCHED THEN
        INSERT
        (
            SectionKey,
            PartKey,
            ParentSectionKey,
            SectionName,
            PageReference,
            DisplayOrder,
            SectionSlug
        )
        VALUES
        (s.SectionKey, s.PartKey, s.ParentSectionKey, s.SectionName, s.PageReference, s.DisplayOrder, s.SectionSlug)
    WHEN MATCHED THEN
        UPDATE SET PartKey = s.PartKey,
                   ParentSectionKey = s.ParentSectionKey,
                   SectionName = s.SectionName,
                   PageReference = s.PageReference,
                   DisplayOrder = s.DisplayOrder,
                   SectionSlug = s.SectionSlug;

END;
GO
