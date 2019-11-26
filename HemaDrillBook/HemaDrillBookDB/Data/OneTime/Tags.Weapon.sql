
DECLARE @Weapon TABLE
(
WeaponKey int PRIMARY KEY,
WeaponName nvarchar(100)

);

INSERT INTO @Weapon
(  WeaponKey,
WeaponName )
VALUES

(1, N'Rapier'),
(2, N'Sidesword'),
(3, N'Arming Sword'),
(4, N'Longsword'),
(5, N'Rapier and Buckler'),
(6, N'Sidesword and Small Buckler'),
(7, N'Arming Sword and Buckler'),
(8, N'Dagger'),
(9, N'Wrestling'),
(10, N'Rapier and Dagger'),
(12, N'Sidesword and Dagger'),
(13, N'Pike'),
(14, N'Halberd'),
(15, N'Quarterstaff'),
(16, N'Dussack'),
(17, N'Rapier and Cloak'),
(18, N'Sidesword and Cloak'),
(19, N'Partisan'),
(20, N'Greatsword'),
(21, N'Sidesword and Rotella'),
(22, N'Rapier and Rotella'),
(23, N'Partisan and Rotella'),
(24, N'Spiedo'),
(25, N'Ronca'),
(26, N'Spear'),
(27, N'Short-staff'),
(28, N'Sidesword and Targa'),
(29, N'Rapier and Targa'),
(30, N'Sidesword and Large Buckler'),
(31, N'Two Sideswords'),
(32, N'Two Rapier'),
(33, N'Baton'),
(34, N'Longsword in Armor'),
(35, N'Axe in Armor'),
(36, N'Dagger and Staff'),
(37, N'Pair of Clubs'),
(38, N'Mounted Lance'),
(39, N'Mounted Sword'),
(40, N'Mounted Grappling')

;

SET IDENTITY_INSERT Tags.Weapon ON;

MERGE INTO Tags.Weapon t
USING @Weapon s
ON t.WeaponKey = s.WeaponKey
WHEN NOT MATCHED THEN
    INSERT
(  WeaponKey,
WeaponName )
    VALUES
    (  s.WeaponKey,
s.WeaponName )
WHEN MATCHED THEN
    UPDATE SET  WeaponName = s.WeaponName;

SET IDENTITY_INSERT Tags.Weapon OFF;

