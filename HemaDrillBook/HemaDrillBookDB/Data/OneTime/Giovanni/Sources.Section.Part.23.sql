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
    (6110, 23, NULL, N'The Fourth Day of the First Book Dealing with the Dagger', NULL, 4, 'Day-4'),
    (6111, 23, 6110, N'Way of putting oneself in guard with the sword and dagger', NULL, 1, 'Putting-oneself-in-guard'),
    (6112, 23, 6110, N'Defense and offense of the sword and dagger together', NULL, 2, 'Defense-and-offense'),
    (6113, 23, 6112, N'Sword in coda lunga stretta, and your dagger in cinghiale porta di ferro', NULL, 1, 'Coda-lunga-stretta-cinghiale'),
    (6114, 23, 6113, N'Mandritto to Head', NULL, 1, 'Coda-lunga-stretta-cinghiale-1'),
    (6115, 23, 6113, N'Mandritto to Leg', NULL, 2, 'Coda-lunga-stretta-cinghiale-2'),
    (6116, 23, 6113, N'Riverso to Head', NULL, 3, 'Coda-lunga-stretta-cinghiale-3'),
    (6117, 23, 6113, N'Riverso to Leg', NULL, 4, 'Coda-lunga-stretta-cinghiale-4'),
    (6118, 23, 6113, N'Overhand Thrust', NULL, 5, 'Coda-lunga-stretta-cinghiale-5'),
    (6119, 23, 6113, N'Stoccata', NULL, 6, 'Coda-lunga-stretta-cinghiale-6'),
    (6120, 23, 6112, N'Sword in coda lunga alta and your dagger in porta di ferro alta', NULL, 2, 'Coda-lunga-alta-porta-di-ferro-alta'),
    (6121, 23, 6120, N'Mandritto to Head', NULL, 1, 'Coda-lunga-alta-porta-di-ferro-alta-1'),
    (6122, 23, 6120, N'Mandritto to Leg', NULL, 2, 'Coda-lunga-alta-porta-di-ferro-alta-2'),
    (6123, 23, 6120, N'Riverso to Head', NULL, 3, 'Coda-lunga-alta-porta-di-ferro-alta-3'),
    (6124, 23, 6120, N'Riverso to Leg', NULL, 4, 'Coda-lunga-alta-porta-di-ferro-alta-4'),
    (6125, 23, 6120, N'Imbroccata to the Chest', NULL, 5, 'Coda-lunga-alta-porta-di-ferro-alta-5'),
    (6126, 23, 6120, N'Underhand Thrust', NULL, 6, 'Coda-lunga-alta-porta-di-ferro-alta-6'),
    (6127, 23, 6112, N'Sword in porta di ferro stretta and dagger in coda lunga alta', NULL, 3, 'Porta-di-ferro-stretta-coda-lunga-alta'),
    (6128, 23, 6127, N'Mandritto to Head', NULL, 1, 'Porta-di-ferro-stretta-coda-lunga-alta-1'),
    (6129, 23, 6127, N'Mandritto to Leg', NULL, 2, 'Porta-di-ferro-stretta-coda-lunga-alta-2'),
    (6130, 23, 6127, N'Riverso to Head', NULL, 3, 'Porta-di-ferro-stretta-coda-lunga-alta-3'),
    (6131, 23, 6127, N'Riverso to Leg', NULL, 4, 'Porta-di-ferro-stretta-coda-lunga-alta-4'),
    (6132, 23, 6127, N'Imbroccata to the Chest', NULL, 5, 'Porta-di-ferro-stretta-coda-lunga-alta-5'),
    (6133, 23, 6127, N'Stoccata to the Face', NULL, 6, 'Porta-di-ferro-stretta-coda-lunga-alta-6'),
    (6134, 23, 6112, N'Sword in cinghiale porta di ferro and your dagger in guardia di testa', NULL, 4, 'cinghiale-guardia-di-testa'),
    (6135, 23, 6134, N'Mandritto to Head', NULL, 1, 'cinghiale-guardia-di-testa-1'),
    (6136, 23, 6134, N'Mandritto to Leg', NULL, 2, 'cinghiale-guardia-di-testa-2'),
    (6137, 23, 6134, N'Riverso to Head', NULL, 3, 'cinghiale-guardia-di-testa-3'),
    (6138, 23, 6134, N'Riverso to Leg', NULL, 4, 'cinghiale-guardia-di-testa-4'),
    (6139, 23, 6134, N'Imbroccata to the Chest', NULL, 5, 'cinghiale-guardia-di-testa-5'),
    (6140, 23, 6134, N'Stoccata to the Face', NULL, 6, 'cinghiale-guardia-di-testa-6'),
    (6141, 23, 6112, N'Guardia d’alicorno with the right foot forward, your dagger is in cinghiale porta di ferro', NULL, 5, 'Guardia-d''alicorno-cinghiale'),
    (6142, 23, 6141, N'Mandritto to Head', NULL, 1, 'Guardia-d''alicorno-cinghiale-1'),
    (6143, 23, 6141, N'Mandritto to Leg', NULL, 2, 'Guardia-d''alicorno-cinghiale-2'),
    (6144, 23, 6141, N'Riverso to Head', NULL, 3, 'Guardia-d''alicorno-cinghiale-3'),
    (6145, 23, 6141, N'Riverso to Leg', NULL, 4, 'Guardia-d''alicorno-cinghiale-4'),
    (6146, 23, 6141, N'Overhand Thrust', NULL, 5, 'Guardia-d''alicorno-cinghiale-5'),
    (6147, 23, 6141, N'Stoccata to the Face', NULL, 6, 'Guardia-d''alicorno-cinghiale-6'),
    (6148, 23, 6112, N'Guardia d’alicorno with the left foot forward, your dagger is in porta di ferro alta', NULL, 6, 'Guardia-d''alicorno-alta'),
    (6149, 23, 6148, N'Mandritto to Head', NULL, 1, 'Guardia-d''alicorno-alta-1'),
    (6150, 23, 6148, N'Mandritto to Leg', NULL, 2, 'Guardia-d''alicorno-alta-2'),
    (6151, 23, 6148, N'Imbroccata to the Face', NULL, 3, 'Guardia-d''alicorno-alta-3'),
    (6152, 23, 6148, N'Stoccata to the Face', NULL, 4, 'Guardia-d''alicorno-alta-4'),
    (6153, 23, 6112, N'Sword in coda lunga stretta and your dagger in cinghiale porta di ferro <alta>', NULL, 7, 'Coda-lunga-stretta-cinghiale-alta'),
    (6154, 23, 6153, N'Punta riversa to the Face', NULL, 1, 'Coda-lunga-stretta-cinghiale-alta-1'),
    (6155, 23, 6153, N'Stoccata to the Flank', NULL, 2, 'Coda-lunga-stretta-cinghiale-alta-2'),
    (6156, 23, 6153, N'Feints a Riverso to the Head', NULL, 3, 'Coda-lunga-stretta-cinghiale-alta-3'),
    (6157, 23, 6153, N'Mandritto to Head (or leg)', NULL, 4, 'Coda-lunga-stretta-cinghiale-alta-4'),
    (6158, 23, 6153, N'False Thrust to the Face', NULL, 5, 'Coda-lunga-stretta-cinghiale-alta-5'),
    (6159, 23, 6153, N'Mandritto', NULL, 6, 'Coda-lunga-stretta-cinghiale-alta-6'),
    (6160, 23, 6153, N'Mandritto, or a riverso, or a thrust', NULL, 7, 'Coda-lunga-stretta-cinghiale-alta-7'),
    (6161, 23, 6110, N'The way to provoke and wound an enemy who doesn’t want to throw any blows', NULL, 3, 'Provocations'),
    
	
	(6162, 23, 6161, N'Provocation 1: Swords in coda lunga stretta and daggers in cinghiale porta di ferro', NULL, 1, 'Provocation-1'),
    (6163, 23, 6162, N'Falso and mandritto on his sword', NULL, 1, 'Provocation-1-1'),
    (6164, 23, 6162, N'Tramazzone to his right hand', NULL, 2, 'Provocation-1-2'),
    (6165, 23, 6162, N'Falso to his hands from beneath', NULL, 3, 'Provocation-1-3'),
    (6166, 23, 6162, N'False thrust to his face', NULL, 4, 'Provocation-1-4'),
    (6167, 23, 6162, N'Punta riversa to his face ', NULL, 5, 'Provocation-1-5'),
    (6168, 23, 6162, N'Stoccata to his ches', NULL, 6, 'Provocation-1-6'),
    (6169, 23, 6162, N'Press him by pulling your left foot near your right ', NULL, 7, 'Provocation-1-7'),
    
	(6170, 23, 6161, N'Provocation 2: Swords in coda lunga alta and daggers in porta di ferro', NULL, 2, 'Provocation-2'),
    (6171, 23, 6170, N'Falso dritto or two directed toward his dagger hand', NULL, 1, 'Provocation-2-1'),
    (6172, 23, 6170, N'Mezzo mandritto to his dagger hand', NULL, 2, 'Provocation-2-2'),
    (6173, 23, 6170, N'False thrust to his face', NULL, 3, 'Provocation-2-3'),
    (6174, 23, 6170, N'False thrust, and false mandritto', NULL, 4, 'Provocation-2-4'),
    
	(6175, 23, 6161, N'Provocation 3: Swords in porta di ferro stretta and daggers in coda lunga alta', NULL, 3, 'Provocation-3'),
    (6176, 23, 6175, N'Hit the false edge of your sword against that of the enemy', NULL, 1,      'Provocation-3-1'),
    (6177, 23, 6175, N'Punta riversa to his face, left foot', NULL, 2, 'Provocation-3-2'),
    (6178, 23, 6175, N'Punta riversa to his face, rigt foot', NULL, 3, 'Provocation-3-3'),
    (6179, 23, 6175, N'Two punte riverse', NULL, 4, 'Provocation-3-4'),
    
	(6180, 23, 6161, N'Provocation 4: Swords in cinghiale porta di ferro and daggers in guardia di testa', NULL, 4, 'Provocation-4'),
    (6181, 23, 6180, N'Thrust to his face w/riverso', NULL, 1, 'Provocation-4-1'),
    (6182, 23, 6180, N'Thrust to his face w/mandritti to his head', NULL, 2, 'Provocation-4-2'),
    (6183, 23, 6180, N'dritto tramazzone to his sword arm', NULL, 3, 'Provocation-4-3'),
    (6184, 23, 6180, N'punta riversa to his face', NULL, 4, 'Provocation-4-4'),
    
	(6185, 23, 6161, N'Provocation 5: Swords in guardia d’alicorno and daggers in cinghiale porta di ferro', NULL, 5, 'Provocation-5'),
    (6186, 23, 6185, N'Imbroccata to the dagger hand', NULL, 1, 'Provocation-5-1'),
    (6187, 23, 6185, N'Overhand thrust', NULL, 2, 'Provocation-5-2'), 
	
	(6188, 23, 6161, N'Provocation 6: Swords in alicorno with the left foot forward and daggers in porta di ferro alta', NULL, 6, 'Provocation-6'),
    (6189, 23, 6188, N'Draw your right foot near your left one', NULL, 1, 'Provocation-6-1');


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
