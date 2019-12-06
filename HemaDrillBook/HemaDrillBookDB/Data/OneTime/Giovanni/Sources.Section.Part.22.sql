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
    (6001, 22, NULL, N'The First Day of the First Book', NULL, 1, 'Day-1'),
    (6002, 22, 6001, N'Why the art of fencing is so little valued', NULL, 1, 'Art'),
    (6003, 22, 6001, N'Why fencing is the foundation of the military art', NULL, 2, 'Foundation'),
    (6004, 22, 6001, N'Theory and practice, foundations of the arts', NULL, 3, 'Theory-and-practice'),
    (6005, 22, 6001, N'Art of fencing has six headings', NULL, 4, 'Six-headings'),
    (6006, 22, 6001, N'Blows are of multiple sorts', NULL, 5, 'Blows'),
    (6007, 22, 6001, N'There are eight guards which are the most important', NULL, 6, 'Eight-guards'),
    (6008, 22, 6007, N'Coda lunga', NULL, 1, 'Coda-lunga'),
    (6009, 22, 6007, N'Porta di ferro', NULL, 2, 'Porta-di-ferro'),
    (6010, 22, 6007, N'Porta di ferro stretta, and larga', NULL, 3, 'Porta-di-ferro-stretta-larga'),
    (6011, 22, 6007, N'Coda lunga of three types', NULL, 4, 'Coda-lunga-Three'),
    (6012, 22, 6007, N'Guard and its types', NULL, 5, 'Guard-and-its-types'),
    (6013, 22, 6001, N'Stepping in the Guards', NULL, 13, 'Stepping-in-the-Guards'),
    (6014, 22, NULL, N'The Second Day of the First Book', NULL, 2, 'Day-2'),
    (6015, 22, 6014, N'Unaccompanied sword:  why it is preferred to the other arms', NULL, 1, 'Unaccompanied-sword'),
    (6016, 22, 6014, N'Parrying with the sword: in how many ways it can be done', NULL, 2, 'Parrying'),
    (6017, 22, 6014, N'Wounding with the thrust is better than with the cut', NULL, 3, 'Wounding'),
    (6018, 22, 6014, N'On the motion of the feet and the body', NULL, 4, 'Feet-and-body'),
    (6019, 22, 6014, N'Ways of defending yourself from the enemy, and of harming him', NULL, 5, 'Defending-yourself'),
    (6020, 22, 6019, N'Coda Lunga Stretta', NULL, 1, 'Coda-Lunga-Stretta'),
    (6021, 22, 6020, N'Dritto Fendente to Head', NULL, 1, 'Coda-Lunga-Stretta-1'),
    (6022, 22, 6020, N'Mandritto to Head', NULL, 2, 'Coda-Lunga-Stretta-2'),
    (6023, 22, 6020, N'Mandritto to Leg', NULL, 3, 'Coda-Lunga-Stretta-3'),
    (6024, 22, 6020, N'Mandritto Ridoppio', NULL, 4, 'Coda-Lunga-Stretta-4'),
    (6025, 22, 6020, N'Riverso Fendente to Head', NULL, 5, 'Coda-Lunga-Stretta-5'),
    (6026, 22, 6020, N'Riverso to Head', NULL, 6, 'Coda-Lunga-Stretta-6'),
    (6027, 22, 6020, N'Riverso to Leg', NULL, 7, 'Coda-Lunga-Stretta-7'),
    (6028, 22, 6020, N'Riverso Ridoppio', NULL, 8, 'Coda-Lunga-Stretta-8'),
    (6029, 22, 6020, N'Imbroccata', NULL, 9, 'Coda-Lunga-Stretta-9'),
    (6030, 22, 6020, N'Stoccata', NULL, 10, 'Coda-Lunga-Stretta-10'),
    (6031, 22, 6019, N'Coda Lunga Alta', NULL, 2, 'Coda-Lunga-Alta'),
    (6032, 22, 6031, N'Mandritto to Head', NULL, 1, 'Coda-Lunga-Alta-1'),
    (6033, 22, 6031, N'Mandritto to Leg', NULL, 2, 'Coda-Lunga-Alta-2'),
    (6034, 22, 6031, N'Riverso to Head', NULL, 3, 'Coda-Lunga-Alta-3'),
    (6035, 22, 6031, N'Riverso to Leg', NULL, 4, 'Coda-Lunga-Alta-4'),
    (6036, 22, 6031, N'Imbroccata', NULL, 5, 'Coda-Lunga-Alta-5'),
    (6037, 22, 6031, N'Stoccata', NULL, 6, 'Coda-Lunga-Alta-6'),
    (6038, 22, 6019, N'Porta di Ferro Stretta', NULL, 3, 'Porta-di-Ferro-Stretta'),
    (6039, 22, 6038, N'Dritto Fendente to Head', NULL, 1, 'Porta-di-Ferro-Stretta-1'),
    (6040, 22, 6038, N'Mandritto to Body', NULL, 2, 'Porta-di-Ferro-Stretta-2'),
    (6041, 22, 6038, N'Mandritto to Leg', NULL, 3, 'Porta-di-Ferro-Stretta-3'),
    (6042, 22, 6038, N'Riverso to Head', NULL, 4, 'Porta-di-Ferro-Stretta-4'),
    (6043, 22, 6038, N'Riverso to Body', NULL, 5, 'Porta-di-Ferro-Stretta-5'),
    (6044, 22, 6038, N'Riverso to Leg', NULL, 6, 'Porta-di-Ferro-Stretta-6'),
    (6045, 22, 6038, N'Riverso Ridoppio', NULL, 7, 'Porta-di-Ferro-Stretta-7'),
    (6046, 22, 6038, N'Imbroccata', NULL, 8, 'Porta-di-Ferro-Stretta-8'),
    (6047, 22, 6038, N'Stoccata', NULL, 9, 'Porta-di-Ferro-Stretta-9'),
    (6048, 22, 6019, N'Cinghiale Porta di Ferro', NULL, 4, 'Cinghiale-Porta-di-Ferro'),
    (6049, 22, 6048, N'Mandritto to Head', NULL, 1, 'Cinghiale-Porta-di-Ferro-1'),
    (6050, 22, 6048, N'Riverso to Head', NULL, 2, 'Cinghiale-Porta-di-Ferro-2'),
    (6051, 22, 6048, N'Riverso to Leg', NULL, 3, 'Cinghiale-Porta-di-Ferro-3'),
    (6052, 22, 6048, N'Imbroccata', NULL, 4, 'Cinghiale-Porta-di-Ferro-4'),
    (6053, 22, 6048, N'Stoccata', NULL, 5, 'Cinghiale-Porta-di-Ferro-5'),
    (6054, 22, 6019, N'Which is the surer defense', NULL, 5, 'Surer-defense'),
    (6055, 22, 6019, N'Guardia d’Alicorno', NULL, 6, 'Guardia-d''Alicorno'),
    (6056, 22, 6055, N'Fendente to Head', NULL, 1, 'Guardia-d''Alicorno-1'),
    (6057, 22, 6055, N'Mandritto', NULL, 2, 'Guardia-d''Alicorno-2'),
    (6058, 22, 6055, N'Mandritto or Riverso to Leg', NULL, 3, 'Guardia-d''Alicorno-3'),
    (6059, 22, 6055, N'Riverso to Head', NULL, 4, 'Guardia-d''Alicorno-4'),
    (6060, 22, 6055, N'Imbroccata', NULL, 5, 'Guardia-d''Alicorno-5'),
    (6061, 22, 6055, N'Stoccata', NULL, 6, 'Guardia-d''Alicorno-6'),
    (6062, 22, 6014, N'All Guards Together', NULL, 7, 'All-Guards-Together'),
    (6063, 22, NULL, N'The Third Day of the First Book', NULL, 3, 'Day-3'),
    (6064, 22, 6063, N'Of provoking and harming', NULL, 1, 'Of-provoking'),
    (6065, 22, 6064, N'Why provocations are performed', NULL, 1, 'Why-provocations'),
    (6066, 22, 6064, N'Coda Lunga Stretta', NULL, 2, 'Coda-Lunga-Stretta-Provocation'),
    (6067, 22, 6066, N'Provocation 1', NULL, 1, 'Coda-Lunga-Stretta-Provocation-1'),
    (6068, 22, 6066, N'Provocation 2', NULL, 2, 'Coda-Lunga-Stretta-Provocation-2'),
    (6069, 22, 6066, N'Provocation 3', NULL, 3, 'Coda-Lunga-Stretta-Provocation-3'),
    (6070, 22, 6066, N'Provocation 4', NULL, 4, 'Coda-Lunga-Stretta-Provocation-4'),
    (6071, 22, 6066, N'Provocation 5', NULL, 5, 'Coda-Lunga-Stretta-Provocation-5'),
    (6072, 22, 6066, N'Provocation 6', NULL, 6, 'Coda-Lunga-Stretta-Provocation-6'),
    (6073, 22, 6066, N'Provocation 7', NULL, 7, 'Coda-Lunga-Stretta-Provocation-7'),
    (6074, 22, 6064, N'Coda Lunga Alta', NULL, 3, 'Coda-Lunga-Alta-Provocation'),
    (6075, 22, 6074, N'Provocation 1', NULL, 1, 'Coda-Lunga-Alta-Provocation-1'),
    (6076, 22, 6074, N'Provocation 2', NULL, 2, 'Coda-Lunga-Alta-Provocation-2'),
    (6077, 22, 6074, N'Provocation 3', NULL, 3, 'Coda-Lunga-Alta-Provocation-3'),
    (6078, 22, 6074, N'Provocation 4', NULL, 4, 'Coda-Lunga-Alta-Provocation-4'),
    (6079, 22, 6064, N'Porta di Ferro Stretta', NULL, 4, 'Porta-di-Ferro-Stretta-Provocation'),
    (6080, 22, 6079, N'Provocation 1', NULL, 1, 'Porta-di-Ferro-Stretta-Provocation-1'),
    (6081, 22, 6079, N'Provocation 2', NULL, 2, 'Porta-di-Ferro-Stretta-Provocation-2'),
    (6082, 22, 6079, N'Provocation 3', NULL, 3, 'Porta-di-Ferro-Stretta-Provocation-3'),
    (6083, 22, 6079, N'Provocation 4', NULL, 4, 'Porta-di-Ferro-Stretta-Provocation-4'),
    (6084, 22, 6079, N'Provocation 5', NULL, 5, 'Porta-di-Ferro-Stretta-Provocation-5'),
    (6085, 22, 6079, N'Provocation 6', NULL, 6, 'Porta-di-Ferro-Stretta-Provocation-6'),
    (6086, 22, 6079, N'Provocation 7', NULL, 7, 'Porta-di-Ferro-Stretta-Provocation-7'),
    (6087, 22, 6064, N'Cinghiale Porta di Ferro', NULL, 5, 'Cinghiale-Porta-di-Ferro-Provocation'),
    (6088, 22, 6087, N'Provocation 1', NULL, 1, 'Cinghiale-Porta-di-Ferro-Provocation-1'),
    (6089, 22, 6087, N'Provocation 2', NULL, 2, 'Cinghiale-Porta-di-Ferro-Provocation-2'),
    (6090, 22, 6064, N'Provocations in cinghiale porta di ferro', NULL, 6, 'Provocations-in-cinghiale'),
    (6091, 22, 6064, N'Mezzi mandritti, why they are done, and why they are named so', NULL, 7, 'Mezzi-mandritti'),
    (6092, 22, 6064, N'Guardia d’Alicorno', NULL, 8, 'Guardia-d''Alicorno-Provocation'),
    (6093, 22, 6092, N'Provocation 1', NULL, 1, 'Guardia-d''Alicorno-Provocation-Provocation-1'),
    (6094, 22, 6092, N'Provocation 2', NULL, 2, 'Guardia-d''Alicorno-Provocation-Provocation-2'),
    (6095, 22, 6063, N'The tempo for attacking is recognized in five ways', NULL, 2, 'Tempo'),
    (6096, 22, 6063, N'Straits of the half sword', NULL, 3, 'Straits-of-the-half-sword'),
    (6097, 22, 6096, N'False Edge Stretta 1', NULL, 1, 'False-Edge-Stretta-1'),
    (6098, 22, 6096, N'False Edge Stretta 2', NULL, 2, 'False-Edge-Stretta-2'),
    (6099, 22, 6096, N'False Edge Stretta 3', NULL, 3, 'False-Edge-Stretta-3'),
    (6100, 22, 6096, N'False Edge Stretta 4', NULL, 4, 'False-Edge-Stretta-4'),
    (6101, 22, 6096, N'False Edge Stretta 5', NULL, 5, 'False-Edge-Stretta-5'),
    (6102, 22, 6096, N'False Edge Stretta 6', NULL, 6, 'False-Edge-Stretta-6'),
    (6103, 22, 6096, N'True Edge Stretta 1', NULL, 7, 'True-Edge-Stretta-1'),
    (6104, 22, 6096, N'True Edge Stretta 2', NULL, 8, 'True-Edge-Stretta-2'),
    (6105, 22, 6096, N'True Edge Stretta 3', NULL, 9, 'True-Edge-Stretta-3'),
    (6106, 22, 6096, N'True Edge Stretta 4', NULL, 10, 'True-Edge-Stretta-4'),
    (6107, 22, 6096, N'True Edge Stretta 5', NULL, 11, 'True-Edge-Stretta-5'),
    (6108, 22, 6096, N'True Edge Stretta 6', NULL, 12, 'True-Edge-Stretta-6'),
    (6109, 22, 6063, N'On parrying with the true edge of the sword and striking with a thrust', NULL, 4, 'On-parrying');


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
        UPDATE SET t.PartKey = s.PartKey,
                   t.ParentSectionKey = s.ParentSectionKey,
                   t.SectionName = s.SectionName,
                   t.PageReference = s.PageReference,
                   t.DisplayOrder = s.DisplayOrder,
                   t.SectionSlug = s.SectionSlug;

END;
GO
