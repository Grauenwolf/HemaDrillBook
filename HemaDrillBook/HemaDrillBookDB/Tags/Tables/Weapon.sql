﻿CREATE TABLE Tags.Weapon
(
    WeaponKey INT NOT NULL IDENTITY
        CONSTRAINT PK_Weapon PRIMARY KEY,
    WeaponName NVARCHAR(100) NOT NULL
        CONSTRAINT UX_Weapon_WeaponName
        UNIQUE,
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Tags.Weapon_History) );
GO
GRANT SELECT ON Tags.Weapon TO HemaWeb;