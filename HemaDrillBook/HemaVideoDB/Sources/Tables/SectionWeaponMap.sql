CREATE TABLE Sources.SectionWeaponMap
(
	SectionWeaponMapKey INT NOT NULL IDENTITY CONSTRAINT PK_SectionWeaponMap PRIMARY KEY,
	SectionKey INT NOT NULL 
        CONSTRAINT FK_SectionWeaponMap_SectionKey
        REFERENCES Sources.Section (SectionKey),
	PrimaryWeaponKey INT NOT NULL CONSTRAINT FK_SectionWeaponMap_PrimaryWeapon REFERENCES Tags.Weapon(WeaponKey),
	SecondaryWeaponKey INT NULL CONSTRAINT FK_SectionWeaponMap_SecondaryWeapon REFERENCES Tags.Weapon(WeaponKey),
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Sources.SectionWeaponMap_History) );
