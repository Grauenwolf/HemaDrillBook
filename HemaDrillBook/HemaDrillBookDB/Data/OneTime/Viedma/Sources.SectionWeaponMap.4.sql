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
    (843, 4002, 20, NULL),
    (844, 4003, 20, NULL),
    (845, 4004, 20, NULL);
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
        UPDATE SET SectionKey = s.SectionKey,
                   PrimaryWeaponKey = s.PrimaryWeaponKey,
                   SecondaryWeaponKey = s.SecondaryWeaponKey;

    SET IDENTITY_INSERT Sources.SectionWeaponMap OFF;
END;
GO
