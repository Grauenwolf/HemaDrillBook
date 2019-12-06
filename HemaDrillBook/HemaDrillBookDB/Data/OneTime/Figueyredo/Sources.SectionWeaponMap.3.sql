IF $(OneTimeLoad) = 1
BEGIN

    DECLARE @SectionWeaponMap TABLE
    (
        SectionWeaponMapKey INT NOT NULL PRIMARY KEY,
        SectionKey INT NOT NULL,
        PrimaryWeaponKey INT NOT NULL,
        SecondaryWeaponKey INT NULL
    );

    INSERT INTO @SectionWeaponMap
    (
        SectionWeaponMapKey,
        SectionKey,
        PrimaryWeaponKey,
        SecondaryWeaponKey
    )
    VALUES
    (809, 3002, 20, NULL),
    (810, 3003, 20, NULL),
    (811, 3004, 20, NULL),
    (812, 3005, 20, NULL),
    (813, 3006, 20, NULL),
    (814, 3007, 20, NULL),
    (815, 3008, 20, NULL),
    (816, 3009, 20, NULL),
    (817, 3010, 20, NULL),
    (818, 3011, 20, NULL),
    (819, 3012, 20, NULL),
    (820, 3013, 20, NULL),
    (821, 3014, 20, NULL),
    (822, 3015, 20, NULL),
    (823, 3016, 20, NULL),
    (824, 3017, 20, NULL),
    (825, 3018, 20, NULL),
    (826, 3019, 20, NULL),
    (827, 3020, 20, NULL),
    (828, 3021, 20, NULL),
    (829, 3022, 20, NULL),
    (830, 3023, 20, NULL),
    (831, 3024, 20, NULL),
    (832, 3025, 20, NULL),
    (833, 3026, 20, NULL),
    (834, 3027, 20, NULL),
    (835, 3028, 20, NULL),
    (836, 3029, 20, NULL),
    (837, 3030, 20, NULL),
    (838, 3031, 20, NULL),
    (839, 3032, 20, NULL),
    (840, 3033, 20, NULL),
    (841, 3034, 20, NULL);



    SET IDENTITY_INSERT Sources.SectionWeaponMap ON;


    MERGE INTO Sources.SectionWeaponMap t
    USING @SectionWeaponMap s
    ON t.SectionWeaponMapKey = s.SectionWeaponMapKey
    WHEN NOT MATCHED THEN
        INSERT
        (
            SectionWeaponMapKey,
            SectionKey,
            PrimaryWeaponKey,
            SecondaryWeaponKey
        )
        VALUES
        (s.SectionWeaponMapKey, s.SectionKey, s.PrimaryWeaponKey, s.SecondaryWeaponKey)
    WHEN MATCHED THEN
        UPDATE SET t.SectionKey = s.SectionKey,
                   t.PrimaryWeaponKey = s.PrimaryWeaponKey,
                   t.SecondaryWeaponKey = s.SecondaryWeaponKey;

    SET IDENTITY_INSERT Sources.SectionWeaponMap OFF;
END;
GO
