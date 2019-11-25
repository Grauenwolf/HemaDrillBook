
DECLARE @Weapon TABLE
(
    WeaponKey INT NOT NULL PRIMARY KEY,
    WeaponName NVARCHAR(100) NOT NULL
);

INSERT INTO @Weapon
(
    WeaponKey,
    WeaponName
)
VALUES
(1, 'Rapier'),
(2, 'Sidesword'),
(3, 'Arming Sword'),
(4, 'Longsword'),
(5, 'Rapier and Buckler'),
(6, 'Sidesword and Small Buckler'),
(7, 'Arming Sword and Buckler'),
(8, 'Dagger'),
(9, 'Grappling/Wrestling'),
(10, 'Rapier and Dagger'),
(12, 'Sidesword and Dagger'),
(13, 'Pike'),
(14, 'Halberd'),
(15, 'Quarterstaff'),
(16, 'Dussack'),
(17, 'Rapier and Cloak'),
(18, 'Sidesword and Cloak'),
(19, 'Partisan'),
(20, 'Greatsword'),
(21, 'Sidesword and Rotella'),
(22, 'Rapier and Rotella'),
(23, 'Partisan and Rotella'),
(24, 'Spiedo'),
(25, 'Ronca'),
(26, 'Spear'),
(27, 'Short-staff'),
(28, 'Sidesword and Targa'),
(29, 'Rapier and Targa'),
(30, 'Sidesword and Large Buckler'),
(31, 'Two Sideswords'),
(32, 'Two Rapier'),
(33, 'Baton'),
(34, 'Longsword in Armor'),
(35, 'Axe in Armor'),
(36, 'Dagger and Staff'),
(37, 'Pair of Clubs'),
(38, 'Mounted Lance'),
(39, 'Mounted Sword'),
(40, 'Mounted Grappling');



MERGE INTO Tags.Weapon t
USING @Weapon s
ON t.WeaponKey = s.WeaponKey
WHEN NOT MATCHED THEN
    INSERT
    (
        WeaponKey,
        WeaponName
    )
    VALUES
    (s.WeaponKey, s.WeaponName)
WHEN MATCHED AND t.WeaponName = s.WeaponName THEN
    UPDATE SET WeaponName = s.WeaponName;