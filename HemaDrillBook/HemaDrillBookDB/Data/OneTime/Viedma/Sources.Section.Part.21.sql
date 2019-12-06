IF $(OneTimeLoad) = 1
BEGIN

    DECLARE @Section TABLE
    (
        SectionKey INT NOT NULL PRIMARY KEY,
        PartKey INT NOT NULL,
        ParentSectionKey INT NULL,
        SectionName NVARCHAR(250) NOT NULL,
        PageReference NVARCHAR(50) NULL,
        DisplayOrder FLOAT NOT NULL,
        SectionSlug VARCHAR(50) NULL
    );

    INSERT INTO @Section
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
    (4901, 21, NULL, N'History', NULL, 1, 'History'),
    (4902, 21, NULL, N'Weapons and Equipment', NULL, 2, 'Weapons'),
    (4903, 21, NULL, N'General Discussion', NULL, 3, 'General-Discussion'),
    (4904, 21, NULL, N'Misc. Drills and Lessons', NULL, 4, 'Misc');


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
