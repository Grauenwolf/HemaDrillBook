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
            UNIQUE
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
    (3002, 18, NULL, N'Simple Rule 1', NULL, 1, 'Simple-1'),
    (3003, 18, NULL, N'Composed Rule 1', NULL, 2, 'Composed-1'),
    (3004, 18, NULL, N'Simple Rule 2', NULL, 3, 'Simple-2'),
    (3005, 18, NULL, N'Composed Rule 2', NULL, 4, 'Composed-2'),
    (3006, 18, NULL, N'Simple Rule 3', NULL, 5, 'Simple-3'),
    (3007, 18, NULL, N'Composed Rule 3', NULL, 6, 'Composed-3'),
    (3008, 18, NULL, N'Simple Rule 4', NULL, 7, 'Simple-4'),
    (3009, 18, NULL, N'Composed Rule 4', NULL, 8, 'Composed-4'),
    (3010, 18, NULL, N'Simple Rule 5', NULL, 9, 'Simple-5'),
    (3011, 18, NULL, N'Composed Rule 5', NULL, 10, 'Composed-5'),
    (3012, 18, NULL, N'Simple Rule 6', NULL, 11, 'Simple-6'),
    (3013, 18, NULL, N'Composed Rule 6', NULL, 12, 'Composed-6'),
    (3014, 18, NULL, N'Simple Rule 7', NULL, 13, 'Simple-7'),
    (3015, 18, NULL, N'Composed Rule 7', NULL, 14, 'Composed-7'),
    (3016, 18, NULL, N'Simple Rule 8', NULL, 15, 'Simple-8'),
    (3017, 18, NULL, N'Composed Rule 8', NULL, 16, 'Composed-8'),
    (3018, 18, NULL, N'Simple Rule 9', NULL, 17, 'Simple-9'),
    (3019, 18, NULL, N'Composed Rule 9', NULL, 18, 'Composed-9'),
    (3020, 18, NULL, N'Simple Rule 10', NULL, 19, 'Simple-10'),
    (3021, 18, NULL, N'Composed Rule 10', NULL, 20, 'Composed-10'),
    (3022, 18, NULL, N'Simple Rule 11', NULL, 21, 'Simple-11'),
    (3023, 18, NULL, N'Composed Rule 11', NULL, 22, 'Composed-11'),
    (3024, 18, NULL, N'Simple Rule 12', NULL, 23, 'Simple-12'),
    (3025, 18, NULL, N'Composed Rule 12', NULL, 24, 'Composed-12'),
    (3026, 18, NULL, N'Simple Rule 13', NULL, 25, 'Simple-13'),
    (3027, 18, NULL, N'Composed Rule 13', NULL, 26, 'Composed-13'),
    (3028, 18, NULL, N'Simple Rule 14', NULL, 27, 'Simple-14'),
    (3029, 18, NULL, N'Composed Rule 14', NULL, 28, 'Composed-14'),
    (3030, 18, NULL, N'Simple Rule 15', NULL, 29, 'Simple-15'),
    (3031, 18, NULL, N'Composed Rule 15', NULL, 30, 'Composed-15'),
    (3032, 18, NULL, N'Simple Rule 16', NULL, 31, 'Simple-16'),
    (3033, 18, NULL, N'Composed Rule 16', NULL, 32, 'Composed-16'),
    (3034, 18, NULL, N'Conclusion', NULL, 34, 'Conclusion');



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
