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
        SectionSlug VARCHAR(50) NOT NULL
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
    (2001, 16, NULL, N'The 7 Wards', N'1r-1v', 1, 'Wards'),
    (2002, 16, NULL, N'1st Ward - Underarm', NULL, 2, 'Underarm'),
    (2003, 16, 2002, N'1st Ward - Halfshield - Fall Under, Overbind and Schiltslac', N'2r-2v', 1, 'Underarm-1'),
    (2004, 16, 2002, N'1st Ward - Halfshield - Fall Under - Overbind - Mutate and Nucken', N'3r-4r', 2, 'Underarm-2'),
    (2005, 16, 2002, N'1st Ward - Krucke - Overbind - Grapple the Arms - Schiltslac Counter', N'4r-5r', 3, 'Underarm-3'),
    (2006, 16, 2002, N'Krucke - 1st Ward - Enter with Thrust', N'5r-5v', 4, 'Underarm-4'),
    (2007, 16, 2002, N'Krucke - Krucke Bind - Thrust and Mind the Head ', N'5v-6v', 5, 'Underarm-5'),
    (2008, 16, 2002, N'1st Ward - Langort Obsessio - Overbind and Schiltslac', N'6v-7r', 6, 'Underarm-6'),
    (2009, 16, 2002, N'1st Ward - Langort Obsessio - Underbind, Mutate, and Nucken', N'7v-8r', 7, 'Underarm-7'),
    (2010, 16, NULL, N'2nd Ward - Right Shoulder', NULL, 3, 'Right-Shoulder'),
    (2011, 16, 2010, N'2nd Ward - Schutzen', N'2nd Ward', 1, 'Right-Shoulder-1'),
    (2012, 16, 2010, N'Schutzen', N'2nd Ward', 2, 'Right-Shoulder-2'),
    (2013, 16, 2010, N'2nd Ward - Halfshield - Cut to Separate Sword and Shield - Stichslac Counter', N'10v-11r', 3, 'Right-Shoulder-3'),
    (2014, 16, 2010, N'Halfshield - 1st Ward - Enter with Strike', N'11v', 4, 'Right-Shoulder-4'),
    (2015, 16, NULL, N'3rd Ward - Left Shoulder', NULL, 4, 'Left-Shoulder'), 
	(2016, 16, 2015, N'3rd Ward - Schutzen', N'3rd Ward', 1, 'Left-Shoulder-1'),
    (2017, 16, 2015, N'Schutzen', N'3rd Ward', 2, 'Left-Shoulder-2'),
    (2018, 16, 2015, N'3rd Ward - Halfshield - Fall Under Sword and Shield - Overbind and Schiltslac', N'13r-14r', 3, 'Left-Shoulder-3'),
    (2019, 16, 2015, N'3rd Ward - Langort Obsessio - Overbind etc', N'14r-14v', 4, 'Left-Shoulder-4'),
    (2020, 16, NULL, N'4th Ward - Overhead', NULL, 5, 'Overhead'),
    (2021, 16, 2020, N'4th Ward - Halfshield - Fall Under Sword and Shield - Overbind and Schiltslac', N'14v', 1, 'Overhead-1'),
    (2022, 16, 2020, N'4th Ward - 1st Ward Obsessio - Halfshield - Fall under Sword and Shield - Overbind and Schiltslac', N'15r-16r', 2, 'Overhead-2'),
    (2023, 16, 2020, N'1st Ward - Langort Obsessio - Grab Sword - Schiltslac to Hand - Defend the Head', N'16r-16v', 3, 'Overhead-3'),
    (2024, 16, NULL, N'6th Ward - Breast', NULL, 6, 'Breast'),
    (2025, 16, 2024, N'6th Ward - Halfshield - Thrust to the Left - Overbind etc', N'17r', 1, 'Breast-1'),
    (2026, 16, NULL, N'7th Ward - Langort (Longpoint)', NULL, 7, 'Langort'),
    (2027, 16, 2026, N'7th Ward - Overbind Right - Schutzen - Schiltslac Counter', N'17v-18r', 1, 'Langort-1'),
    (2028, 16, 2026, N'7th Ward - Overbind Right - Arm Grapple - Kick Counter - pull back to 6th Ward', N'18v-19r', 2, 'Langort-2'),
    (2029, 16, 2026, N'7th Ward - Underbind Left - Strike to Head - Counter', N'19r-19v', 3, 'Langort-3'),
    (2030, 16, 2026, N'7th Ward - Overbind Left - Thrust to the left', N'20r', 4, 'Langort-4'),
    (2031, 16, 2026, N'7th Ward - Overbind Right - Flee to the Side - Follows with Cut to Head', N'20v', 5, 'Langort-5'),
    (2032, 16, 2026, N'Upper langort - Bind to the Left - Overbind Right - Thrust Underneath - Cover - Thrust to the Right', N'21r-21v', 6, 'Langort-6'),
    (2033, 16, 2026, N'Vidilpoge - Bind on the Arm - Turn the Hand and take their Sword', N'22r', 7, 'Langort-7'),
    (2034, 16, 2026, N'Vidilpoge - Bind on the Arm - Overbind Right, Schiltslac', N'22v-23r', 8, 'Langort-8'),
    (2035, 16, 2026, N'7th Ward - Overbind Left, Thrust Underneath', N'23r', 9, 'Langort-9'),
    (2036, 16, NULL, N'Priest Special Longpoint (PSL)', NULL, 8, 'PSL'),
    (2037, 16, 2036, N'Halfshield - PSL - Fall Under Sword and Shield - Overbind and Separate Sword and Shield', N'23v-24r', 1, 'PSL-1'),
    (2038, 16, 2036, N'PSL - Halfshield - Fall Under Sword and Shield - Strikes Without Schiltslac - Thrust Counter', N'24v-25r', 2, 'PSL-2'),
    (2039, 16, 2036, N'PSL - Rare Halfshield - Thrust Left - Overbind etc', N'25r-26r', 3, 'PSL-3'),
    (2040, 16, 2036, N'PSL Obsessio - 3rd Ward - Schutzen', N'3rd Ward', 4, 'PSL-4'),
    (2041, 16, 2036, N'4th Ward - PSL Obsessio - Schutzen - Overbind', N'26v', 5, 'PSL-5'),
    (2042, 16, 2036, N'5th Ward - PSL Obsessio - Overbind Right etc', N'27r', 6, 'PSL-6'),
    (2043, 16, NULL, N'5th Ward - Right Side', NULL, 9, 'Right-Side'),
    (2044, 16, 2043, N'5th Ward - Halfshield - Thrust Left - Schiltslac Counter', N'27v-28r', 1, 'Right-Side-1'),
    (2045, 16, 2043, N'5th Ward - Halfshield Obsessio - Enters with Thrust - Schiltslac Counter', N'28r-29r', 2, 'Right-Side-2'),
    (2046, 16, 2043, N'5th Ward - Obsessio Quandam Rara - Enters with Thrust - Counter Thrust to Left', N'29r-29v', 3, 'Right-Side-3'),
    (2047, 16, NULL, N'Misc.', NULL, 10, 'Misc'),
    (2048, 16, 2047, N'4th Ward - PSL Obsessio - Halfshield - Overbind Right, Schiltslac', N'30r-30v', 1, 'Misc-1'),
    (2049, 16, 2047, N'PSL Obsessio - 4th Ward - Schutzen and enter with Thrust', N'31r-31v', 2, 'Misc-2'),
    (2050, 16, 2047, N'1st Ward - Walpurgis Obsessio - Schutzen (Walpurgis) - Overbind Right, Schiltslac', N'32r-32v', 3, 'Misc-3');


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

